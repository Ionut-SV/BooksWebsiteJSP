<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modifica editura</title>
<link href="css/TabelaEdituri.css" rel="stylesheet" type="text/css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div>
		<h1 align="center">Modifica editura:</h1>
		<br />
		<form action="m1_Editura.jsp" method="post">
			<table border="1" align="center">
				<tr>
					<td><b>Mark:</b></td>
					<td><b>IdEditura:</b></td>
					<td><b>IdCarte:</b></td>
					<td><b>Titlu:</b></td>
					<td><b>Categorie:</b></td>
					<td><b>Rating:</b></td>
					<td><b>IdAutor:</b></td>
					<td><b>Nume:</b></td>
					<td><b>Prenume:</b></td>
					<td><b>Gen:</b></td>
					<td><b>Varsta:</b></td>
					<td><b>Nume Editura:</b></td>
					<td><b>Data Publicarii:</b></td>
					<td><b>Copii Vandute:</b></td>
					<td><b>Tara:</b></td>
				</tr>
				<%
                    jb.connect();
                    ResultSet rs = jb.vedeEditura();
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("ideditura");
                %>
				<tr>
					<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
					<td><%= x%></td>
					<td><%= rs.getLong("idcarte")%></td>
					<td><%= rs.getString("titlu")%></td>
					<td><%= rs.getString("categorie")%></td>
					<td><%= rs.getFloat("rating")%></td>
					<td><%= rs.getLong("idautor")%></td>
					<td><%= rs.getString("nume")%></td>
					<td><%= rs.getString("prenume")%></td>
					<td><%= rs.getString("gen")%></td>
					<td><%= rs.getInt("varsta")%></td>
					<td><%= rs.getString("nume_editura")%></td>
					<td><%= rs.getString("data_publicarii")%></td>
					<td><%= rs.getInt("copii_vandute")%></td>
					<td><%= rs.getString("tara")%></td>

					<%
                        }
                    %>
				</tr>
			</table>
			<br />
			<p align="center">
				<input type="submit" value="Modifica">
			</p>
		</form>
		<%
    jb.disconnect();%>
		<br />
		<p align="center">
			<a href="tabela_Edituri.jsp"><b>Tabela Edituri</b></a>
		</p>
		<p align="center">
			<a href="index.html"><b>Home</b></a> <br />
		</p>
	</div>
</body>
</html>