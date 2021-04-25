<%--
    Document   : infoCheval
    Created on : 24 sept. 2020, 10:03:18
    Author     : sio2
--%>

<%@page import="modele.Cheval"%>
<%@page import="modele.Client"%>
<%@page import="modele.TypeCheval"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/stylesheet.css">
        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <title>INFORMATIONS CHEVAL</title>
    </head>
    <body style="position: relative; min-height: 100vh;">
        <div style="padding-bottom: 50px">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="../index.html">
               <img src="../vues/images/logo.jpg" width="50" height="40" style="display: inline-block;">
            </a>
  <a class="navbar-brand" href="../index.html">Equida</a>
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
        <h1>INFORMATIONS CHEVAL</h1>
        
        
         <%
        Cheval unCheval = (Cheval)request.getAttribute("punCheval");
        %> 
        

                 <div>

            
                    <%
                        
                        if(unCheval.getCheminPhoto()!=null){
                            out.println("<td>");
                            out.println("<img src='"+unCheval.getCheminPhoto()+"' width='500' height='300'>");
                            out.println("</td>");
                        }else{
                            out.println("<td>");
                            out.println("<img src='../vues/images/no-image.png' width='300' height='300'>");
                            out.println("</td>");
                        }
                    %>
                
                    </div>
                    </br>
            <table class="table table-striped" style="width:40%; margin-bottom:170px;">
                <tr>
                    <td>
                        <label for="ID">ID</label>   
                    </td>
                    <td>
                    <%
                        
                        out.println("");
                        out.println(unCheval.getId());
                        out.println("");
                    %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="SIRE">SIRE</label>
                    </td>
                    <td>
                    <%
                        out.println("");
                        out.println(unCheval.getSire());
                        out.println("");
                    %> 
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="NOM">NOM</label>
                    </td>
                    <td>
                    <%
                        out.println("");
                        out.println(unCheval.getNom());
                        out.println("");
                    %> 
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="SEXE">SEXE</label>
                    </td>
                    <td>
                       <%
                        out.println("");
                        out.println(unCheval.getSexe());
                        out.println("");
                    %> 
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="TYPECHEVAL">TYPE CHEVAL</label>  
                    </td>
                    <td>
                    <%
                        out.println("");
                        out.println(unCheval.getUnTypeCheval().getLibelle());
                        out.println("");
                    %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="PERE">PERE</label>
                    </td>
                    <td>
                    <%
                        
                        if (unCheval.getUnPere().getId() != 1 && unCheval.getUnPere().getId() != 2){
                            out.println("<a href ='../ServletCheval/infoCheval?idCheval="+ unCheval.getUnPere().getId()+ "'>");
                        out.println(unCheval.getUnPere().getNom());
                        out.println("</a>");
                        }
                        else{
                        out.println("");
                        out.println(unCheval.getUnPere().getNom());
                        out.println("");
                        }
                    %> 
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="MERE">MERE</label>
                    </td>
                    <td>
                    <%
                        if (unCheval.getUneMere().getId() != 1 && unCheval.getUneMere().getId() != 2){
                            out.println("<a href ='../ServletCheval/infoCheval?idCheval="+ unCheval.getUneMere().getId()+ "'>");
                        out.println(unCheval.getUneMere().getNom());
                        out.println("</a>");
                        }
                        else{
                        out.println("");
                        out.println(unCheval.getUneMere().getNom());
                        out.println("");
                        }
                    %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="ECURIE">ECURIE</label>
                    </td>
                    <td>
                       <%
                        out.println("");
                        out.println(unCheval.getUnClient().getNom()+" "+unCheval.getUnClient().getPrenom());
                        out.println("");
                        
                    %>
                    </td>
                </tr>
                
            </table>
        </center>
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
