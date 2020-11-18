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
				<form class="" action="/inscription/ModifierInscriptionAdministrative?id_ia=${ia.id_ia }" method="GET">


					<div class="form-row">
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="Nom Etudiant" class="">Nom Etudiant</label>
								<select name="id_etudiant" id="exampleSelect" class="form-control">
								<option value="${ia.etudiant.id }" selected>${ia.etudiant.first_name_fr } ${ia.etudiant.last_name_fr }</option>
								<c:forEach var="e" items="${Etudiant }">
								<c:if test=${ia.etudiant.id!=e.id }>
								<option value=${e.getId() }>${e.getFirst_name_fr() } ${e.getLast_name_fr() }</option>
								</c:if>
								</c:forEach>
								</select>
							</div>
						</div>

					

							<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="Filiere" class="">Filiere</label>
								<select name="filiere" id="exampleSelect" class="form-control" >
								<option value="${ia.filieres.id_filiere }" selected>${ia.filieres.nom_filiere }</option>
								<c:forEach var="f" items="${Filiere }">
								<c:if test=${ia.filiers.id_filiere!=f.id_filiere }>
								<option value="${f.getId_filiere()}">${f.getNom_filiere() }</option>
								</c:if>
								</c:forEach>
								</select>
							</div>
				
						</div>

					</div>
					
					<div class="form-row">
						<div class="col-md-3">
							<div class="position-relative form-group">
								<label for="date_pre_inscription" class="">Date de preinscription</label><input
									name="date_pre_inscription" id="date_pre_inscription" value="${ia.date_pre_inscription}"
									type="date" class="form-control">
							</div>
						</div>
						<div class="col-md-3">
							<div class="position-relative form-group">
								<label for="date_valid_inscription" class="">Date Validation d'inscription</label><input
									name="date_valid_inscription" id="date_valid_inscription" value="${ia.date_valid_inscription}"
									type="date" class="form-control">
							</div>
						</div>
						<div class="col-md-3">
							<div class="position-relative form-group">
								<label for="annee_academique" class="">Année academique</label><input
									name="annee_academique" id="date_valid_inscription" placeholder="xxxx/xxxx"
									value="${ia.annee_academique}" class="form-control">
							</div>
						</div>
						<div class="col-md-3">
							<div class="position-relative form-group">
								<label for="annee_academique" class="">Operateur</label><input
									name="operateur" id="date_valid_inscription" value="${ia.operateur}"
									 class="form-control">
							</div>
						</div>
					</div>
					<script>
					
					</script>
						
					<button class="mt-2 btn btn-primary col-md-12" type="submit">Valider</button>
				</form>
				
			</div>
		</div>

	</layout:put>
</layout:extends>