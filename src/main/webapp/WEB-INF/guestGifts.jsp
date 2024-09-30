<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/guestGifts.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Regalos</title>
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
	<h1>Regalos</h1>
	<article>
		<section id="trans1" class="tarjeta1 noTransLeft">
			<h2>Queridos amigos y familiares,</h2>
			<c:choose>
				<c:when test="${event.giftsType eq 'Dinero'}">
					<p>La casa está armada, asi que no se compliquen. Ahora si quieren colaborar con la luna de miel, les dejamos esta cuenta</p>
				</c:when>
				<c:when test="${event.giftsType eq 'Artículos de casa'}">
					<p>Estamos muy emocionados de compartir nuestra boda con todos ustedes y agradecemos de corazón su 
					cariño y apoyo. Sabemos que hoy en día muchos optan por contribuir con dinero, pero para nosotros, 
					los regalos clásicos tienen un significado especial. Nos encanta la idea de recibir esos objetos que 
					formarán parte de nuestro hogar, cada uno con una historia y un recuerdo ligado a ustedes. Queremos 
					rodearnos de detalles que nos acompañen en nuestra vida juntos, recordándonos siempre el amor que nos
				 	brindan en este día tan importante.</p>
				</c:when>
			</c:choose>
			<p class="firma">Con cariño,</p>
			<p class="firma2">${event.name}</p>
		</section>
		<section class="tarjeta2">
			<c:choose>
				<c:when test="${event.giftsType eq 'Dinero'}">
					<h2>Datos de transferencia</h2>
					<div class="dataBox noTransLeft" id="trans2">
				   		<div class="hover">
				   			<h3>Nombre:</h3>
							<p>${event.bank.name}</p>
						</div>
						<div class="hover">
							<h3>Correo:</h3>
							<p>${event.bank.email}</p>
						</div>
				   		<div class="hover">
				   			<h3>Banco:</h3>
							<p>${event.bank.banco}</p>
						</div>
						<div class="hover">
							<h3>Rut:</h3>
							<p>${event.bank.rut}</p>
						</div>
				   		<div class="hover">
				   			<h3>Tipo de Cuenta:</h3>
							<p>${event.bank.tipoCuenta}</p>
						</div>
						<div class="hover">
							<h3>Número de cuenta:</h3>
							<p>${event.bank.numeroCuenta}</p>
						</div>
					</div>
				</c:when>
				<c:when test="${event.giftsType eq 'Artículos de casa'}">
					<h2>Necestiamos...</h2>
					<p id="trans2" class="articles noTransLeft">${event.gifts}</p>
				</c:when>
			</c:choose>
		</section>
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