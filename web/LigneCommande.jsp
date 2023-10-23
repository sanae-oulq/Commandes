<%-- 
    Document   : LigneCommande
    Created on : 10 oct. 2023, 00:00:12
    Author     : Zineb
--%>

<%@page import="ma.projet.services.LigneCommandeProduitService"%>
<%@page import="ma.projet.services.CommandeService"%>
<%@page import="ma.projet.services.CategorieService"%>
<%@page import="ma.projet.services.ProduitService"%>
<%@page import="ma.projet.entities.Produit"%>
<%@page import="ma.projet.entities.Commande"%>
<%@page import="ma.projet.entities.LigneCommandeProduit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ligne Commande Produit</title>
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
                        <div class="panel-heading">Gestion des commandes</div>
                        <div class="panel-body">
                            <form action="LigneCommandeController">

                                <div class="form-group">
                                    <label class="control-label">Commande :</label>
                                    <select name="commande" class="form-control">
                                        <% CommandeService cs = new CommandeService();
                                            for (Commande c : cs.findAll()) {
                                        %>
                                        <option value="<%= c.getId()%>"><%= c.getId()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Produit :</label>
                                    <select name="produit" class="form-control">
                                        <% ProduitService ps = new ProduitService();
                                            for (Produit p : ps.findAll()) {
                                        %>
                                        <option value="<%= p.getId()%>"><%= p.getReference()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Quantité :</label>
                                    <input type="text" name="quantite" value="" class="form-control" />
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
                        <div class="panel-heading">Liste des Lignes Commande Produit</div>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Commande</th>
                                        <th>Produit</th>
                                        <th>Quantité</th>
                                        <th>Supprimer</th>
                                        <th>Modifier</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        LigneCommandeProduitService lcps = new LigneCommandeProduitService();
                                        for (LigneCommandeProduit lcp : lcps.findAll()) {
                                    %>
                                    <tr>
                                        <td><%= lcp.getCommande().getId()%></td>
                                        <td><%= lcp.getProduit().getReference()%></td>
                                        <td><%= lcp.getQuantite()%></td>
                                        <td><a href="LigneCommandeController?op=delete&id1=<%=lcp.getProduit().getId()%>&id2=<%=lcp.getCommande().getId()%>" class="btn btn-danger" >Supprimer</a></td>
                                        <td><a href="LigneCommandeController?op=edit&id1=<%=lcp.getProduit().getId()%>&id2=<%=lcp.getCommande().getId()%>" class="btn btn-primary">Modifier</a></td>
                                    </tr>
                                    <%
                                        }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
