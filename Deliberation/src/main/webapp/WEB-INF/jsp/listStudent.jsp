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
				<h5 class="card-title">Liste des étudiants</h5>
				<table class="mb-0 table table-striped">
					<thead>
						<tr>
							<th>Nom</th>
							<th class="th-sm">Prénom</th>
							<th class="th-sm">CNE</th>
							<th class="th-sm">Sexe</th>
							<th class="th-sm">Nationalité</th>
							<th class="th-sm">Date de naissance</th>
							<th class="th-sm">Type du Bac</th>
							<th class="th-sm">Mention</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="student" items="${students}">
							<tr>
								<td><a style="color: black" href="#">${student.last_name_fr}</a></td>
								<td><a style="color: black" href="#">${student.first_name_fr}</a></td>
								<td><a style="color: black" href="#">${student.cne}</a></td>
								<td><a style="color: black" href="#">${student.gender}</a></td>
								<td><a style="color: black" href="#">${student.nationality}</a></td>
								<c:set var="date" value="${student.birth_date}"></c:set>
								<c:set var="birth_date" value="${fn:substring(date,0,10)}"></c:set>
								<td><a style="color: black" href="#">${birth_date}</a></td>
								<td><a style="color: black" href="#">${student.bac_type}</a></td>
								<td><a style="color: black" href="#">${student.mention}</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</layout:put>
</layout:extends>