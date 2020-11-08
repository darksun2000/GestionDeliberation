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
				<h5 class="card-title">Importer des notes d'un semestre</h5>
				<form action="/student/import" method="POST">
					<label>Module/Element</label> <select>
						<c:forEach var="element" items="${elements}">
							<option value="${element.id_element}">${element.libelle_element}</option>
						</c:forEach>
					</select> <input type="file" name="file"
						class="mb-2 mr-2 btn btn-primary active">
					<button class="mb-2 mr-2 btn btn-primary active" type="submit">Confirmer</button>
				</form>
			</div>
		</div>
	</layout:put>
</layout:extends>