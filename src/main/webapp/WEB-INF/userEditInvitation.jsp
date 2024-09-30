<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/userEditInvitation.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Editar invitación</title>
</head>
<body>
<svg width="100%" height="200px" id="svg" viewBox="0 0 1440 200" xmlns="http://www.w3.org/2000/svg" class="transition duration-300 ease-in-out delay-150">
    <path d="M 0,200 L 0,50 C 89.89487179487182,41.57948717948717 179.78974358974364,33.15897435897435 266,32 C 352.21025641025636,30.84102564102565 434.7358974358973,36.94358974358975 516,37 C 597.2641025641027,37.05641025641025 677.2666666666667,31.06666666666669 753,41 C 828.7333333333333,50.93333333333331 900.197435897436,76.78974358974358 973,83 C 1045.802564102564,89.21025641025642 1119.9435897435897,75.77435897435898 1198,67 C 1276.0564102564103,58.22564102564102 1358.0282051282052,54.11282051282052 1440,50 L 1440,200 L 0,200 Z" stroke="none" stroke-width="0" fill="#fce2c7" fill-opacity="0.53" class="transition-all duration-300 ease-in-out delay-150 path-0" transform="rotate(-180 720 100)"></path>
    <path d="M 0,200 L 0,133 C 83.74102564102563,113.87948717948717 167.48205128205126,94.75897435897437 251,98 C 334.51794871794874,101.24102564102563 417.8128205128205,126.84358974358975 498,148 C 578.1871794871795,169.15641025641025 655.2666666666667,185.8666666666667 730,175 C 804.7333333333333,164.1333333333333 877.1205128205128,125.68974358974359 949,115 C 1020.8794871794872,104.31025641025641 1092.251282051282,121.37435897435898 1174,129 C 1255.748717948718,136.62564102564102 1347.874358974359,134.8128205128205 1440,133 L 1440,300 L 0,300 Z" stroke="none" stroke-width="0" fill="#fce2c7" fill-opacity="1" class="transition-all duration-300 ease-in-out delay-150 path-1" transform="rotate(-180 720 100)"></path>
</svg>
<main>
	<article>
		<h1>Editar Invitaciones</h1>
			<c:forEach items="${event.invitations}" var="inv">
				<h2>${inv.title}</h2>
					<figure class="col2">
						<section>
							<form:form class="form" action="/user/${user.id}/event/${event.id}/invitation/${inv.id}/edit" method="POST" modelAttribute="invitation">
								<form:label class="form-label" path="title">Nuevo título:</form:label>
								<form:input class="form-control" path="title" type= "text"/>
								<form:errors class="error" path="title"/>
								<button class="button3">Cambiar</button>
        					</form:form>
        				</section>
        				<section>
							<h3>Invitados</h3>
							<ul>
								<c:forEach items="${inv.guests}" var="guest">
									<li>
										<p>${guest.name}</p>
										<form action="/user/${user.id}/event/${event.id}/invitation/${inv.id}/guest/${guest.id}/delete" method="POST">
											<input type="hidden" name="_method" value="DELETE"  />
											<button class="boton-enlace"><ion-icon name="trash-outline"></ion-icon></button>
										</form>
									</li>
								</c:forEach>
							</ul>
						</section>
					</figure>
					<footer class="buttonBox">
						<form:form action="/user/${user.id}/event/${event.id}/invitation/${inv.id}/delete" method="POST">
							<input type="hidden" name="_method" value="DELETE"  />
							<button class="button3"><ion-icon name="trash-outline"></ion-icon>Borrar Invitación</button>
						</form:form>
					</footer>
			</c:forEach>
			<footer>
				<a class="button3" href="/user/${user.id}/event/${event.id}/invitation">
					<ion-icon name="arrow-back-outline"></ion-icon>Volver atrás
				</a>
			</footer>
	</article>
</main>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>