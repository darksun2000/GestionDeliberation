<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="/images/large/logo.png">



<title>Délibération Bachelor</title>


<link href="/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
<link href="/css/datatables.min.css" rel="stylesheet">
<link href="/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
	rel="stylesheet">

<link href="/bower_components/toast-master/css/jquery.toast.css"
	rel="stylesheet">

<link href="/bower_components/morrisjs/morris.css" rel="stylesheet">

<link href="/css/animate.css" rel="stylesheet">

<link href="/css/all.css" rel="stylesheet">
<script src="/js/all.js"></script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="/bootstrap/fonts/font-awesome.min.css" rel="stylesheet">

<link href="/css/style.css" rel="stylesheet">

<link href="/css/colors/blue-dark.css" id="theme" rel="stylesheet">

<style>
.sidenav {
	height: 100%;
	width: 220px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #516673;
	overflow-x: hidden;
	padding-top: 20px;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 14px;
	color: #AAC0C9;
	display: block;
	border: none;
	background: none;
	width: 100%;
	text-align: left;
	cursor: pointer;
	outline: none;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
	color: #f1f1f1;
}

/* Main content */
.main {
	margin-left: 200px; /* Same as the width of the sidenav */
	font-size: 17px; /* Increased text to enable scrolling */
	padding: 0px 10px;
}

/* Add an active class to the active dropdown button */
.active {
	background-color: gray;
	color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
	display: none;
	background-color: #717475;
	padding-left: 8px;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
	float: right;
	padding-right: 8px;
}
</style>

<script type="text/javascript">
    $(window).on('load',function(){
        $('#ModalEmail').modal('show');
    });
</script>
