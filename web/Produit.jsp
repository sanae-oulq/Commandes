<%--
    Document   : Produit
    Created on : 9 oct. 2023, 23:59:47
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
        <title>Produits</title>
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
                        <div class="panel-heading">Gestion des Produits</div>
                        <div class="panel-body">
                            <form action="ProduitController">

                                <div class="form-group">
                                    <label class="control-label">Prix :</label>
                                    <input type="text" name="prix" value=""  class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Réference :</label>
                                    <input type="text" name="ref" value="" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Catégorie :</label>
                                    <select name="categorie" class="form-control">
                                        <% CategorieService cs = new CategorieService();
                                            for (Categorie c : cs.findAll()) {
                                        %>
                                        <option value="<%= c.getId()%>"><%= c.getLibelle()%></option>
                                        <%
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
            <div class="container">
                <div class="col-md-6 col-xm-12 col-sm-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Liste des Produits</div>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Prix</th>
                                        <th>Référence</th>
                                        <th>Catégorie</th>
                                        <th>Supprimer</th>
                                        <th>Modifier</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ProduitService ps = new ProduitService();
                                        for (Produit p : ps.findAll()) {
                                    %>
                                    <tr>
                                        <td><%= p.getPrix()%></td>
                                        <td><%= p.getReference()%></td>
                                        <td><%= p.getCategorie().getId()%></td>
                                        <td><a href="ProduitController?op=delete&id=<%=p.getId()%>" class="btn btn-danger">Supprimer</a></td>
                                        <td><a href="ProduitController?op=edit&id=<%=p.getId()%>" class="btn btn-primary">Modifier</a></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

