/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ma.projet.entities.LigneCommandeProduit;
import ma.projet.entities.LigneCommandeProduitPK;
import ma.projet.entities.Produit;
import ma.projet.services.CategorieService;
import ma.projet.services.CommandeService;
import ma.projet.services.LigneCommandeProduitService;
import ma.projet.services.ProduitService;

/**
 *
 * @author Zineb
 */
@WebServlet(name = "LigneCommandeController", urlPatterns = {"/LigneCommandeController"})
public class LigneCommandeController extends HttpServlet {

    private LigneCommandeProduitService lcps;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        lcps = new LigneCommandeProduitService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProduitService ps = new ProduitService();
        CommandeService cs = new CommandeService();

        if (request.getParameter("op") != null) {
            String op = request.getParameter("op");
            if (op.equals("delete")) {
                lcps.delete(lcps.getById(Integer.parseInt(request.getParameter("id1")), Integer.parseInt(request.getParameter("id2"))));
            } else if (op.equals("edit")) {
                request.getRequestDispatcher("EditLigneCommande.jsp")
                        .forward(request, response);
            } else if (op.equals("update")) {
                int idCommande = Integer.parseInt(request.getParameter("commande"));
                int idProduit = Integer.parseInt(request.getParameter("produit"));
                int quantite = Integer.parseInt(request.getParameter("quantite"));
                LigneCommandeProduitPK pk = new LigneCommandeProduitPK(idProduit, idCommande);
                LigneCommandeProduit updatedLigneComProd = new LigneCommandeProduit(pk, quantite);
                lcps.update(updatedLigneComProd);
            }
        } else if (request.getParameter("commande") != null) {
            int idCommande = Integer.parseInt(request.getParameter("commande"));
            int idProduit = Integer.parseInt(request.getParameter("produit"));
            int quantite = Integer.parseInt(request.getParameter("quantite"));
            LigneCommandeProduitPK pk = new LigneCommandeProduitPK(idProduit, idCommande);
            lcps.create(new LigneCommandeProduit(pk, quantite));
        }
        response.sendRedirect("LigneCommande.jsp");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
