<%-- 
    Document   : Categorie
    Created on : 4 oct. 2023, 11:52:10
    Author     : Lachgar
--%>

<%@page import="ma.projet.services.CategorieService"%>
<%@page import="ma.projet.entities.Categorie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catégories</title>
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
                        <div class="panel-heading">Gestion des catégories</div>
                        <div class="panel-body">
                            <form action="CategorieController">

                                <div class="form-group">
                                    <label class="control-label">Code:</label>
                                    <input type="text" name="code" value="" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Libelle :</label>
                                    <input type="text" name="libelle" value="" class="form-control"/>
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
                        <div class="panel-heading">Liste des catégories</div>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Code</th>
                                        <th>Libelle</th>
                                        <th>Supprimer</th>
                                        <th>Modifier</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        CategorieService cs = new CategorieService();
                                        for (Categorie c : cs.findAll()) {
                                    %>
                                    <tr>
                                        <td><%= c.getCode()%></td>
                                        <td><%= c.getLibelle()%></td>
                                        <td><a href="CategorieController?op=delete&id=<%=c.getId()%>" class="btn btn-danger">Supprimer</a></td>
                                        <td><a href="CategorieController?op=edit&id=<%=c.getId()%>" class="btn btn-primary">Modifier</a></td>
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
