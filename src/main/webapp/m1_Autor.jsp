<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Autori</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/nou.css" rel="stylesheet" type="text/css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div>
		<h1 align="center">Modificati Autorul:</h1>
		<br />
		<%
            jb.connect();
		 	String aux = request.getParameter("primarykey");
        	if(aux != null){
        		ResultSet rs = jb.ReturnLineByID("autori", "idautor", java.lang.Long.parseLong(aux));
            	rs.first();
            	String nume = rs.getString("nume");
            	String prenume = rs.getString("prenume");
                int varsta = rs.getInt("varsta");
                String gen = rs.getString("gen");
            	rs.close();
            	jb.disconnect();
        %>
		<form action="m2_Autor.jsp" method="post">
			<table align="center">
				<tr>
					<td align="right">IdAutor:</td>
					<td><input type="text" name="idautor" size="30" value="<%= aux%>" readonly /></td>
				</tr>
				<tr>
					<td align="right">Nume:</td>
					<td><input type="text" name="nume" size="30" value="<%= nume%>"  /></td>
				</tr>
				<tr>
					<td align="right">Prenume:</td>
					<td><input type="text" name="prenume" size="30" value="<%= prenume%>" /></td>
				</tr>
				<tr>
					<td align="right">Varsta:</td>
					<td><input type="text" name="varsta" size="30" value="<%= varsta%>" /></td>
				</tr>
				<tr>
					<td align="right">Gen:</td>
					<td> <select id="gen" name="gen" >
					    <option selected="yes"></option>
					    <option value="Feminin">Feminin</option>
					    <option value="Masculin">Masculin</option>
				</select></td>
			</table>
			<p align="center">
				<input type="submit" value="Modifica">
			</p>
		</form>
		<p align="center">
			<a href="tabela_Autori.jsp"><b>Tabela Autori</b></a>
		</p>
		<p align="center">
			<a href="index.html"><b>Home</b></a>
		</p>
		<%} else {%>
		<br />
		<p align="center">
			<a href="tabela_Autori.jsp"><b>Tabela Autori</b></a>
		</p>
		<p align="center">
			<a href="index.html"><b>Home</b></a>
		</p>
		<br /> <br />
		<h2 align="center">Selectati o linie pe care doriti sa o modificati inainte sa apasati butonul "Modifica"</h2>
		<%} %>
	</div>
</body>