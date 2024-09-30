<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/userEvent.css" rel="stylesheet">
<meta charset="UTF-8">
<title>${event.name}</title>
</head>
<body>
<svg width="100%" height="200px" id="svg" viewBox="0 0 1440 200" xmlns="http://www.w3.org/2000/svg" class="transition duration-300 ease-in-out delay-150">
    <path d="M 0,200 L 0,50 C 89.89487179487182,41.57948717948717 179.78974358974364,33.15897435897435 266,32 C 352.21025641025636,30.84102564102565 434.7358974358973,36.94358974358975 516,37 C 597.2641025641027,37.05641025641025 677.2666666666667,31.06666666666669 753,41 C 828.7333333333333,50.93333333333331 900.197435897436,76.78974358974358 973,83 C 1045.802564102564,89.21025641025642 1119.9435897435897,75.77435897435898 1198,67 C 1276.0564102564103,58.22564102564102 1358.0282051282052,54.11282051282052 1440,50 L 1440,200 L 0,200 Z" stroke="none" stroke-width="0" fill="#fce2c7" fill-opacity="0.53" class="transition-all duration-300 ease-in-out delay-150 path-0" transform="rotate(-180 720 100)"></path>
    <path d="M 0,200 L 0,133 C 83.74102564102563,113.87948717948717 167.48205128205126,94.75897435897437 251,98 C 334.51794871794874,101.24102564102563 417.8128205128205,126.84358974358975 498,148 C 578.1871794871795,169.15641025641025 655.2666666666667,185.8666666666667 730,175 C 804.7333333333333,164.1333333333333 877.1205128205128,125.68974358974359 949,115 C 1020.8794871794872,104.31025641025641 1092.251282051282,121.37435897435898 1174,129 C 1255.748717948718,136.62564102564102 1347.874358974359,134.8128205128205 1440,133 L 1440,300 L 0,300 Z" stroke="none" stroke-width="0" fill="#fce2c7" fill-opacity="1" class="transition-all duration-300 ease-in-out delay-150 path-1" transform="rotate(-180 720 100)"></path>
