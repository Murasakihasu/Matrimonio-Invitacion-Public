<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/userRegister.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Registro</title>
</head>
<body>
<main>
	<article class="content">
		<h1>Regístrate</h1>
		<form:form action="/register" method="POST" modelAttribute="user">
			<div>
				<form:label class="form-label" path="name">Nombre:</form:label>
			    <form:input class="form-control mb-4" path="name" type= "text" name ="name"/>
			   	<form:errors path="name"/>
			</div>
			<div class="mt-4">
			   	<form:label class="form-label" path="email">Email:</form:label>
			    <form:input class="form-control mb-4" path="email" type= "email" name ="email"/>
			   	<form:errors path="email"/>
			</div>
			<div class="mt-4">
			  	<form:label class="form-label" path="email2">Segundo Email 
			  	<span class="span">(opcional)</span>:</form:label>
			    <form:input class="form-control mb-4" path="email2" type= "email" name ="email2"/>
			    <form:errors path="email2"/>
			</div>
			<div class="mt-4">
			    <form:label class="form-label" path="password">Contraseña:</form:label>
			    <form:input class="form-control mb-4" path="password" type= "password" name ="password"/>
				<form:errors path="password"/>		   	
			</div>
			<div class="mt-4">
				<form:label class="form-label" path="confirmPassword">Confirmar Contraseña:</form:label>
				<form:input class="form-control mb-4" path="confirmPassword" type= "password" name ="confirmPassword"/>
				<form:errors path="confirmPassword"/>
			</div>
			<input class="button3 mt-4" type="submit" value="¡Regístranos!"/>
			<a class="button3 mt-4" href="/"><ion-icon name="arrow-back-outline"></ion-icon>Atrás</a>
		</form:form>
	</article>
		
	<article class="imageBox">
		<img src="/img/portada.jpeg" alt="anillos">
	</article>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</main>
</body>
</html>