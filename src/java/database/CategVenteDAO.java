/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import static database.ClientDAO.requete;
import static database.VenteDAO.requete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modele.CategVente;
import modele.Client;
import modele.Vente;
/**
 *
 * @author Zakina
 */
public class CategVenteDAO {
    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
     public static ArrayList<CategVente>  getLesCategVentes(Connection connection){      
        ArrayList<CategVente> lesCategVentes = new  ArrayList<CategVente>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select * from categvente where categvente.archive is null or categvente.archive=0");
            
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                CategVente uneCategVente = new CategVente();
                uneCategVente.setCode(rs.getString("code"));
                uneCategVente.setLibelle(rs.getString("libelle"));
                lesCategVentes.add(uneCategVente);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesCategVentes ;    
    } 
    
    public static CategVente ajouterCategVente(Connection connection, CategVente uneCategVente){
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("insert into categvente ( code, libelle)\n" +
                    "VALUES (?,?)");
            requete.setString(1, uneCategVente.getCode());
            requete.setString(2, uneCategVente.getLibelle());
            

           /* Exécution de la requête */
            requete.executeUpdate();
            
            
            
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return uneCategVente ;    
    }
  
     public static CategVente getuneCategVente(Connection connection, String id){  
        CategVente uneCategVente = new CategVente();
        try
        {
            //preparation de la requete
        
         requete=connection.prepareStatement("select * from categvente where code=?");
         requete.setString(1, id);
         System.out.println("REQUETE " + requete);
         //executer la requete
         rs=requete.executeQuery();
         
       
          while (rs.next()) {  
               uneCategVente.setCode(rs.getString("code"));
                uneCategVente.setLibelle(rs.getString("libelle"));
                
            }
         
         
      
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return uneCategVente;   
        
  }
   
      public static CategVente modifierCategVente(Connection connection, CategVente uneCategVente){      
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("update categvente set libelle=? where code=?");
            System.out.println("CATEG requete="+requete);
            
            requete.setString(1, uneCategVente.getLibelle());
            requete.setString(2, uneCategVente.getCode());
           
            

          
            requete.executeUpdate();
            
            
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return uneCategVente ;    
    }
     
     
     
}
