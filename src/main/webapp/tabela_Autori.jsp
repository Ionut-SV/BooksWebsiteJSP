<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Autori</title>
<link href="css/TabelaAutori.css" rel="stylesheet" type="text/css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div>
		<h1 align="center">Tabela Autori:</h1>
		<br />
		<form action="sterge_Autor.jsp" method="post">
			<table border="1" align="center">
				<tr>
					<td><b>Mark:</b></td>
					<td><b>IdAutor:</b></td>
					<td><b>Nume:</b></td>
					<td><b>Prenume:</b></td>
					<td><b>Varsta:</b></td>
					<td><b>Gen:</b></td>

				</tr>
				<%
                    jb.connect();
                    ResultSet rs = jb.ShowTabel("autori");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idautor");
                %>
				<tr>
					<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
					<td><%= x%></td>
					<td><%= rs.getString("nume")%></td>
					<td><%= rs.getString("prenume")%></td>
					<td><%= rs.getInt("varsta")%></td>
					<td><%= rs.getString("gen")%></td>
					<%
                        }
                    %>
				</tr>
			</table>
			<br />
			<p align="center">
				<a href="nou_Autor.jsp"><b>Adauga autor</b></a>
			</p>
			<p align="center">
				<a href="modifica_Autor.jsp"><b>Modifica autor</b></a>
			</p>
			<p align="center">
				<input type="submit" value="Sterge liniile marcate">
			</p>
		</form>
		<%
            rs.close();
            jb.disconnect();
        %>
		<br />
		<p align="center">
			<a href="index.html"><b>Home</b></a> <br />
		</p>
	</div>
</body>
</html>