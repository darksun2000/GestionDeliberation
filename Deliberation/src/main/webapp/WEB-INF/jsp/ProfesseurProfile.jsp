<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<layout:extends name="layout.jsp">
	<layout:put block="content" type="REPLACE">


		<div class="row">
			<div class="col-md-3">
				<div class="main-card mb-3 card">
					<div class="card-body">
						<h5 class="card-title">Professeur: ${professeur.prenom_professeur } ${professeur.nom_professeur}</h5>
						<a href="/professeur/profile/${professeur.id_professeur }/element/liste"><button class="mb-2 mr-2 btn btn-warning btn-block">Les éléments du professeur</button></a>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="main-card mb-3 card">
					<div class="card-body">
						<h5 class="card-title">Modification</h5>
						<form action="/professeur/modifier/${professeur.id_professeur}"
							method="POST">
							<div class="position-relative form-group">
								<label for="last_name" class="">Nom: </label><input name="last_name"
									id="last_name" placeholder="Nom du professeur" type="text"
									class="form-control" value="${professeur.nom_professeur }">
							</div>
							<div class="position-relative form-group">
								<label for="first_name" class="">Prénom: </label><input name="first_name"
									id="first_name" placeholder="Prénom du professeur" type="text"
									class="form-control" value="${professeur.prenom_professeur }">
							</div>
							<div class="position-relative form-group">
								<label for="emai" class="">Email: </label><input name="email"
									id="email" placeholder="Email du professeur" type="email"
									class="form-control" value="${professeur.email_professeur }">
							</div>
							<div class="position-relative form-group">
								<label for="username" class="">Nom d'utilisateur: </label><input name="username"
									id="username" placeholder="Nom d'utilisateur" type="text"
									class="form-control" value="${professeur.user.username }">
							</div>
							<div class="position-relative form-group">
								<label for="password" class="">Mot de passe: </label><input name="password"
									id="password" placeholder="Mot de passe" type="password"
									class="form-control" value="${professeur.user.password }" disabled>
									<button type="button" onclick="enable_pass_change()" class="btn btn-danger">Changer le mot de passe</button>
							</div>
							<div class="position-relative form-group" id="div_password_conf" style="display: none;">
								<label for="password" class="">Retapper le mot de passe: </label><input name="password_conf"
									id="password_conf" placeholder="Confirmation du Mot de passe" type="password"
									class="form-control" value="">
							</div>
							<button class="mt-1 btn btn-primary" type="submit">Modifier</button>
							<button class="mt-1 btn btn-danger"
								formaction="/professeur/supprimer/${professeur.id_professeur}" formmethod="POST">Supprimer</button>

						</form>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			function enable_pass_change(){
				document.getElementById("password").disabled = false;
				document.getElementById("div_password_conf").style.display = "block";
			}
		</script>
	</layout:put>
</layout:extends>