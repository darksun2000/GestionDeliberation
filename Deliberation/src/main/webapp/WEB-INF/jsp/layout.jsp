<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="head.jsp"></jsp:include>
</head>

<body>

	<!-- 	Preloader -->

	<div class="preloader">
		<div class="cssload-speeding-wheel"></div>
	</div>

	<div id="wrapper">

		<jsp:include page="search-bar.jsp"></jsp:include>

		<!--         Navigation Bar -->

		<jsp:include page="nav-bar.jsp"></jsp:include>

		<div id="page-wrapper">

			<jsp:include page="sub-header.jsp"></jsp:include>

			<div class="row">

				<layout:block name="content"></layout:block>

			</div>

		</div>

		<!--            Footer -->

		<jsp:include page="footer.jsp"></jsp:include>

	</div>

	<!-- 	Scripts -->

	<jsp:include page="scripts.jsp"></jsp:include>

</body>

</html>
