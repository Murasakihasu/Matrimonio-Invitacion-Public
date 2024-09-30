<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/userLogin.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<main>
		<article class="article1">
			<h1>Ingresa</h1>
			<form:form action="/login" method="POST" modelAttribute="userLogin">
				<div>
			        <form:label class="form-label" path="loginEmail">Email</form:label>
			       	<form:input class="form-control mb-4" path="loginEmail" type= "email" name ="loginEmail"/>
			       	<form:errors path="loginEmail"/>
			   	</div>
			   	<div class="mt-4">
			      	<form:label class="form-label" path="loginPassword">Contraseña</form:label>
			       	<form:input class="form-control mb-4" path="loginPassword" type= "password" name ="loginPassword"/>
			       	<form:errors path="loginPassword"/>
		    	</div>
		    	<button class="button3 mt-4">Ingresar</button>
		    	<a class="button3 mt-4" href="/register">Regístrate</a>
			</form:form>
		</article>
		
		<article class="article2">
			<img src="/img/matrimonio.jpg" alt="imagen portada">
		</article>
	</main>
</body>
</html>