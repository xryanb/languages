<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<style>
body {
  background-color: linen;
}

h1 {
  color: maroon;
}


</style>
</head>
<body>
<div class='container'>
<table class="table table-dark table-striped">
	<tr>
	 <th scope="col">Name</th>
      <th scope="col">Creator</th>
       <th scope="col">Version</th>
        <th scope="col">Actions</th>
        <th scope="col"></th>
        </tr>
      <tbody>
      
        <c:forEach var="languages" items="${languages}">
        <tr>
        <td><a href="/languages/${languages.id}/"><c:out value="${languages.name}"></c:out></a></td>
        <td><c:out value="${languages.creator}"></c:out></td>
        <td><c:out value="${languages.version}"></c:out></td>
     <td><form action="/languages/${languages.id}/delete" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Delete" class="btn btn-danger">
</form>
</td>

 		
		<td><a href="/languages/${languages.id}/edit">Edit</a></td>
        </tr>
    </c:forEach>

</tbody>
</table>
</div>
<div class='container'>


<form:form action="/languages/create" method='POST' modelAttribute="language">

 <div class="d-flex justify-content-around align-items-center">
<form:label path="name">Name: </form:label>
<form:input type="text" path="name"/>
<form:errors path="name" class="text-danger"/>
</div> 

<div class="d-flex justify-content-around align-items-center mt-2">
<form:label path="creator">Creator: </form:label>
<form:input type="text" path="creator"/>
<form:errors path="creator" class="text-danger"/>
</div>

<div class="d-flex justify-content-around align-items-center mt-2">
<form:label path="version">Version: </form:label>
<form:input type="number" path="version" min="1"/>
<form:errors path="version" class="text-danger"/>
</div>


<button class="btn btn-primary">Submit</button>
</form:form>

</div>
</body>
</html>