</svg>
<main>
	<header>
		<h1>${event.name}</h1>
		<p>Recuerda agregar el lugar, las invitaciones con los invitados
		e información importante que te gustaría que se supiera.</p>
	</header>
			
	<%--Fecha y hora --%>
			
	<article class="col3">
  		<figure>
	  		<h2>Fecha:</h2>
	  		<p><fmt:formatDate value="${event.date}" pattern="dd-MM-yyyy" /></p>
  		</figure>
		<figure>
			<h2>Inicio:</h2>
			<p><fmt:formatDate value="${event.start}" pattern="HH:mm" /></p>
		</figure>
		<figure>
			<h2>Término:</h2>
			<p><fmt:formatDate value="${event.end}" pattern="HH:mm" /></p>
		</figure>
	</article>
			
	<%--Ubicación --%>
	
	<%-- Mostrar Ubicación --%>
		
	<article class="col1">
		<figure>
			<h2>Ubicaciones</h2>
			<c:if test="${empty event.location}">
        		<p class="empty">Aún no has agregado lugares</p>
   			</c:if>
   			<c:forEach items="${event.location}" var="loc">
				<section class="hover relative">
					<form:form action="/user/${user.id}/event/${event.id}/location/${loc.id}/delete" method="POST">
						<input type="hidden" name="_method" value="DELETE"/>
						<button class="delete">
							<ion-icon name="trash-outline"></ion-icon>
						</button>
					</form:form>
					<h3>${loc.name}</h3>
					<p>${loc.place}</p>
				</section>
			</c:forEach>
   		</figure>
   	</article>
   					
   	<%--Crear Ubicación--%>		
   	
   	<article class="col1">
   		<figure>
   			<h2>Agregar Ubicación</h2>	
			<form:form class="form" action="/user/${user.id}/event/${event.id}/location/create" method="POST" modelAttribute="location">
				<div>
					<form:label class="form-label" path="name">
						<p>Nombre del lugar</p> 
						<span class="span">(Ej: Centro religioso, salón de eventos, recepción, etc.)</span>
					</form:label>
					<form:input class="form-control" path="name" type= "text" name ="name"/>
					<form:errors path="name"/>
				</div>
				<div>
					<form:label class="form-label" path="time">Hora de inicio:</form:label>
					<form:input class="form-control time" path="time" type="time" name ="time"/>
					<form:errors path="time"/>
				</div>
				<div>
    				<form:label class="form-label mt-4" path="place">Dirección:</form:label>
    				<form:input class="form-control" path="place" type="text" name="place" id="place-input"/>
    				<form:errors path="place"/>
    			<div class="buttonBox">
    				<button type="button" id="buscar-btn" class="btn button1 mt-2 mb-2">Buscar en el mapa</button>
  				</div>
  				</div>
					<div id="map" style="height:400px; width:100%;"></div>
					<input type="hidden" id="lat" name="latitud">
      				<input type="hidden" id="lng" name="longitud">
      				<p class="piePag">Mueve el marcador para seleccionar la ubicación exacta</p>
				<div class="buttonBox">
					<button class="btn button1 mt-4">Añadir dirección</button>
				</div>
			</form:form>	
		</figure>	
	</article>
			
	<%--fotos y regalo--%>
	
	<article class="col2">
		<figure class="photos">
			<h2>Fotos</h2>
			<a href="${event.photos}">Enlace al portal de Fotos</a>
			<p>${event.photos}</p>
		</figure>
		<figure>
			<h2>Tipo de regalo</h2>
			<c:choose>
				<c:when test="${event.giftsType eq 'Dinero'}">
					<p>Aporte Monetario</p>
				</c:when>
				<c:otherwise>
					<p>Artícuos de casa</p>
				</c:otherwise>
			</c:choose>
		</figure>
	</article>
			
	<%-- Regalos Dinero --%>
	
	<c:choose>
    	<c:when test="${event.giftsType eq 'Dinero'}">
			<article class="col1">
				<figure class="bank relative">
					<h2>Datos de Transferencia</h2>
					
					<%--mostrar datos trasferencia--%>
					
					<c:if test="${not empty event.bank}">
   						<form:form action="/user/${user.id}/event/${event.id}/bank/${event.bank.id}/delete" method="POST">
							<input type="hidden" name="_method" value="DELETE"  />
							<button class="boton-como-enlace delete"><ion-icon class="delete" name="trash-outline"></ion-icon></button>
						</form:form>
   						<section class="col2">
   							<div class="hover">
   								<h3>Nombre</h3>
								<p>${event.bank.name}</p>
							</div>
							<div class="hover">
								<h3>Correo</h3>
								<p>${event.bank.email}</p>
							</div>
						</section>
						<section class="col2">
   							<div class="hover">
   								<h3>Banco</h3>
								<p>${event.bank.banco}</p>
							</div>
							<div class="hover">
								<h3>Rut</h3>
								<p>${event.bank.rut}</p>
							</div>
						</section>
						<section class="col2">
   							<div class="hover">
   								<h3>Tipo de Cuenta</h3>
								<p>${event.bank.tipoCuenta}</p>
							</div>
							<div class="hover">
								<h3>Número de cuenta</h3>
								<p>${event.bank.numeroCuenta}</p>
							</div>
						</section>
					</c:if>
					
					<%--Crear datos trasferencia--%>
					
					<c:if test="${empty event.bank}">
        				<p class="empty">Aún no has agregado datos de trasferencia</p>
        				<form:form class="form" action="/user/${user.id}/event/${event.id}/bank/create" method="POST" modelAttribute="bank">
        					<div>
								<form:label class="form-label" path="name">Nombre Completo:</form:label>
								<form:input class="form-control" path="name" type= "text" name ="name"/>
								<form:errors path="name"/>
							</div>
							<div>
								<form:label class="form-label mt-4" path="email">Email:</form:label>
								<form:input class="form-control" path="email" type= "email" name ="email"/>
								<form:errors path="email"/>
							</div>
							<div>
								<form:label class="form-label mt-4" path="rut">Rut:</form:label>
								<form:input class="form-control" path="rut" type= "text" name ="rut"/>
								<form:errors path="rut"/>
							</div>
							<div>
								<form:label class="form-label mt-4" path="banco">Banco:</form:label>
								<form:input class="form-control" path="banco" type= "text" name ="banco"/>
								<form:errors path="banco"/>
							</div>
							<div>
								<form:label class="form-label mt-4" path="tipoCuenta">Tipo de Cuenta:</form:label>
								<form:input class="form-control" path="tipoCuenta" type= "text" name ="tipoCuenta"/>
								<form:errors path="tipoCuenta"/>
							</div>
							<div>
								<form:label class="form-label mt-4" path="numeroCuenta">Número de Cuenta:</form:label>
								<form:input class="form-control" path="numeroCuenta" type= "text" name ="numeroCuenta"/>
								<form:errors  path="numeroCuenta"/>
							</div>
							<div class="buttonBox">
								<button class="btn button1 mt-4">Añadir datos</button>
							</div>
        				</form:form>
   					</c:if>
				</figure>
    		</article>
    	</c:when>
    			
    	<%--Regalos Objetos--%>
    	
    	<c:when test="${event.giftsType eq 'Artículos de casa'}">
        	<article class="col1">
				<figure>
					<h2>Regalos</h2>
					<c:if test="${empty event.gifts}">
						<p class="empty">Olvidaste agregar información de los regalos para tus invitados!</p>
						<p class="empty">Esto ayudará a tus invitados a escoger mejor con qué sorprenderte.</p>
						<p class="empty">Para agregar información ve a "editar evento"</p>
						<a class="button1" href="/user/${user.id}/event/${event.id}/edit">
							<ion-icon name="create-outline"></ion-icon>Editar evento
						</a>
					</c:if>
					<c:if test="${not empty event.gifts}">
						<p>${event.gifts}</p>
					</c:if>
				</figure>
			</article>
    	</c:when>
	</c:choose>
			
	<%--Invitados total--%>
			
	<article class="col2">
		<figure>
			<h2>Total de invitados</h2>
			<c:if test="${event.totalGuests == 0}">
    			<p class="empty">Aún no has agregado invitados</p>
			</c:if>
			<c:if test="${event.totalGuests != 0}">
    			<p>${event.totalGuests}</p>
			</c:if>	
		</figure>
		<figure>
			<h2>Confirmados</h2>
			<c:if test="${event.totalConfirm == 0}">
    			<p class="empty">No hay invitados confirmados</p>
			</c:if>
			<c:if test="${event.totalConfirm != 0}">
    			<p>${event.totalConfirm}</p>
			</c:if>
		</figure>
	</article>
			
	<%--lista de invitados--%>
			
	<article class="col1">
		<figure>
			<h2>Lista de Invitaciones</h2>
			<c:if test="${empty event.invitations}">
    			<p class="empty">Aún no has agregado invitaciones</p>
			</c:if>
			<c:if test="${not empty event.invitations}">
				<table class="invTable table">
					<tr>
						<th>Invitación</th>
						<th>Enlace de la Invitación</th>
					</tr>
					<c:forEach items="${event.invitations}" var="inv" varStatus="status">
    					<tr>
        					<td>${inv.title}</td>
        					<td class="link">
            					<div>
                					<label for="copiable${status.index}"></label>
                					<input type="text" id="copiable${status.index}" value="https://weddinginvitation.up.railway.app/InvitationSend/${user.id}/event/${event.id}/Invitation/${inv.codigo}" readonly>
                					<button onclick="copiarTexto(${status.index})" id="liveAlertBtn${status.index}"><ion-icon name="copy-outline"></ion-icon></button>
                					<div id="copiado${status.index}" class="noCopiado">
                    					<ion-icon name="checkmark-outline"></ion-icon>
                    					<p>Copiado</p>
                					</div>
            					</div>
            					<a href="/InvitationSend/${user.id}/event/${event.id}/Invitation/${inv.codigo}">
            						Vista Previa
            						<ion-icon name="arrow-redo-outline"></ion-icon>
            					</a>
        					</td>
    					</tr>
					</c:forEach>
				</table>
			</c:if>
			<a href="/user/${user.id}/event/${event.id}/invitation" class="button1">
				<ion-icon name="add-circle-outline"></ion-icon>
				Agregar Invitaciones // Invitados
			</a>
		</figure>
	</article>
	
	<%--Info importante--%>
	
	<%--Crear importante--%>
	
	<article class="col1">
		<figure>
			<h2>Información importante</h2>
			<c:if test="${empty event.important}">
        		<p class="empty">Aún no has agregado Información importante</p>
   			</c:if>
   			<form:form class="form" action="/user/${user.id}/event/${event.id}/important/create" method="POST" modelAttribute="important">
        		<div>
					<form:label class="form-label" path="title">Título:</form:label>
					<form:input class="form-control" path="title" type= "text" name ="title"/>
					<form:errors path="title"/>
				</div>
				<div>
					<form:label class="form-label mt-4" path="info">Descripción:</form:label>
					<form:textarea class="form-control" path="info" type= "text" name ="info"/>
					<form:errors path="info"/>
				</div>
				<div class="buttonBox mt-4">
					<button class="button3">Añadir</button>
				</div>
			</form:form>
		</figure>
			
		<%--Mostrar importante--%>
		
		<c:forEach items="${event.important}" var="imp">
			<figure class="hover imp">	
				<form:form action="/user/${user.id}/event/${event.id}/important/${imp.id}/delete" method="POST">
					<input type="hidden" name="_method" value="DELETE"  />
					<button class="delete"><ion-icon class="delete" name="trash-outline"></ion-icon></button>
				</form:form>
				<h2>${imp.title}</h2>
				<p>${imp.info}</p>
			</figure>
		</c:forEach>
	</article>
	
	<%--Botones Footer--%>
	
	<footer>
		<a class="button1" href="/user/${user.id}/event/${event.id}/edit">
			<ion-icon name="create-outline"></ion-icon>
			Editar evento
		</a>
		<form:form class="logout" action="/logout" method="POST">
			<input type="hidden" name="_method" value="PUT"/>
			<button class="button1"><ion-icon name="exit-outline"></ion-icon>Cerrar Sesión</button>
		</form:form>
	</footer>
</main>

<script src="/js/event.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script async src="https://maps.googleapis.com/maps/api/js?key=YOUR-KEY&callback=initMap" defer></script>
</body>
</html>