<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head> 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>HandStory</title>
  <link rel="stylesheet" href="/adaco/css/main.css">
  <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
  <link
    rel="stylesheet"
    href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"/>
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body>
 <div id="page">
  	<header class="header" id="header" style=" height: 80px;">
		<jsp:include page="include/header.jsp" />
	</header>
	<nav class="navbar navbar-expand-lg navbar-dark alert-danger fixed-top " >
		<jsp:include page="include/nav.jsp"/>
	</nav>
	<div id="main">
		<aside>
			<jsp:include page="include/aside.jsp" />
		</aside>
		<section>
			<jsp:include page="${viewName}"/>
		</section>
	</div>
  <footer class="page-footer font-small teal pt-4">
    <jsp:include page="include/footer.jsp" />
  </footer>
</div>
</body>
</html>
