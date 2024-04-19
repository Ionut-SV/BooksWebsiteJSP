<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica Editura</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="css/nou.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center">Modificati Editura:</h1>
        <br/>
        <%
            jb.connect();
        	String nume, prenume, gen, titlu, categorie, nume_editura, data_publicarii,tara ;
        	float rating;
        	int varsta,copii_vandute;
        	
        	String aux = request.getParameter("primarykey");
            if(aux != null){
            	ResultSet rs = jb.ReturnPublisherID(java.lang.Long.parseLong(aux));
	            rs.first();
	            
	            long id1 = rs.getLong("idautor");
	            long id2 = rs.getLong("idcarte");
				long idautor, idcarte;
				
	            nume = rs.getString("nume");
	            prenume = rs.getString("prenume");
	            varsta = rs.getInt("varsta");
	            gen = rs.getString("gen");
	            titlu = rs.getString("titlu");
	            categorie = rs.getString("categorie");
	            rating = rs.getFloat("rating");
	            nume_editura = rs.getString("nume_editura");
	            data_publicarii = rs.getString("data_publicarii");
	            copii_vandute = rs.getInt("copii_vandute");
	            tara = rs.getString("tara");
	            

	            ResultSet rs1 = jb.ShowTabel("autori");
	            ResultSet rs2 = jb.ShowTabel("carti");

        %>
        <form action="m2_Editura.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdEditura:</td>
                    <td> <input type="text" name="ideditura" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">IdAutor:</td>
                    <td> 
                        <SELECT NAME="idautor">
                            <%
                                while (rs1.next()) {
                                    idautor = rs1.getLong("idautor");
                                    nume = rs1.getString("nume");
                                    prenume = rs1.getString("prenume");
                                    varsta = rs1.getInt("varsta");
                                    gen = rs1.getString("gen");
                                    
                                    if (idautor != id1) {
                            %>
                            <OPTION VALUE="<%= idautor%>"><%= idautor%>,<%= nume%>,<%= prenume%>,<%= varsta%>,<%= gen%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idautor%>"><%= idautor%>,<%= nume%>,<%= prenume%>,<%= varsta%>,<%= gen%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">IdCarte:</td>
                    <td> 
                        <SELECT NAME="idcarte">
                            <%
                                while (rs2.next()) {
                                	idcarte = rs2.getLong("idcarte");
                                	titlu = rs2.getString("titlu");
                                	categorie = rs2.getString("categorie");
                                	rating = rs2.getFloat("rating");
                            if (idcarte != id2) {
                            %>
                            <OPTION VALUE="<%= idcarte%>"><%= idcarte%>,<%= titlu%>,<%= categorie%>,<%= rating%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idcarte%>"><%= idcarte%>,<%= titlu%>,<%= categorie%>,<%= rating%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Nume Editura:</td>
                    <td> <input type="text" name="nume_editura" size="30" value="<%= nume_editura%>"/></td>
                </tr>
                <tr>
                    <td align="right">Data Publicarii:</td>
                    <td> <input type="text" name="data_publicarii" size="30" value="<%= data_publicarii%>"/></td>
                </tr>
                <tr>
                    <td align="right">Copii Vandute:</td>
                    <td> <input type="text" name="copii_vandute" size="30" value="<%= copii_vandute%>"/></td>
                </tr>
                <tr>
                    <td align="right">Tara:</td>
                    <td> <input type="text" name="tara" size="30" value="<%= tara%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica">
            </p>
        </form>
        <br/>
        <p align="center"><a href="tabela_Edituri.jsp"><b>Tabela Edituri</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            </p>
        <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
        <%} else{ %>
        <p align="center"><a href="tabela_Edituri.jsp"><b>Tabela Edituri</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            </p>
        <br/>
        <br/>
        <h2 align="center">Selectati o linie pe care doriti sa o modificati inainte sa apasati butonul "Modifica"</h2>
        <%} %>
    </div>
    </body>
    
</html>