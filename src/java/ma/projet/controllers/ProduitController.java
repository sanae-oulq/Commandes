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
import ma.projet.entities.Produit;
import ma.projet.entities.Categorie;
import ma.projet.services.CategorieService;
import ma.projet.services.ProduitService;

/**
 *
 * @author Zineb
 */
@WebServlet(name = "ProduitController", urlPatterns = {"/ProduitController"})
public class ProduitController extends HttpServlet {

    private ProduitService ps;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        ps = new ProduitService();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategorieService cs = new CategorieService();

        if (request.getParameter("op") != null) {
            String op = request.getParameter("op");
            if (op.equals("delete")) {
                ps.delete(ps.getById(Integer.parseInt(request.getParameter("id"))));
            } else if (op.equals("edit")) {
                request.getRequestDispatcher("EditProduit.jsp")
                        .forward(request, response);
            } else if (op.equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                double prix = Double.parseDouble(request.getParameter("prix"));
                String ref = request.getParameter("ref");
                Categorie categ = cs.getById(Integer.parseInt(request.getParameter("categorie")));
                Produit updatedProduct = new Produit(ref, prix, categ);
                updatedProduct.setId(id);
                updatedProduct.setPrix(prix);
                updatedProduct.setReference(ref);
                updatedProduct.setCategorie(categ);
                ps.update(updatedProduct);
            }
        } else if (request.getParameter("prix") != null) {
            Double prix = Double.parseDouble(request.getParameter("prix"));
            String ref = request.getParameter("ref");
            Categorie categ = cs.getById(Integer.parseInt(request.getParameter("categorie")));
            ps.create(new Produit(ref, prix, categ));
        }
        response.sendRedirect("Produit.jsp");

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
