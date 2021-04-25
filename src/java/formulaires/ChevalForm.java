/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package formulaires;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import modele.Cheval;
import modele.Client;
import modele.TypeCheval;

/**
 *
 * @author sio2
 */
public class ChevalForm {
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
        if ( nom == null || nom.length() < 3 ) {
        throw new Exception( "Le nom du cheval doit contenir au moins 5 caractères." );
        }
    }
    
    private void validationSire( String sire ) throws Exception {
        if ( sire == null || sire.length() < 5 ) {
        throw new Exception( "Le sire du cheval doit contenir au moins 5 caractères." );
        }
    }
    
    private void validationSexe( String sexe ) throws Exception {
        if ( sexe == null || sexe.length() <= 0 ) {
        throw new Exception( "Le sexe du cheval doit contenir être choisi." );
        }
    }
    
    private void validationClient( Integer client ) throws Exception {
        if ( client == null || client <= 0 ) {
        throw new Exception( "Le client doit être choisi." );
        }
    }
    
    private void validationTypeCheval( Integer type ) throws Exception {
        if ( type == null || type <=  0 ) {
        throw new Exception( "Le sire du cheval doit contenir au moins 5 caractères." );
        }
    }
    
    private void validationChevalPere( Integer pere ) throws Exception {
        if ( pere == null || pere <=  0 ) {
        throw new Exception( "Un père doit être choisie" );
        }
    }
    
    private void validationChevalMere( Integer mere ) throws Exception {
        if ( mere == null || mere <=  0 ) {
        throw new Exception( "Une mère doit être choisie" );
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
    
    
    public Cheval ajouterCheval( HttpServletRequest request ) {
      
        Cheval unCheval  = new Cheval();
      
        
        
        String nom = getDataForm( request, "nom" );
        String sexe = getDataForm( request, "sexe");
        String sire = getDataForm( request, "sire" );
        
        TypeCheval unTypeCheval = new TypeCheval();
        String tc_id = getDataForm( request, "typeCheval" );
        unTypeCheval.setId(Integer.parseInt(tc_id));
        
        Client unClient = new Client();
        String c_id = getDataForm( request, "client" );
        unClient.setId(Integer.parseInt(c_id));
        
        Cheval unChevalPere = new Cheval();
        String cp_id = getDataForm( request, "pere" );
        unChevalPere.setId(Integer.parseInt(cp_id));
        
        Cheval unChevalMere = new Cheval();
        String cm_id = getDataForm( request, "mere" );
        unChevalMere.setId(Integer.parseInt(cm_id));
        
 
       
        try {
             validationNom( nom );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        
        unCheval.setNom(nom);
        
        try {
             validationSire( sire );
        } catch ( Exception e ) {
            setErreur( "sire", e.getMessage() );
        }
        
        unCheval.setSire(sire);
        
        try {
             validationSexe( sexe );
        } catch ( Exception e ) {
            setErreur( "sexe", e.getMessage() );
        }
        
        unCheval.setSexe(sexe);
        
        try {
             validationTypeCheval( unTypeCheval.getId() );
        } catch ( Exception e ) {
            setErreur( "unTypeCheval", e.getMessage() );
        }
        
        unCheval.setUnTypeCheval(unTypeCheval);
        
        try {
             validationClient( unClient.getId() );
        } catch ( Exception e ) {
            setErreur( "unClient", e.getMessage() );
        }
        
        unCheval.setUnClient(unClient);
        
        try {
             validationChevalPere( unChevalPere.getId() );
        } catch ( Exception e ) {
            setErreur( "unChevalPere", e.getMessage() );
        }
        
        unCheval.setUnPere(unChevalPere);
        
        try {
             validationChevalMere( unChevalMere.getId() );
        } catch ( Exception e ) {
            setErreur( "unChevalMere", e.getMessage() );
        }
        
        unCheval.setUneMere(unChevalMere);

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
         
      
        //unCheval.setNom(nom);
        //unCheval.setSexe(sexe);
        
        //unCheval.setUnTypeCheval(unTypeCheval);
        //unCheval.setUnClient(unClient);
        //unCheval.setUnPere(unChevalPere);
        //unCheval.setUneMere(unChevalMere);
  
        System.out.println(unCheval.getSire());
            System.out.println(unCheval.getNom());
            System.out.println(unCheval.getUnTypeCheval().getId());
            System.out.println(unCheval.getSexe());
            System.out.println(unCheval.getUnPere());
            System.out.println(unCheval.getUneMere());
            System.out.println(unCheval.getUnClient());
     
       
        return unCheval;
    }
    
    public Cheval modifierCheval( HttpServletRequest request ) {
      
        Cheval unCheval  = new Cheval();
      
        
        String id = getDataForm( request, "id");
        String nom = getDataForm( request, "nom" );
        String sexe = getDataForm( request, "sexe");
        String sire = getDataForm( request, "sire" );
        
        TypeCheval unTypeCheval = new TypeCheval();
        String tc_id = getDataForm( request, "typeCheval" );
        unTypeCheval.setId(Integer.parseInt(tc_id));
        
        Client unClient = new Client();
        String c_id = getDataForm( request, "client" );
        unClient.setId(Integer.parseInt(c_id));
        
        Cheval unChevalPere = new Cheval();
        String cp_id = getDataForm( request, "pere" );
        unChevalPere.setId(Integer.parseInt(cp_id));
        
        Cheval unChevalMere = new Cheval();
        String cm_id = getDataForm( request, "mere" );
        unChevalMere.setId(Integer.parseInt(cm_id));
        
 
       
        try {
             validationNom( nom );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        unCheval.setNom(nom);

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
         
        unCheval.setId(Integer.parseInt(id));
        unCheval.setNom(nom);
        unCheval.setSexe(sexe);
        unCheval.setSire(sire);
        unCheval.setUnTypeCheval(unTypeCheval);
        unCheval.setUnClient(unClient);
        unCheval.setUnPere(unChevalPere);
        unCheval.setUneMere(unChevalMere);     
       
        return unCheval;
    }
}
