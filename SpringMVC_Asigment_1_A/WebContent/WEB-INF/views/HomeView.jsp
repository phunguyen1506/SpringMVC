<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr{
  background-color: #ffffff; 
  color : black;	
}

tr:first-child {
  background-color: brown;
}

tr:nth-child(even) {
  background-color: #ffffff;
}

.b-pagination-outer {
  width: 100%;
  margin: 0 auto;
  text-align: center;
  overflow: hidden;
  display: flex
}
#border-pagination {
  margin: 0 auto;
  padding: 0;
  text-align: center
}
#border-pagination li {
  display: inline;

}
#border-pagination li a {
  color: #3279b6;
  display: block;
  text-decoration: none;
  padding: 5px 10px;
  border: 1px solid #ddd;
  float: left;

}

</style>
</head>
<body>

<h3>AdminUser</h3>
<div><a href="adminuser/new">New User</a></div>
<table>
  <tr>
    <th>ID</th>
    <th>name</th>
    <th>email</th>
    <th>status</th>
    <th>memo</th>
    <th>creation time</th>
    <th>change time</th>
  </tr>
  
  <c:forEach items="${listAdminUser}" var="adminuser">
  
  
    <tr onClick="location.href='adminuser/edit?id=${adminuser.ID}';">
 	
	    <td>${adminuser.ID}</td>
	    
		    <td>${adminuser.name}</td>
		    <td>${adminuser.email}</td>
		    <td>${adminuser.statusCD}</td>
		    <td>${adminuser.notes}</td>
		    <td>${adminuser.createdAt}</td>
		    <td>${adminuser.updatedAt}</td>
	    
    </tr>
    
</c:forEach>
  
</table>
<div class="b-pagination-outer">
 
  <ul id="border-pagination">
    <li><a class="" href="#">«</a></li>
    <li><a href="#">Previous</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#" class="active">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">6</a></li>
    <li><a href="#">7</a></li>
    <li><a href="#">8</a></li>
    <li><a href="#">9</a></li>
    <li><a href="#">10</a></li>
    <li><a href="#">Next</a></li>
    <li><a href="#">»</a></li>
  </ul> 
</div>
</body>
</html>