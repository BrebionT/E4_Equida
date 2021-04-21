<%--
    Document   : ClientAjouter
    Created on : 22/06, 16:35:27
    Author     : Zakina
--%>

<%@page import="modele.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.Pays"%>
<%@page import="formulaires.ClientForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/stylesheet.css">
        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <title>Client Ajouter</title>
    </head>
    <body style="position: relative; min-height: 100vh;">
        <div style="padding-bottom: 50px">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">
               <img src="../vues/images/logo.jpg" width="50" height="40" style="display: inline-block;">
            </a>
  <a class="navbar-brand" href="#">Equida</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="../index.html">Accueil <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Listes
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="../ServletVentes/listerLesVentes">Lister Les Ventes</a>
          <a class="dropdown-item" href="../ServletAdmin/listerLesLieux">Lister Les Lieux</a>
          <a class="dropdown-item" href="../ServletAdmin/listerLesPays">Lister Les Pays</a>
          <a class="dropdown-item" href="../ServletAdmin/listerLesCategVente">Lister Les CategVentes</a>
          <a class="dropdown-item" href="../ServletClient/listerLesClients">Lister Les Clients</a>
        </div>
      </li>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Ajouter
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="../ServletClient/ajouterClient">Ajouter Client</a>
          <a class="dropdown-item" href="../ServletCheval/ajouterCheval">Ajouter Cheval</a>
          <a class="dropdown-item" href="../ServletAdmin/ajouterCategVente">Ajouter Catégorie</a>
          <a class="dropdown-item" href="../ServletAdmin/AjouterLieu">Ajouter Lieu</a>
          <a class="dropdown-item" href="../ServletAdmin/ajouterPays">Ajouter Pays</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
    <center>
        <h1>NOUVEAU CLIENT</h1>
    </center>

         <%
                //Client client=(Client)request.getAttribute("client");
                ClientForm form = (ClientForm)request.getAttribute("form");
            %>
        <%
                        String erreur = "";
                        if((String)request.getAttribute("pErreur")!= null){
                            erreur = (String)request.getAttribute("pErreur");
                            out.println("<center>");
                            out.println("<h3>" + erreur + "</h3>");
                            out.println("</center>");
                        }
                                              
                    %>
        <form class="form-inline" action="ajouterClient" method="POST" style="width:50%; margin-bottom:170px; background-color: #eee; border:1px solid black; border-radius: 1%">
            <div style="width:100%; margin-top:10px">
                <label for="nom">NOM :</label>
                <input class="form-control" style="margin:0px 20% 10px 20%; width:60%" id="nom" type="text" name="nom" maxlength="30">
                </br>

                <label for="prenom">PRENOM :</label>
                <input class="form-control" style="margin:0px 20% 10px 20%; width:60%" id="prenom"  type="text"  name="prenom" maxlength="30">
                 </br>

                <label for="rue">RUE :</label>
                <input class="form-control" style="margin:0px 20% 10px 20%; width:60%" id="rue"  type="text"  name="rue"  maxlength="50">
                 </br>


                <label for="copos">CODE POSTAL :</label>
                <input class="form-control" style="margin:0px 20% 10px 20%; width:60%" id="copos"  type="text"  name="copos"  maxlength="5">
                </br>

                <label for="ville">VILLE :</label>
                <input class="form-control" style="margin:0px 20% 10px 20%; width:60%" id="ville"  type="text"  name="ville"  maxlength="40">
                </br>

                <%-- Champ Liste des pays --%>
                <label for="codePays">PAYS :</label>

                <select class="form-control" style="margin:0px 20% 10px 20%; width:60%" name="codePays" id="codePays">
                    <%
                        ArrayList<Pays> lesPays = (ArrayList)request.getAttribute("pLesPays");
                        for (int i=0; i<lesPays.size();i++){
                            Pays p = lesPays.get(i);
                            out.println("<option value='" + p.getCode()+"'>" + p.getNom()+"</option>" );
                        }
                    %>
                </select>
                </br>

                <label for="categVente">CATEGORIE VENTE :</label>
                <select class="form-control" style="margin:0px 20% 10px 20%; width:60%" name="categVente"  >
                <%
                        ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
                        for (int i=0; i<lesCategVente.size();i++){
                            CategVente cv = lesCategVente.get(i);
                            out.println("<option value ='" + cv.getCode() + "'>" + cv.getLibelle() + "</option>"); 
                           
                        }
                    %>
                </select></br>



                <%-- Cases à cocher permettant de choisir les différentes catégories de vente auxquelles le client souhaite s'inscrire
                <label for="categVente">Categories de vente : </label></br>
                 <%
                        ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
                        for (int i=0; i<lesCategVente.size();i++){
                            CategVente cv = lesCategVente.get(i);
                            out.println("<input type='checkbox' id='cb" + i + "' name='" + cv.getCode() + "'>");
                            out.println(cv.getLibelle());
                            out.println("</label></br>");
                        }
                    %>
                    </br>
                    --%>

            <div style="text-align:center;">
                <input style="margin:10px auto;" type="submit" name="valider" id="valider" value="Valider"/>
            </div>

            
            </div>
            </form>
                    </div>
     <footer class="footer-distributed" style="position:absolute; bottom:0; width:100%;height: 150px;">

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
