<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Expense</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class="d-flex justify-content-around align-items-center container">

<a href="/languages">Dashboard</a>
</div>
<div class="container">
	<p>${language.name}</p>
	<p>${language.creator}</p>
	<p>${language.version}</p>
	<a href="/languages/${language.id}/edit">Edit</a>
	<form action="/languages/${language.id}/delete" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Delete" class="btn btn-danger">
</form>
</div>
</body>
</html>