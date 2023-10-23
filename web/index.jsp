<%-- 
    Document   : index
    Created on : 10 oct. 2023, 03:30:12
    Author     : Zineb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>

        <br/><br/><br/>


        <div class="container">

            <div class="card">
                <div class="circle">
                    <h2><img src="images/categories.png" width="100px" height="100px"></h2>
                </div>
                <div class="content">
                    <a href="Categorie.jsp" style="margin-left: 20px;">Catégorie</a>
                </div>
            </div>
            <div class="card">
                <div class="circle">
                    <h2><img src="images/verifier.png" width="100px" height="100px"></h2>
                </div>
                <div class="content">
                    <a href="Commande.jsp" style="margin-left: 20px;">Commande</a>
                </div>

            </div>
            <div class="card">
                <div class="circle">
                    <h2><img src="images/produit.png" width="100px" height="100px"></h2>
                </div>
                <div class="content">
                    <a href="Produit.jsp"style="margin-left: 30px;">Produit</a>
                </div>
            </div>
            <div class="card">
                <div class="circle">
                    <h2><img src="images/commande-en-ligne.png" width="100px" height="100px"></h2>
                </div>
                <div class="content">
                    <a href="LigneCommande.jsp" style="margin-left: 40px;">Ligne</a>
                </div>
            </div>
        </div> 

    </body>
</html>
