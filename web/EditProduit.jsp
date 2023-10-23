<%-- 
    Document   : EditProduit
    Created on : 10 oct. 2023, 00:00:01
    Author     : Zineb
--%>

<%@page import="ma.projet.services.CategorieService"%>
<%@page import="ma.projet.services.ProduitService"%>
<%@page import="ma.projet.entities.Produit"%>
<%@page import="ma.projet.entities.Categorie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div>
            <div class="container">
                <div class="col-md-6 col-xm-12 col-sm-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Modifier Produit</div>
                        <div class="panel-body">
                            <form action="ProduitController">
                                <input type="hidden" name="op" value="update" />
                                <input type="hidden" name="id" value="<%= request.getParameter("id")%>" />
                                <% ProduitService ps = new ProduitService();
                                    Produit p = ps.getById(Integer.parseInt(request.getParameter("id")));%>
                                <div class="form-group">
                                    <label class="control-label">Prix :</label>
                                    <input type="text" name="prix" value="<%= p.getPrix()%>" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Référence :</label>
                                    <input type="text" name="ref" value="<%= p.getReference()%>" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Catégorie :</label>
                                    <select name="categorie" class="form-control">
                                        <% CategorieService cs = new CategorieService();
                                            for (Categorie c : cs.findAll()) {
                                                if (p.getCategorie().getId() == c.getId()) {
                                        %>
                                        <option value="<%= c.getId()%>" selected><%= c.getLibelle()%></option>
                                        <% } else {%>
                                        <option value="<%= c.getId()%>"><%= c.getLibelle()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="Valider" name="valider" class="btn btn-success"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

