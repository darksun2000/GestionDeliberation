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
				<table class="mb-0 table table-hover">
					<thead>
						<tr>
						<th >cne</th>
							<th class="th-sm">Nom</th>
							<th class="th-sm">Prénom</th>
							<th class="th-sm">Moyenne</th>
							<th class="th-sm">validation</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${etudiants}">
							<tr >
								<td><a style="color: black">${i.etudiant.cne}</a></td>
								<td><a style="color: black">${i.etudiant.last_name_fr}</a></td>
								<td><a style="color: black">${i.etudiant.first_name_fr}</a></td>
								
								<td><a style="color: black">${i.note_semestre}</a></td>
								
								<c:if test="${i.validation == 0}">  
								<td><a style="color: black"><button disabled class="mb-2 mr-2 btn btn-danger disabled">Non validée
                                        </button></a></td>
                                 </c:if>
                                 <c:if test="${i.validation == 1}">  
								<td><a style="color: black"><button disabled class="mb-2 mr-2 btn btn-success disabled">Validé 
                                        </button></a></td>
                                 </c:if>
                                 
                                 <c:if test="${i.validation == 2}">  
								<td><a style="color: black"><button disabled class="mb-2 mr-2 btn btn-success disabled">Validé Par compensation
                                        </button></a></td>
                                 </c:if>
                                 <c:if test="${i.validation == 3}">  
								<td><a style="color: black"><button disabled class="mb-2 mr-2 btn btn-danger disabled">En cours
                                        </button></a></td>
                                 </c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</layout:put>
</layout:extends>