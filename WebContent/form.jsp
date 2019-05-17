<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
	function myFunction(){
		var element1 = document.createElement("input");
		element1.type = "hidden";
		element1.value = "${sessionScope.csrfToken}";
		element1.name = "tokenval";
		document.getElementById("form").appendChild(element1);
	}

</script>
</head>
<body bgcolor="#00FFFF">
<%
String userName = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
}
}
if(userName == null) response.sendRedirect("login.jsp");
%>
	<form method="post" action="home" name="form" id="form">
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="add" onclick="myFunction()"></td>
				
			</tr>
			


		</table>
	</form>
	<form method="post" action="logOut" name="logOutform" id="logOutform">
		<input type="submit" value="Logout">
</form>

</body>
</html>