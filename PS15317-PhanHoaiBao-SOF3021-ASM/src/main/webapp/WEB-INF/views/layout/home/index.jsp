<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<html lang="en">

<head>
<title>Home</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS v5.0.2 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.css" rel="stylesheet" /> -->
<link rel="stylesheet" href="../css/style.css">
<style>
.bg-White {
	background-color: white;
}

.bg-Black {
	background-color: black;
}

.about {
	font-size: 14px
}

label.radio {
	cursor: pointer
}

label.radio input {
	position: absolute;
	top: 0;
	left: 0;
	visibility: hidden;
	pointer-events: none
}

label.radio span {
	padding: 2px 9px;
	border: 2px solid highlight;
	display: inline-block;
	color: highlight;
	border-radius: 3px;
	text-transform: uppercase
}

label.radio input:checked+span {
	border-color: #ff0000;
	background-color: #ff0000;
	color: #fff;
}

/* radio color */
label.rdocolor {
	cursor: pointer
}

label.rdocolor input {
	position: absolute;
	top: 0;
	left: 0;
	visibility: hidden;
	pointer-events: none
}

label.rdocolor span {
	padding: 2px 9px;
	border: 2px solid highlight;
	display: inline-block;
	border-radius: 3px;
	text-transform: uppercase
}

label.rdocolor input:checked+span {
	border-color: #ff0000;
}

.btn-danger {
	background-color: #ff0000 !important;
	border-color: #ff0000 !important
}

.btn-danger:hover {
	background-color: #da0606 !important;
	border-color: #da0606 !important
}

.btn-danger:focus {
	box-shadow: none
}
</style>
</head>

<body ng-app="ASM">
	<div>
		<tiles:insertAttribute name="navbar" />
	</div>
	<div style="min-height: 800px;">
		<tiles:insertAttribute name="body" />
	</div>
	<div>
		<tiles:insertAttribute name="footer" />
	</div>




	<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
	<script>
		var app = angular.module("ASM", []);
	</script>
</body>


</html>