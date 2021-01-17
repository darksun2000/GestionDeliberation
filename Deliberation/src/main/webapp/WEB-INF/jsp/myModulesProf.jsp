<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<layout:extends name="layout-prof.jsp">
	<layout:put block="content" type="REPLACE">

		<div class="main-card mb-3 card">
			<div class="card-body">
				<h5 class="card-title">Mes modules</h5>
				<table class="mb-0 table table-striped">
					<thead>
						<tr>
							<th>Nom</th>
							<th>Filière</th>
							<th>Semestre</th>
							<th>Etablissement</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="module" items="${modules}">
							<tr>
								<td><a style="color: black" href="/prof/mymodule/profile/${module.id_module}">${module.libelle_module}</a></td>
								<td><a style="color: black" href="/prof/mymodule/profile/${module.id_module}">${module.semestre.etape.filiere.nom_filiere}</a></td>
								<td><a style="color: black" href="/prof/mymodule/profile/${module.id_module}">${module.semestre.libelle_semestre}</a></td>
								<td><a style="color: black" href="/prof/mymodule/profile/${module.id_module}">${module.semestre.etape.filiere.etablissement.name}</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</layout:put>
</layout:extends>