<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Carte</title>
<link href="css/nou.css" rel="stylesheet" type="text/css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div>
		<%
            String titlu = request.getParameter("titlu");
            String categorie = request.getParameter("categorie");
            String rating = request.getParameter("rating");
            if (titlu != null) {
                jb.connect();
                jb.addBook(titlu, categorie, java.lang.Float.parseFloat(rating));
                jb.disconnect();
        %>
		<h1 align="center">Carti</h1>
        <br/>
        <p align="center"><a href="tabela_Carti.jsp"><b>Tabela Carti</b></a></p>
        <p align="center"><a href="index.html"><b>Home</b></a> </p>
        <br/>
        <br/>
        <h2 align="center">Cartea a fost adaugata cu succes !</h2>
        <%
		
        } else {
        %>
		<h1 align="center">Adauga Carte:</h1>
		<form action="nou_Carte.jsp" method="post">
			<table align="center">
				<tr>
					<td align="right">Titlu:</td>
					<td><input type="text" name="titlu" size="40" /></td>
				</tr>
				<tr>
					<td align="right">Categorie:</td>
					<td><input type="text" name="categorie" size="30" /></td>
				</tr>
				<tr>
					<td align="right">Rating:</td>
					<td><input type="text" name="rating" size="30" /></td>
				</tr>
			</table>
			<p align="center"><input type="submit" value="Adauga Cartea" />
			<br/>
            <p align="center"><a href="tabela_Carti.jsp"><b>Tabela Carti</b></a> </p>
        	<p align="center"><a href="index.html"><b>Home</b></a> </p>
        	<br/>
		</form>
		<%
            }
        %>
	</div>
</body>
</html>