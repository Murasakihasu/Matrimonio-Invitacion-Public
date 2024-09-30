<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="/css/guestLocation.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Ubicación</title>
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
	<h1>Direcciones</h1>
	<article id="trans1" class="noTransLeft">
		<c:forEach items="${event.location}" var="loc" varStatus="status">
			<section>
				<div>
					<div class="mapBox">
						<div id="map${loc.id}" style="width: 100%; height: 100%;"></div>
					</div>
				</div>
				<div class="content">
					<h2>${loc.name}</h2>
					<p>${loc.place}</p>
					<p><fmt:formatDate value="${loc.time}" pattern="HH:mm"/> Hrs.</p>
				</div>
			</section>
		</c:forEach>
	</article>
</main>

<div class="vertical">
	<h1><ion-icon name="reload-outline"></ion-icon>Por favor usa el dispositivo de forma Horizontal para una mejor experiencia</h1>
</div>

<script>
function initMaps() {
	<c:forEach items="${event.location}" var="loc" varStatus="status">
     	var latLng = {lat: parseFloat(${loc.latitud}), lng: parseFloat(${loc.longitud})};
        var map = new google.maps.Map(document.getElementById('map${loc.id}'), {
			zoom: 17,
            center: latLng
        });

        var marker = new google.maps.Marker({
          	position: latLng,
            map: map,
            title: '${loc.name}'
        });
    </c:forEach>
}

window.onload = function() {
	var script = document.createElement('script');
    script.src = "https://maps.googleapis.com/maps/api/js?key=YOUR-KEY&callback=initMaps&libraries=marker";
    script.async = true;
    script.defer = true;
    document.head.appendChild(script);
};
</script>
<script src="/js/guest.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>