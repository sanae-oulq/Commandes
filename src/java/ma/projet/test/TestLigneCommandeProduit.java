/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.test;

import ma.projet.entities.Commande;
import ma.projet.entities.LigneCommandeProduit;
import ma.projet.entities.LigneCommandeProduitPK;
import ma.projet.entities.Produit;
import ma.projet.services.CommandeService;
import ma.projet.services.LigneCommandeProduitService;
import ma.projet.services.ProduitService;

/**
 *
 * @author Lachgar
 */
public class TestLigneCommandeProduit {

    public static void main(String[] args) {
        CommandeService cs = new CommandeService();
        ProduitService ps = new ProduitService();
        LigneCommandeProduitService lcps = new LigneCommandeProduitService();
        Commande c = cs.getById(3);
        Produit p = ps.getById(3);

        LigneCommandeProduitPK lpk = new LigneCommandeProduitPK(p.getId(), c.getId());
        
        LigneCommandeProduit lp = new LigneCommandeProduit(lpk, 10);
        lcps.create(lp);
       
    }
}
