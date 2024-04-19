<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Carte</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="css/nou.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center"> Tabela Carti:</h1>
        <br/>
        <p align="center"><a href="nou_Carte.jsp"><b>Adauga o noua carte.</b></a> 
        <p align="center">
        	<a href="index.html"><b>Home</b></a>
        <br/>
        <br/>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idcarte"));
            String titlu = request.getParameter("titlu");
            String categorie = request.getParameter("categorie");
            String rating = request.getParameter("rating");

            String[] valori = {titlu, categorie, rating};
            String[] campuri = {"titlu", "categorie", "rating"};
            jb.ModifyTabel("carti", "idcarte", aux, campuri, valori);
            jb.disconnect();
        %>
        <h2 align="center">Modificarile au fost efectuate !</h2>
    
    </div>
    </body>
</html>