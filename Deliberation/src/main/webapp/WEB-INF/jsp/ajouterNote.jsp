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
				<form method="POST" action="/note/ajouter">
					<div class="form-row">
						<input name="element" id="element" value="${element.id_element}"
							type="hidden" class="form-control" readonly>


						<div class="col-md-3">
							<div class="position-relative form-group">
								<label for="type" class="">Type</label>
								<jsp:include page="typeExam.jsp"></jsp:include>
							</div>
						</div>
						<div class="col-md-3">
							<div class="position-relative form-group">
								<label for="city" class="">Coeficient</label> <input name="coef"
									id="coef" type="number" step="0.01" class="form-control"
									required>
							</div>
						</div>
					</div>
					<table class="mb-0 table table-hover">
						<thead>
							<tr>
								<th>Nom</th>
								<th class="th-sm">Prénom</th>
								<th class="th-sm">cne</th>
								<th class="th-sm">Note</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${Inscription}">
								<tr>
									<td><a style="color: black">${i.etudiant.last_name_fr}</a></td>
									<td><a style="color: black">${i.etudiant.first_name_fr}</a></td>
									<td><a style="color: black">${i.etudiant.cne}</a></td>


									<td>
										<div class="input-group">

											<input name="note_${i.id_ip}" id="note_${i.id_ip}" min="-1"
												max="20" type="number" step="0.01" class="form-control"
												required>
											<div class="input-group-append">
												<input type="button" name="abs" id="abs" class="btn btn-danger"
													onclick="abse(${i.id_ip})" value="Absent" />
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button class="mt-2 btn btn-primary col-md-12" id="valider"
						type="submit">Valider</button>
				</form>
			</div>
		</div>
		<script>
			function abse(id) {

				if (document.getElementById("note_"+id).type == "hidden") {
					document.getElementById("note_"+id).type = "number";
					document.getElementById("note_"+id).value = 0;
				} else {
					document.getElementById("note_"+id).type = "hidden";
					document.getElementById("note_"+id).value = -1;
				}
			}
		</script>
	</layout:put>
</layout:extends>