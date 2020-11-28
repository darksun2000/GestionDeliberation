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
				<h5 class="card-title">Inscription Pedagogique de l'Etudiant</h5>
				<form class="" action="/inscription/createANewInscriptionAdministrative" method="GET">


				
			<div  class="tabcontent">
				<table class="mb-0 table table-hover" id="tableAInscrire">
					<thead>
						<tr>
							<th class="th-sm">Nom Etudiant</th>
							<th class="th-sm">Année universitaire</th>
							<th class="th-sm">Filiere</th>
							<th class="th-sm">Semestre</th>
							<th class="th-sm">Selectionner</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${Inscription}">
							<tr>
								<td><a style="color: black">${i.etudiant.first_name_fr} ${i.etudiant.last_name_fr}</a></td>
								<td><a style="color: black">${i.annee_academique}</a></td>
								<td><a style="color: black">${i.semestre.filiere.nom_filiere}</a></td>
								<td><a style="color: black">${i.semestre.id_semestre}</a></td>
								<td><input type="checkbox" name="selected"
										value="yes"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				
					<div class="form-row">
						<div class="col-md-8">
							<div class="position-relative form-group">
								<br><label for="Filiere" class=""><h6>Choisir module d'inscription :</h6></label><br>
								<c:forEach items="${module }" var="m">
								<input type="checkbox" name="selected" value="${m.id_module }" style="margin-right:5px"> ${m.libelle_module }<br>   
								</c:forEach>
							</div>
						</div>
						</div>
						
					<button class="mt-2 btn btn-primary col-md-12" type="submit">Inscrire</button>
				</form>
				
			</div>
		</div>
		<script type="text/javascript" src="webjars/jquery/3.2.0/jquery.min.js"></script>
	<script>
					$(document).ready(function () {
					    $('#filiere, #annee').on("change", filterAll);
					});

					function filterAll() {
						alert("alatif");
					    $('#tableAInscrire tr').show();
					    filterFiliere();
					    filterAnnee();
					}	
					function filterFiliere() {
					    let dumb = this.options.selectedIndex;
					    dumb = this.options[dumb].innerHTML;
					    var filter, table, tr, td, i;
					    filter = dumb.toUpperCase();
					    table = document.getElementById("tableAInscrire");
					    tr = table.getElementsByTagName("tr");
					    for (i = 0; i < tr.length; i++) {
					        td = tr[i].getElementsByTagName("td")[2];
					        if (td) {
					            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					                tr[i].style.display = "table-row";
					            } else {
					                tr[i].style.display = "none";
					            }
					        }

					    }
					}
					function filterAnnee() {
					    let dumb = this.options.selectedIndex;
					    dumb = this.options[dumb].innerHTML;
					    var filter, table, tr, td, i;
					    filter = dumb.toUpperCase();
					    table = document.getElementById("tableAInscrire");
					    tr = table.getElementsByTagName("tr");
					    for (i = 0; i < tr.length; i++) {
					        td = tr[i].getElementsByTagName("td")[1];
					        if (td) {
					            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					                tr[i].style.display = "table-row";
					            } else {
					                tr[i].style.display = "none";
					            }
					        }

					    }
					}
					</script>
	</layout:put>
	
</layout:extends>