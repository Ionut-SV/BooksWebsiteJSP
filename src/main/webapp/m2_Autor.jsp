<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Autor</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/nou.css" rel="stylesheet" type="text/css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div>
		<h1 align="center">Autori:</h1>
		<br />
		<p align="center">
			<a href="tabela_Autori.jsp"><b>Tabela Autori</b></a>
		</p>
		<p align="center">
			<a href="index.html"><b>Home</b></a> <br /> <br /> <br />
			<%
            jb.connect();
            long aux = java.lang.Long.parseLong(request.getParameter("idautor"));
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String varsta = request.getParameter("varsta");
            String gen = request.getParameter("gen");

            String[] valori = {nume, prenume, varsta, gen};
            String[] campuri = {"nume", "prenume", "varsta", "gen"};
            jb.ModifyTabel("autori", "idautor", aux, campuri, valori);
            jb.disconnect();
        %>
		
		<h1 align="center">Modificarile au fost efectuate !</h1>
	</div>
</body>
</html>