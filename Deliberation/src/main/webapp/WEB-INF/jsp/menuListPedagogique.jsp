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
				<button class="mb-3 mr-2  btn-transition btn btn-outline-alternate" style="padding: 15px 100px;margin-left:130px;margin-top:20px" onclick="window.location.href='ListInscriptionPedagogiqueS'"
				>Liste Inscription par semestre</button>
				<button class="mb-3 mr-2  btn-transition btn btn-outline-dark" style="padding: 15px 100px;margin-top:20px"  onclick="window.location.href='ListInscriptionPedagogiqueM'">Liste Inscription par module</button>
				
			</div>
		</div>
	</layout:put>
</layout:extends>