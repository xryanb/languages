<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${language.name}</title>
</head>
<body>
<div class='container'>
<form action="/languages/${language.id}/delete" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Delete" class="btn btn-danger">
</form>
<a href="/languages">Dashboard</a>
</div>

<div class='container'>
<form:form action="/language/${language.id}" method="post" modelAttribute="language">
    <input type="hidden" name="_method" value="put">
    <p>
        <form:errors path="name"/>
        <form:input path="name"/>
    </p>
    <p>
        <form:errors path="creator"/>
        <form:textarea path="creator"/>
    </p>
    <p>
        <form:errors path="version"/>
        <form:input path="version"/>
    </p>
   
    <input type="submit" value="Submit"/>
</form:form>
</div>

</body>
</html>