<%-- 
    Document   : Commande
    Created on : 9 oct. 2023, 22:27:39
    Author     : Zineb
--%>

<%@page import="ma.projet.services.CommandeService"%>
<%@page import="ma.projet.entities.Commande"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commande</title>
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
                            <form action="CommandeController">

                                <div class="form-group">
                                    <label class="control-label">Date :</label>
                                    <input type="text" name="date" value="" class="form-control"  placeholder="yyyy-mm-dd"/>
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
                        <div class="panel-heading">Liste des commandes</div>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Supprimer</th>
                                        <th>Modifier</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        CommandeService cs = new CommandeService();
                                        for (Commande c : cs.findAll()) {
                                    %>
                                    <tr>
                                        <td><%= c.getDate()%></td>
                                        <td><a href="CommandeController?op=delete&id=<%=c.getId()%>" class="btn btn-danger">Supprimer</a></td>
                                        <td><a href="CommandeController?op=edit&id=<%=c.getId()%>" class="btn btn-primary">Modifier</a></td>
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

