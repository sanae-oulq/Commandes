<%@page import="ma.projet.services.CategorieService"%>
<%@page import="ma.projet.entities.Categorie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category</title>
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
                        <div class="panel-heading">Modifier Catégorie</div>
                        <div class="panel-body">
                            <form action="CategorieController">
                                <input type="hidden" name="op" value="update" />
                                <input type="hidden" name="id" value="<%= request.getParameter("id")%>" />
                                <% CategorieService cs = new CategorieService();
                                    Categorie c = cs.getById(Integer.parseInt(request.getParameter("id")));%>
                                <div class="form-group">
                                    <label class="control-label">Code:</label>
                                    <input type="text" name="code" value="<%= c.getCode()%>" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Libelle :</label>
                                    <input type="text" name="libelle" value="<%= c.getLibelle()%>" class="form-control" />
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
