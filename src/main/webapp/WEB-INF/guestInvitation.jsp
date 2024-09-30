<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="/css/guestInvitation.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Invitación</title>
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
	<div class="tarjeta1">
		<h1 id="trans9" class="noTrans2">¡Nos casamos!</h1>
	</div>
	
	
	<div class="tarjeta2">
		<h1 id="trans1" class="noTrans">${event.name}</h1>
		<div id="trans2" class="poem noTransUp">
			<p>Nos conocimos,<p>
			<p>Nos hicimos amigos,<p>
			<p>Nos enamoramos,<p>
			<p>y derrepente supimos que era el momento<p>
			<p>de estar juntos para siempre...<p>
		</div>
		<p>Nos gustaría compartir este momento con ustedes</p>
		<h2 id="trans3" class="noTrans">${inv.title}</h2>
	</div>
	
	
	<div class="tarjeta3">
		<h2 id="trans4" class="noTransLeft">Guarda el día</h2>
		<div class="imgBox">
			<img id="trans5" class="noTrans2" src="/img/img2.jpg" alt="img2">
		</div>
		<div id="trans8" class="date noTransLeft">
			<p id="diaSemana"></p>
			<h3 id="diaNumero"></h3>
			<p id="mes"></p>
		</div>
		<div id="trans7" class="location noTransLeft">
			<c:forEach items="${event.location}" var="loc">
			<p>${loc.name}</p>
			<p><fmt:formatDate value="${loc.time}" pattern="HH:mm"/> Hrs.</p>
			<p>${loc.place}</p>
			<a class="button1" href="/InvitationSend/${user.id}/event/${event.id}/Invitation/${inv.codigo}/location">
			<ion-icon name="location-outline"></ion-icon>Ver lugar
			</a>
			</c:forEach>
		</div>
	</div>
	
	
	<div class="tarjeta4">
		<p>¿Nos acompañarás?</p>
		<a class="button1" href="/InvitationSend/${user.id}/event/${event.id}/Invitation/${inv.codigo}/confirm">
		<ion-icon name="checkmark-circle-outline"></ion-icon>Confirmar</a>
		<h1 id="trans6" class="noTransUp">${event.name}</h1>
	</div>
</main>

<div class="vertical">
	<h1><ion-icon name="reload-outline"></ion-icon>Por favor usa el dispositivo de forma Horizontal para una mejor experiencia</h1>
</div>
<script>
    var fechaFormateada = "${event.date}"; // Ejemplo: "29/09/2024"

    function convertirFecha(fechaString) {
        var partesFecha = fechaString.split("/");
        var dia = partesFecha[0];
        var mes = partesFecha[1];
        return mes + "-" + dia;
    }

    var fechaConvertida = convertirFecha(fechaFormateada);

    if (!isNaN(Date.parse(fechaConvertida))) {
        var fecha = new Date(fechaConvertida);

        var opcionesDiaSemana = { weekday: 'long' };
        var opcionesDiaNumero = { day: 'numeric' };
        var opcionesMes = { month: 'long' };

        var diaSemana = capitalizarPrimeraLetra(fecha.toLocaleDateString('es-ES', opcionesDiaSemana));
        var diaNumero = fecha.toLocaleDateString('es-ES', opcionesDiaNumero);
        var mesNombre = capitalizarPrimeraLetra(fecha.toLocaleDateString('es-ES', opcionesMes));

        // Insertar las partes en elementos HTML
        document.getElementById("diaSemana").innerText = diaSemana;
        document.getElementById("diaNumero").innerText = diaNumero;
        document.getElementById("mes").innerText = mesNombre;
    } else {
        console.error("La fecha no es válida: " + fechaConvertida);
    }

    function capitalizarPrimeraLetra(texto) {
        return texto.charAt(0).toUpperCase() + texto.slice(1);
    }
</script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="/js/guest.js"></script>
</body>
</html>