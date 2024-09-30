<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/userCreateEvent.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
<svg width="100%" height="200px" id="svg" viewBox="0 0 1440 200" xmlns="http://www.w3.org/2000/svg" class="transition duration-300 ease-in-out delay-150">
    <path d="M 0,200 L 0,50 C 89.89487179487182,41.57948717948717 179.78974358974364,33.15897435897435 266,32 C 352.21025641025636,30.84102564102565 434.7358974358973,36.94358974358975 516,37 C 597.2641025641027,37.05641025641025 677.2666666666667,31.06666666666669 753,41 C 828.7333333333333,50.93333333333331 900.197435897436,76.78974358974358 973,83 C 1045.802564102564,89.21025641025642 1119.9435897435897,75.77435897435898 1198,67 C 1276.0564102564103,58.22564102564102 1358.0282051282052,54.11282051282052 1440,50 L 1440,200 L 0,200 Z" stroke="none" stroke-width="0" fill="#fce2c7" fill-opacity="0.53" class="transition-all duration-300 ease-in-out delay-150 path-0" transform="rotate(-180 720 100)"></path>
    <path d="M 0,200 L 0,133 C 83.74102564102563,113.87948717948717 167.48205128205126,94.75897435897437 251,98 C 334.51794871794874,101.24102564102563 417.8128205128205,126.84358974358975 498,148 C 578.1871794871795,169.15641025641025 655.2666666666667,185.8666666666667 730,175 C 804.7333333333333,164.1333333333333 877.1205128205128,125.68974358974359 949,115 C 1020.8794871794872,104.31025641025641 1092.251282051282,121.37435897435898 1174,129 C 1255.748717948718,136.62564102564102 1347.874358974359,134.8128205128205 1440,133 L 1440,300 L 0,300 Z" stroke="none" stroke-width="0" fill="#fce2c7" fill-opacity="1" class="transition-all duration-300 ease-in-out delay-150 path-1" transform="rotate(-180 720 100)"></path>
</svg>
<main>
	<h1>Crea el evento</h1>
	<p class="subtitle">Agregaremos más detalles más adelante</p>
	<form:form class="form" action="/user/${user.id}/create/event" method="POST" modelAttribute="event">
		<div>
			<form:label class="form-label" path="name">
				<p>Nombre del Evento:</p> 
				<span class="span">(pueden ser los nombres de la pareja, esto aparecerá como título en la invitación)</span></form:label>
			<form:input class="form-control" path="name" type= "text" name ="name"/>
			<form:errors path="name"/>
		</div>
		<section>
			<div>
				<form:label class="form-label" path="date">Fecha: </form:label>
				<form:input class="form-control" path="date" type= "date" name ="date"/>
				<form:errors path="date"/>
			</div>
			<div>
				<form:label class="form-label" path="start">Inicio: </form:label>
				<form:input class="form-control" path="start" type= "time" name ="start"/>
				<form:errors path="start"/>
			</div>
			<div>
				<form:label class="form-label" path="end">Término: 
				<span class="span">(opcional)</span></form:label>
				<form:input class="form-control" path="end" type= "time" name ="end"/>
				<form:errors path="end"/>
			</div>
		</section>
		<div>
			<form:label class="form-label" path="photos">Plataforma de Fotos 
			<span class="span">(puedes pegar aquí el link a la plataforma de fotos): </span></form:label>
			<form:input class="form-control" path="photos" type= "text" name ="photos"/>
			<form:errors path="photos"/>
		</div>
		<div>
    		<form:label class="form-label" path="giftsType">Tipo de regalos: </form:label>
    		<form:select id="input" class="form-select form-select-lg" aria-label="Large select example" path="giftsType" onchange="updateText()">
       			<option value="Dinero">Aporte Monetario</option>
       			<option value="Artículos de casa">Artículos de casa</option>
    		</form:select>
		</div>
		<div class="section">
			<div id="output" style="display: none;">
    			<form:label class="form-label" path="gifts">
    			<p>Información para los regalos:</p>
    			<span class="span">(esto ayudará a tus invitados a darte mejores regalos, puedes mencionar lo qué te hace falta
    			lo que ya tienes o preferencias. Opcional.)</span></form:label>
    			<form:textarea class="form-control" path="gifts" name="gifts"></form:textarea>
			</div>
		</div>
		<footer class="buttonBox">
			<button class="button3">Crear</button>
		</footer>
	</form:form> 
</main>

<footer class="logout">
	<form:form action="/logout" method="POST">
		<input type="hidden" name="_method" value="PUT"/>
		<button class="button1"><ion-icon name="exit-outline"></ion-icon>Cerrar Sesión</button>
	</form:form>
</footer>


<script src="/js/event.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>