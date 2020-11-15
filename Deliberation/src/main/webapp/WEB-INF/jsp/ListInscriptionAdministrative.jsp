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
  <button class="tablinks" onclick="openCity(event, 'London')">London</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">Paris</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">Tokyo</button>
</div>
<div id="London" class="tabcontent">
				<table class="mb-0 table table-hover">
					<thead>
						<tr>
							<th class="th-sm">Nom Etudiant</th>
							<th class="th-sm">Date de preinscription</th>
							<th class="th-sm">Date Validation d'inscription</th>
							<th class="th-sm">Operateur</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${Inscription}">
							<tr>
								<td><a style="color: black">${i.last_name_fr}</a></td>
								<td><a style="color: black">${i.first_name_fr}</a></td>
								<td><a style="color: black">${i.nationality}</a></td>
								<c:set var="date" value="${i.birth_date}"></c:set>
								<c:set var="birth_date" value="${fn:substring(date,0,10)}"></c:set>
								<td><a style="color: black">${birth_date}</a></td>
								<td><a style="color: black">${i.bac_type}</a></td>
								<td><a style="color: black">${i.mention}</a></td>
								<c:if test="${i.accepted == 0}">  
								<td><a style="color: black"><button disabled class="mb-2 mr-2 btn btn-danger disabled">Pas Encore
                                        </button></a></td>
                                 </c:if>
                                 <c:if test="${i.accepted == 1}">  
								<td><a style="color: black"><button disabled class="mb-2 mr-2 btn btn-success disabled">Accepté
                                        </button></a></td>
                                 </c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
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
			  tablinks = document.getElementsByClassName("tablinks");
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