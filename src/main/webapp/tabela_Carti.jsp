<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Carti</title>
<link href="css/TabelaCarti.css" rel="stylesheet" type="text/css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div>
		<h1 align="center">Tabela Carti:</h1>
		<form action="sterge_Carte.jsp" method="post">
			<table border="1" align="center">
				<tr>
					<td><b>Mark:</b></td>
					<td><b>IdCarte:</b></td>
					<td><b>Titlu:</b></td>
					<td><b>Categorie:</b></td>
					<td><b>Rating:</b></td>

				</tr>
				<%
                   jb.connect();
                    ResultSet rs = jb.ShowTabel("carti");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idcarte");
                %>
				<tr>
					<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
					<td><%= x%></td>
					<td><%= rs.getString("Titlu")%></td>
					<td><%= rs.getString("Categorie")%></td>
					<td><%= rs.getString("Rating")%></td>
					<%
                        }
                    %>
				</tr>
			</table>
			<br />
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
			<a href="nou_Carte.jsp"><b>Adauga Carte</b></a>
		</p>
		<p align="center">
			<a href="modifica_Carte.jsp"><b>Modifica Carte</b></a>
		</p>
		<p align="center">
			<a href="index.html"><b>Home</b></a> <br />
		</p>
	</div>
</body>
</html>