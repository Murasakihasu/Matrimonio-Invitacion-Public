<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/guestImportant.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Info</title>
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
	<h1>Importante</h1>
	<article>
		<c:forEach items="${event.important}" var="imp" varStatus="status">
			<c:if test="${status.index % 2 == 0}">
				<section class="tarjeta1">
					<div>
						<div class="icon">
							<ion-icon name="diamond-outline"></ion-icon>
						</div>
					</div>
					<div class="content">
						<h2>${imp.title}</h2>
						<p>${imp.info}</p>
					</div>
				</section>
			</c:if>
			<c:if test="${status.index % 2 != 0}">
				<section class="tarjeta2">
					<div class="content">
						<h2>${imp.title}</h2>
						<p>${imp.info}</p>
					</div>
					<div>
						<div class="icon">
							<ion-icon name="bulb-outline"></ion-icon>
						</div>
					</div>
				</section>
			</c:if>
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