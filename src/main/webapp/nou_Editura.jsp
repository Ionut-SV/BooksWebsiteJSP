<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Editura</title>
<link href="css/nou.css" rel="stylesheet" type="text/css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div>
		<%
            long idcarte, idautor;
            String id1, id2, titlu, categorie, rating, nume, prenume, gen, data_publicarii, tara, nume_editura, copii_vandute;
            int varsta;
            id1 = request.getParameter("idautor");
            id2 = request.getParameter("idcarte");
            data_publicarii = request.getParameter("data_publicarii");
            copii_vandute = request.getParameter("copii_vandute");
            tara = request.getParameter("tara");
            nume_editura = request.getParameter("nume_editura");
            if (id1 != null) {
                jb.connect();
                jb.addPublisher(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), data_publicarii, java.lang.Integer.parseInt(copii_vandute), tara, nume_editura);
                jb.disconnect();
        %>
		<h1 align="center">Edituri</h1>
        <br/>
        <p align="center"><a href="tabela_Edituri.jsp"><b>Tabela Edituri</b></a></p>
        <p align="center"><a href="index.html"><b>Home</b></a> </p>
        <br/>
        <br/>
        <h2 align="center">Editura a fost adaugata cu succes !</h2>
        <%
        } else {
        jb.connect();
        ResultSet rs1 = jb.ShowTabel("autori");
        ResultSet rs2 = jb.ShowTabel("carti");
        %>
		<h1 align="center"> Adauga Editura:</h1>
        <br/>
        <form action="nou_Editura.jsp" method="post">
            <table align="center">
				<tr>
					<td align="right"> Selectati Autorul:</td>
					 <td>
					<SELECT NAME="idautor">
							<%
                                    while(rs1.next()){
                                        idautor = rs1.getInt("idautor");
                                        nume = rs1.getString("nume");
                                        prenume = rs1.getString("prenume");
                                        varsta = rs1.getInt("varsta");
                                        gen = rs1.getString("gen");
                                %>
							<OPTION VALUE="<%= idautor%>"><%= idautor%>,<%= nume%>,<%= prenume%>,<%= varsta%>,<%= gen%></OPTION>
							<%
                                    }
                                %>
					</SELECT>

					</td>
				</tr>
				<tr>
					<td align="right"> Selectati Cartea:</td>
					<td>
					<SELECT NAME="idcarte">
							<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
							<%
                                    while(rs2.next()){
                                        idcarte = rs2.getInt("idcarte");
                                        titlu = rs2.getString("titlu");
                                        categorie = rs2.getString("categorie");
                                        rating = rs2.getString("rating");
                                %>
							<OPTION VALUE="<%= idcarte%>"><%= idcarte%>,<%= titlu%>,<%= categorie%>,<%= rating%></OPTION>
							<%
                                    }
                                %>
					</SELECT>
					</td>
				</tr>
				<tr>
					<td align="right">Nume Editura:</td>
					<td><input type="text" name="nume_editura" size="30" /></td>
				</tr>
				<tr>
					<td align="right">Data publicarii:</td>
					<td><input type="text" name="data_publicarii" size="30" /></td>
				</tr>
				<tr>
					<td align="right">Copii vandute:</td>
					<td><input type="text" name="copii_vandute" size="30" /></td>
				</tr>
				<tr>
					<td align="right">Tara:</td>
					<td><input type="text" name="tara" size="30" /></td>
				</tr>
			</table>
			<p align="center"> <input type="submit" value="Adauga Editura" />
			<br/>
            <p align="center"><a href="tabela_Edituri.jsp"><b>Tabela Edituri</b></a> </p>
        	<p align="center"><a href="index.html"><b>Home</b></a> </p>
        	<br/>
		</form>
		<%
            }
        %>
	</div>
</body>
</html>