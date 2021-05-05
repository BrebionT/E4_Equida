/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package formulaires;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import modele.Lieu;

/**
 *
 * @author sio2
 */
public class LieuForm {
    
     private String resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public void setResultat(String resultat) {
        this.resultat = resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public void setErreurs(Map<String, String> erreurs) {
        this.erreurs = erreurs;
    }
    
      private void setErreur( String champ, String message ) {
    erreurs.put(champ, message );
    }
      
    
      
    private void validationVille( String ville ) throws Exception {
        if ( ville == null || ville.length() < 2 ) {
        throw new Exception( "La ville doit contenir au moins 2 caractères." );
        }
    }
    
    private void validationNbBoxes( Integer nbboxes ) throws Exception {
        if ( nbboxes == null || nbboxes <= 0 ) {
        throw new Exception( "Le nombre de boxe doit être indiqué." );
        }
    }
    
    private void validationCommentaire( String commentaire ) throws Exception {
        if ( commentaire == null || commentaire.length() < 2 ) {
        throw new Exception( "Le commentaire doit contenir au moins 2 caractères." );
        }
    }
    
    private static String getDataForm( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }   
    }
    
    
    public Lieu AjouterLieu( HttpServletRequest request ) {
      
        Lieu unLieu  = new Lieu();
        
        //String id = getDataForm (request, "id");
        String ville = getDataForm( request, "ville");
        String nbBoxes = getDataForm(request,"nbBoxes");
        String commentaire = getDataForm(request,"commentaire");
        
      
       
       try {
             validationVille( ville );
        } catch ( Exception e ) {
            setErreur( "ville", e.getMessage() );
        }
        
        try {
             validationNbBoxes( Integer.parseInt(nbBoxes) );
        } catch ( Exception e ) {
            setErreur( "nbBoxes", e.getMessage() );
        }
        
        try {
             validationCommentaire( commentaire );
        } catch ( Exception e ) {
            setErreur( "commentaire", e.getMessage() );
        }

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
    
      
      
      
      unLieu.setVille(ville);
      
      if(nbBoxes != null){
          try{
              unLieu.setNbBoxes(Integer.parseInt(nbBoxes));
          }
          catch( Exception e ){
               System.out.println("Erreur : "+e);
          }
          
      }
      
      unLieu.setCommentaires(commentaire);
        
   
               
       
        return unLieu;
    }
    
    
    
    
    
}
