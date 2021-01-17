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
						<h5 class="card-title">établissement: ${etablissement.name }</h5>
						<a href="/etablissement/profile/${etablissement.id }/filiere/liste"><button class="mb-2 mr-2 btn btn-primary btn-block">Les filières de l'établissement</button></a>
						<a href="/etablissement/profile/${etablissement.id }/professeur/liste"><button class="mb-2 mr-2 btn btn-success btn-block">Les professeurs de l'établissement</button></a>
						<a href="/etablissement/profile/${etablissement.id }/etudiant/liste"><button class="mb-2 mr-2 btn btn-warning btn-block">Les étudiants de l'établissement</button></a>

					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="main-card mb-3 card">
					<div class="card-body">
						<h5 class="card-title">Modification</h5>
						<form action="/etablissement/modifer/${etablissement.id}"
							method="POST">
							<div class="position-relative form-group">
								<label for="name" class="">Nom: </label><input name="name"
									id="name" placeholder="Nom de l'établissement" type="text"
									class="form-control" value="${etablissement.name }">
							</div>
							<button class="mt-1 btn btn-primary"
								formaction="/etablissement/modifier/${etablissement.id}" formmethod="POST">Modifier</button>
							<button class="mt-1 btn btn-danger"
								formaction="/etablissement/supprimer/${etablissement.id}" formmethod="POST">Supprimer</button>

						</form>
					</div>
				</div>
			</div>
		</div>
		
	</layout:put>
</layout:extends>