<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<layout:extends name="layout.jsp">
	<layout:put block="content" type="REPLACE">

		<div class="main-card mb-3 card">
			<div class="card-body">
				<h5 class="card-title">Inscription Administrative de l'Etudiant</h5>
				<form class="" action="/inscription/createANewInscriptionAdministrative" method="Post" enctype="multipart/form-data">


					<div class="form-row">
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="Nom Etudiant" class="">Nom Etudiant</label>
								<select name="id_etudiant" id="exampleSelect" class="form-control" required>
								<option default>Choisir étudiant</option>
								<c:forEach var="e" items="${Etudiant }">
								<option value="${e.getId()}">${e.getFirst_name_fr() } ${e.getLast_name_fr() }</option>
								</c:forEach>
								</select>
							</div>
						</div>

					

							<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="Filiere" class="">Filiere</label>
								<select name="filiere" id="exampleSelect" class="form-control" required>
								<option default>Choisir la filiére</option>
								<c:forEach var="f" items="${Filiere }">
								<option value="${f.getId_filiere()}">${f.getNom_filiere() }</option>
								</c:forEach>
								</select>
							</div>
				
						</div>

					</div>
					
					<div class="form-row">
						
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="annee_academique" class="">Année academique</label><input
									name="annee_academique" id="date_valid_inscription" placeholder="xxxx/xxxx"
									 class="form-control" value="${year }/${year + 1}" required>
							</div>
						</div>
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="annee_academique" class="">Operateur</label><input
									name="operateur" id="date_valid_inscription"
									 class="form-control" required>
							</div>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6">
							<div class="position-relative form-group">
			      				<label for="annee_academique" class="">Inserer photo</label><input name="photo" id="file" type="file" class="form-control-file">
							</div>
						</div>
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="annee_academique" class="">Inserer document</label><input name="document1" id="file" type="file" class="form-control-file">		
							</div>
						</div>
						</div>
						
					<button class="mt-2 btn btn-primary col-md-12" type="submit">Valider</button>
				</form>
				<button class="mt-2 btn btn-success col-md-12" onclick="window.location.href='PageUploadInscriptionAdministrative'">Upload fichier</button>
				
			</div>
		</div>

	</layout:put>
</layout:extends>