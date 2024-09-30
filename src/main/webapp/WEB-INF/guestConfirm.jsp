<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/guestConfirm.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Confirmación</title>
</head>
<body>
<div class="barContainer">
	<div class="navigation">
		<ul class="navUl">
		<li class= "first">
				<a href="/InvitationSend/${user.id}/event/${event.id}/Invitation/${inv.codigo}" class="seleccion">
					<span class="icon"><ion-icon name="mail-outline"></ion-icon></span>
					<span class="title">Invitación</span>
				</a>
			</li>
			<li>
				<a href="/InvitationSend/${user.id}/event/${event.id}/Invitation/${inv.codigo}/confirm" class="seleccion">
					<span class="icon"><ion-icon name="checkmark-circle-outline"></ion-icon></span>
					<span class="title">Confirmar</span>
				</a>
			</li>
			<li>
				<a href="/InvitationSend/${user.id}/event/${event.id}/Invitation/${inv.codigo}/location" class="seleccion">
					<span class="icon"><ion-icon name="location-outline"></ion-icon></span>
					<span class="title">Ubicación</span>
				</a>
			</li>
			<li>
				<a href="/InvitationSend/${user.id}/event/${event.id}/Invitation/${inv.codigo}/photos" class="seleccion">
					<span class="icon"><ion-icon name="images-outline"></ion-icon></span>
					<span class="title">Fotos</span>
				</a>
			</li>
			<li>
				<a href="/InvitationSend/${user.id}/event/${event.id}/Invitation/${inv.codigo}/gifts" class="seleccion">
					<span class="icon"><ion-icon name="gift-outline"></ion-icon></span>
					<span class="title">Regalos</span>
				</a>
			</li>
			<li>
				<a href="/InvitationSend/${user.id}/event/${event.id}/Invitation/${inv.codigo}/important" class="seleccion">
					<span class="icon"><ion-icon name="trail-sign-outline"></ion-icon></span>
					<span class="title">Importante</span>
				</a>
			</li>
		</ul>
	</div>
</div>
<main class="main">
	<ion-icon name="list-outline" class="toggle"></ion-icon>
	<h1>Asistencia</h1>
	<article class="noTransLeft" id="trans1">
		 <c:forEach items="${inv.guests}" var="guest">
			<section>
				<h2>${guest.name}</h2>
				<c:choose>
		    		<c:when test="${guest.confirm == false}">
		    			<form:form action="/InvitationSend/${user.id}/event/${event.id}/Invitation/${inv.codigo}/confirm/${guest.id}" method="POST">
							<input type="hidden" name="_method" value="PUT"  />
							<button class="button1">Confirmar</button>
						</form:form>
		    		</c:when>
		   			<c:otherwise>
		   				<div class="confirmBox">
		        			<p class="confirm">Confirmado</p>
		        			<form:form class="cancel" action="/InvitationSend/${user.id}/event/${event.id}/Invitation/${inv.codigo}/delete/confirm/${guest.id}" method="POST">
								<input type="hidden" name="_method" value="DELETE"  />
								<button class="boton-como-enlace" type="submit" onclick="return confirmSubmit()"><ion-icon name="close-outline"></ion-icon></button>
							</form:form>
						</div>
		    		</c:otherwise>
				</c:choose>
			</section>
		</c:forEach>
	</article>
</main>

<div class="vertical">
	<h1><ion-icon name="reload-outline"></ion-icon>Por favor usa el dispositivo de forma Horizontal para una mejor experiencia</h1>
</div>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="/js/guest.js"></script>
</body>
</html>