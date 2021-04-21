<%-- 
    Document   : lieuModifier
    Created on : 15 oct. 2020, 09:01:56
    Author     : Alexis
--%>

<%@page import="formulaires.LieuForm"%>
<%@page import="modele.Lieu"%>
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
        <title>Modification d'un lieu</title>
    </head>
    <body>
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
        <h1>MODIFIER LIEUX</h1>
    </center>
        <%
        
        LieuForm form = (LieuForm)request.getAttribute("form");
        Lieu leLieu = (Lieu)request.getAttribute("pLeLieu");
        
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
                        
                
    <form class="form-inline" action="lieuModifier" method="POST" style="width:50%; margin-bottom:170px; background-color: #eee; border:1px solid black; border-radius: 1%">
        <div style="width:100%; margin-top:10px">
            
            <label for="id">ID </label>
                <input class="form-control" style="margin:0px 20% 10px 20%; width:60%" id="id" type="text" name="id"  size="30" maxlength="50" value="<%out.println(leLieu.getId());%>" readonly >
                </br>
               
            <label for="ville">VILLE </label>
                <input class="form-control" style="margin:0px 20% 10px 20%; width:60%" id="ville" type="text" name="ville"  size="30" maxlength="50" value="<%out.println(leLieu.getVille());%>" >
                </br>
        <label for="nbBoxes"> NOMBRE BOXES </label>
                <input class="form-control" style="margin:0px 20% 10px 20%; width:60%" id="nbBoxes" type="text" name="nbBoxes"  size="30" maxlength="50" value="<%out.println(leLieu.getNbBoxes());%>">
                </br>
        <label for="commentaire"> COMMENTAIRE </label>
                <input class="form-control" style="margin:0px 20% 10px 20%; width:60%" id="commentaire" type="text" name="commentaire"  size="30" maxlength="255" value="<%out.println(leLieu.getCommentaires());%>">
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

