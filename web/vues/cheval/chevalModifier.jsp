<%-- 
    Document   : chevalModifier
    Created on : 12 nov. 2020, 13:13:32
    Author     : Thibault
--%>

<%@page import="modele.Cheval"%>
<%@page import="modele.TypeCheval"%>
<%@page import="modele.Client"%>
<%@page import="formulaires.ChevalForm"%>
<%@page import="modele.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.Pays"%>
<%@page import="formulaires.ClientForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cheval Modifier</title>
    </head>
    <body>
        <center>
        <h1>MODIFIER CHEVAL</h1>
        </center>
            <%
                ChevalForm form = (ChevalForm)request.getAttribute("form");
                Cheval leCheval = (Cheval)request.getAttribute("pLeCheval");
            %>

            <form class="form-inline" action="modifierCheval" method="POST" style="width:50%; margin-bottom:170px; background-color: #eee; border:1px solid black; border-radius: 1%">
                <div style="width:100%; margin-top:10px">    
                <label for="id">ID  </label>
                    <input id="id" style="margin:0px 20% 10px 20%; width:60%" type="text" name="id"  size="15" maxlength="15" value ="<%out.println(leCheval.getId());%>">
                    </br>
                    
                    <label for="sire">SIRE  </label>
                    <input id="sire" style="margin:0px 20% 10px 20%; width:60%" type="text" name="sire"  size="15" maxlength="15" value ="<%out.println(leCheval.getSire());%>">
                    </br>

                    <label for="nom">NOM  </label>
                    <input id="nom"  style="margin:0px 20% 10px 20%; width:60%" type="text"  name="nom" size="20" maxlength="20" value="<%out.println(leCheval.getNom());%>">      
                    </br>
                     
                    <label for="sexe">SEXE : </label>
                    <select name="sexe" style="margin:0px 20% 10px 20%; width:60%" size="2">
                        <%
                        if(leCheval.getSexe().equals("M")){
                            out.println("<option value ='M' selected='selected'>M</option>");
                            out.println("<option value ='F'>F</option>");
                        }else{
                            out.println("<option value ='M'>M</option>");
                            out.println("<option value ='F' selected='selected'>F</option>");
                        }
                        %>
                    </select>
                        
                    <label for="typeCheval">TYPE DE CHEVAL : </label>
                <select name="typeCheval" style="margin:0px 20% 10px 20%; width:60%" size="5">
                <%
                        ArrayList<TypeCheval> lesTypesChevaux = (ArrayList)request.getAttribute("pLesTypesChevaux");
                        for (int i=0; i<lesTypesChevaux.size();i++){
                            TypeCheval tc = lesTypesChevaux.get(i);
                            if(leCheval.getUnTypeCheval().getId()==tc.getId()){
                                out.println("<option value ='" + tc.getId() + "' selected='selected'>" + tc.getLibelle() + "</option>");
                            }else{
                            out.println("<option value ='" + tc.getId() + "'>" + tc.getLibelle() + "</option>"); 
                            }
                        }
                    %>
                </select></br>
               
                
                <label for="client">CLIENT : </label>
                <select name="client" style="margin:0px 20% 10px 20%; width:60%" size="5">
                <%
                        ArrayList<Client> lesClients = (ArrayList)request.getAttribute("pLesClients");
                        for (int i=0; i<lesClients.size();i++){
                            Client cl = lesClients.get(i);
                            if(leCheval.getUnClient().getId()==cl.getId()){
                                out.println("<option value ='" + cl.getId() + "' selected='selected'>" + cl.getNom() + "</option>");
                            }else{
                            out.println("<option value ='" + cl.getId() + "'>" + cl.getNom() + "</option>"); 
                            }
                        }
                    %>
                </select></br>
                
                <label for="pere">PERE DU CHEVAL : </label>
                <select name="pere" style="margin:0px 20% 10px 20%; width:60%" size="5">
                <%
                        ArrayList<Cheval> lesChevauxPeres = (ArrayList)request.getAttribute("pLesChevauxMales");
                        for (int i=0; i<lesChevauxPeres.size();i++){
                            Cheval c = lesChevauxPeres.get(i);
                            if(leCheval.getUnPere().getId()==c.getId()){
                                out.println("<option value ='" + c.getId() + "' selected='selected'>" + c.getNom() + "</option>");
                            }else{
                            out.println("<option value ='" + c.getId() + "'>" + c.getNom() + "</option>"); 
                            }
                        }
                    %>
                </select></br>
                
                <label for="mere">MERE DU CHEVAL : </label>
                <select name="mere" style="margin:0px 20% 10px 20%; width:60%" size="5">
                <%
                        ArrayList<Cheval> lesChevauxMeres = (ArrayList)request.getAttribute("pLesChevauxFemelles");
                        for (int i=0; i<lesChevauxMeres.size();i++){
                            Cheval c = lesChevauxMeres.get(i);
                            if(leCheval.getUneMere().getId()==c.getId()){
                                out.println("<option value ='" + c.getId() + "' selected='selected'>" + c.getNom() + "</option>");
                            }else{
                            out.println("<option value ='" + c.getId() + "'>" + c.getNom() + "</option>"); 
                            }
                        }
                    %>
                </select>
                </br>
                        

                    <div style="text-align:center;">
                <input style="margin:10px auto;" type="submit" name="valider" id="valider" value="Valider"/>
            </div>
                </div>
                </form>
                     <footer class="footer-distributed" style="position:fixed; min-height: 0">

			<div class="footer-right">

				<a href="https://github.com/BrebionT/E4_Equida"><i class="fab fa-github"></i></a>

			</div>

			<div class="footer-left">

				<p class="footer-links">
					&nbsp; &#149; <a class="link-1" href="../index.html"> Accueil</a> &nbsp;

					&nbsp; &#149; <a class="link-1" href="../ServletVentes/listerLesVentes"> Les Ventes</a> &nbsp;

					&nbsp; &#149; <a class="link-1" href="../ServletAdmin/listerLesLieux"> Les Lieux </a> &nbsp;

					&nbsp; &#149; <a class="link-1" href="../ServletAdmin/listerLesCategVente"> Les Catégories de Ventes </a> &nbsp;

				</p>

				<p>Equida &copy; 2020</p>
			</div>

		</footer>
    </body>
</html>
