/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package formulaires;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import modele.CategVente;
import modele.Client;
import modele.Pays;

/**
 *
 * @author Zakina
 */
public class ClientForm {
    
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
    
    //méthode de validation du champ de saisie nom
    private void validationNom( String nom ) throws Exception {
        if ( nom == null || nom == "" ) {
        throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
        }
    }
    
    private void validationPrenom( String prenom ) throws Exception {
        if ( prenom == null || prenom == "" ) {
        throw new Exception( "Le prénom d'utilisateur doit contenir au moins 3 caractères." );
        }
    }
    
    private void validationRue( String rue ) throws Exception {
        if ( rue == null || rue == "") {
        throw new Exception( "Le nom de la rue doit contenir au moins 5 caractères." );
        }
    }
    
    private void validationCodePostal( String cp ) throws Exception {
        if ( cp == null || cp.length() != 5 ) {
        throw new Exception( "Le code postal doit contenir 5 caractères." );
        }
    }
    
    private void validationVille( String ville ) throws Exception {
        if ( ville == null || ville == "" ) {
        throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
        }
    }
    
    private void validationPays( String pays ) throws Exception {
        if ( pays == null || pays == "") {
        throw new Exception( "Le pays doit être choisi." );
        }
    }
    
    private void validationCateg( String[] categ ) throws Exception {
        if ( categ == null ) {
        throw new Exception( "La catégorie doit être choisi." );
        }
    }

    private void setErreur( String champ, String message ) {
    erreurs.put(champ, message );
    }    
    
    private static String getDataForm( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }   
    }
    
    
    public Client ajouterClient( HttpServletRequest request ) {
      
        Client unClient  = new Client();
         
        String nom = getDataForm( request, "nom" );
        String prenom = getDataForm( request, "prenom");
        String rue = getDataForm( request, "rue" );
        String copos = getDataForm( request, "copos");
        String ville = getDataForm( request, "ville" );
        //String pays = getDataForm( request, "pays" );
        
        // Traitement de la liste à choix multiple
        //Pour chq catégorie selectionné, on instancie une nouvelle catégorie et on l'ajoute au client
        CategVente uneCategVente ;
        String[] categVente = request.getParameterValues("categVente");
        for (int i=0; i<categVente.length; i++){
            uneCategVente = new CategVente();
            uneCategVente.setCode(categVente[i]);
            unClient.addUneCategVente(uneCategVente);
        }
        
        Pays unPays = new Pays();
        String p_id = getDataForm( request, "codePays" );
        unPays.setCode(p_id);
        
        
 
       
        try {
             validationNom( nom );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        
        try {
             validationPrenom( prenom );
        } catch ( Exception e ) {
            setErreur( "prenom", e.getMessage() );
        }
        
        try {
             validationRue( rue );
        } catch ( Exception e ) {
            setErreur( "rue", e.getMessage() );
        }
        
        try {
             validationCodePostal( copos );
        } catch ( Exception e ) {
            setErreur( "copos", e.getMessage() );
        }
        
        try {
             validationVille( ville );
        } catch ( Exception e ) {
            setErreur( "ville", e.getMessage() );
        }
        
        try {
             validationPays( unPays.getCode() );
        } catch ( Exception e ) {
            setErreur( "pays", e.getMessage() );
        }
        
        
        
        

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
         
        unClient.setNom(nom);
        unClient.setPrenom(prenom);
        unClient.setRue(rue);
        unClient.setCopos(copos);
        unClient.setVille(ville);
        unClient.setUnPays(unPays);
       
        return unClient ;
    }
    
    
    

}
