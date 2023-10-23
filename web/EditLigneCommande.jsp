<%-- 
    Document   : EditLigneLigneCommandeProduit
    Created on : 10 oct. 2023, 00:00:26
    Author     : Zineb
--%>

<%@page import="ma.projet.services.ProduitService"%>
<%@page import="ma.projet.services.CommandeService"%>
<%@page import="ma.projet.services.LigneCommandeProduitService"%>
<%@page import="ma.projet.entities.LigneCommandeProduit"%>
<%@page import="ma.projet.entities.Commande"%>
<%@page import="ma.projet.entities.Produit"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Ligne Commande Produit</title>
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
                        <div class="panel-heading">Modifier Ligne Commande Produit</div>
                        <div class="panel-body">
                            <form action="LigneCommandeController">
                                <input type="hidden" name="op" value="update" />
                                <input type="hidden" name="id1" value="<%= request.getParameter("id1")%>" />
                                <input type="hidden" name="id2" value="<%= request.getParameter("id2")%>" />
                                <% LigneCommandeProduitService lcps = new LigneCommandeProduitService();
                                    LigneCommandeProduit lcp = lcps.getById(Integer.parseInt(request.getParameter("id1")), Integer.parseInt(request.getParameter("id2")));%>
                                <div class="form-group">
                                    <label class="control-label">Commande :</label>
                                    <select name="commande" class="form-control">
                                        <% CommandeService cs = new CommandeService();
                                            for (Commande c : cs.findAll()) {
                                                if (lcp.getCommande().getId() == c.getId()) {
                                        %>
                                        <option value="<%= c.getId()%>" selected><%= c.getId()%></option>
                                        <%} else {%>
                                        <option value="<%= c.getId()%>"><%= c.getId()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Produit :</label>
                                    <select name="produit" class="form-control">
                                        <% ProduitService ps = new ProduitService();
                                            for (Produit p : ps.findAll()) {
                                                if (lcp.getProduit().getId() == p.getId()) {
                                        %>
                                        <option value="<%= p.getId()%>" selected><%= p.getReference()%></option>
                                        <%} else {%>
                                        <option value="<%= p.getId()%>"><%= p.getReference()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Quantité :</label>
                                    <input type="text" name="quantite" value="<%=lcp.getQuantite()%>" class="form-control" />
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
