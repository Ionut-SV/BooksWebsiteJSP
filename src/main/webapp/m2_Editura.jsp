<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Editura</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/nou.css" rel="stylesheet" type="text/css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div>
		<h1 align="center">Tabela Edituri:</h1>
		<br />
		<p align="center">
			<a href="tabela_Edituri.jsp"><b>Tabela Edituri</b></a>
		</p>
		<p align="center">
			<a href="index.html"><b>Home</b></a> <br />
			<%
            jb.connect();
			long aux = java.lang.Long.parseLong(request.getParameter("ideditura"));
			String idautor = request.getParameter("idautor");
            String idcarte = request.getParameter("idcarte");
            String nume_editura = request.getParameter("nume_editura");
            String data_publicarii = request.getParameter("data_publicarii");
            String copii_vandute = request.getParameter("copii_vandute");
            String tara = request.getParameter("tara");
            

            String[] valori = {idautor, idcarte, nume_editura, data_publicarii, copii_vandute, tara};
            String[] campuri = {"idautor", "idcarte", "nume_editura", "data_publicarii", "copii_vandute", "tara"};
            jb.ModifyTabel("edituri", "ideditura", aux, campuri, valori);
            jb.disconnect();
        %>
		
		<h1 align="center">Modificarile au fost efectuate !</h1>
	</div>
</body>
</html>