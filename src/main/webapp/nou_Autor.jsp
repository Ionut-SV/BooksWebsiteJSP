<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Autor</title>
<link href="css/nou.css" rel="stylesheet" type="text/css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div>
		<%
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String varsta = request.getParameter("varsta");
            String gen = request.getParameter("gen");
            if (nume != null) {
                jb.connect();
                jb.addAuthor(nume, prenume, java.lang.Integer.parseInt(varsta), gen);
                jb.disconnect();
         %>
        <h1 align="center">Autori</h1>
        <br/>
        <p align="center"><a href="tabela_Autori.jsp"><b>Tabela Autori</b></a></p>
        <p align="center"><a href="index.html"><b>Home</b></a> </p>
        <br/>
        <br/>
        <h2 align="center">Autorul a fost adaugat succes !</h2>
        <%
        } else {
        %>
		 <h1 align="center">Adauga Autor:</h1>
		<form action="nou_Autor.jsp" method="post">
			<table align="center">
				<tr>
					<td align="right">Nume:</td>
					<td><input type="text" name="nume" size="40" /></td>
				</tr>
				<tr>
					<td align="right">Prenume:</td>
					<td><input type="text" name="prenume" size="30" /></td>
				</tr>
				<tr>
					<td align="right">Varsta:</td>
					<td><input type="text" name="varsta" size="30" /></td>
				</tr>
				<tr>
					<td align="right">Gen:</td>
					<td> <select id="gen" name="gen">
					    <option value="Feminin">Feminin</option>
					    <option value="Masculin">Masculin</option>
				</select></td>
			</table>
			<p align="center"><input type="submit" value="Adaugare Autor" /></p>
		</form>
		<br/>
        <p align="center"><a href="tabela_Autori.jsp"><b>Tabela Autori</b></a> </p>
        <p align="center"><a href="index.html"><b>Home</b></a> </p>
        <br/>
		<%
            }
        %>
		
	</div>
</body>
</html>