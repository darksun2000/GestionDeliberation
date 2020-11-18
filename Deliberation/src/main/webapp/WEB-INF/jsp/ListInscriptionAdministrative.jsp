<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<layout:extends name="layout.jsp">
	<layout:put block="content" type="REPLACE">

		<div class="main-card mb-3 card">
			<div class="card-body">
				<h5 class="card-title">Liste des inscriptions d'étudiants</h5>
				<div class="tab">
				<c:forEach var="f" items="${f}">
 					 <button class="mb-2 mr-2 btn btn-success" onclick="openCity(event, '${f.nom_filiere}')">${f.nom_filiere}</button>
  				</c:forEach>
</div>
				<c:forEach var="f" items="${f}">

	<div id="${f.nom_filiere}" class="tabcontent">
				<table class="mb-0 table table-hover">
					<thead>
						<tr>
							<th class="th-sm">Nom Etudiant</th>
							<th class="th-sm">Année universitaire</th>
							<th class="th-sm">Date de preinscription</th>
							<th class="th-sm">Date Validation d'inscription</th>
							<th class="th-sm">Operateur</th>
							<th class="th-sm"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${Inscription}">
							<tr>
							<c:if test="${f.id_filiere==i.filieres.id_filiere }">
								<td><a style="color: black">${i.etudiant.first_name_fr} ${i.etudiant.last_name_fr}</a></td>
								<td><a style="color: black">${i.annee_academique}</a></td>
								<td><a style="color: black">${i.date_pre_inscription}</a></td>
								<td><a style="color: black">${i.date_valid_inscription}</a></td>
								<td><a style="color: black">${i.operateur}</a></td>
								<td> <button class="mb-2 mr-2 btn btn-primary" onclick="window.location.href='PageUploadInscriptionAdministrative'">Modifier</button>
								 <button class="mb-2 mr-2 btn btn-danger" onclick="window.location.href='PageUploadInscriptionAdministrative'">Supprimer</button>
								</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				</c:forEach>
			</div>
		</div>
		<script>
		function openCity(evt, cityName) {
			  // Declare all variables
			  var i, tabcontent, tablinks;

			  // Get all elements with class="tabcontent" and hide them
			  tabcontent = document.getElementsByClassName("tabcontent");
			  for (i = 0; i < tabcontent.length; i++) {
			    tabcontent[i].style.display = "none";
			  }

			  // Get all elements with class="tablinks" and remove the class "active"
			  tablinks = document.getElementsByClassName("mb-2 mr-2 btn btn-success");
			  for (i = 0; i < tablinks.length; i++) {
			    tablinks[i].className = tablinks[i].className.replace(" active", "");
			  }

			  // Show the current tab, and add an "active" class to the link that opened the tab
			  document.getElementById(cityName).style.display = "block";
			  evt.currentTarget.className += " active";
			}
		</script>
	</layout:put>
</layout:extends>