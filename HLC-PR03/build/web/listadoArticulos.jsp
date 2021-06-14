<%-- 
    Document   : listadoArticulos
    Created on : 27-may-2021, 20:49:29
    Author     : z3rh10
--%>


<%@page import="Controlador.MetodosPersonajes"%>
<%@page import="Modelo.Usuarios"%>
<%@page import="Modelo.Personajes"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.io.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
    <head>
        <title>Listado Por Artículo</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

        <!-- Custom CSS Todas las páginas-->
        <link rel="stylesheet" type="text/css" href="./css/all.css">
        <!-- Custom CSS Index-->
        <!-- <link rel="stylesheet" type="text/css" href="assets/css/index.css"> -->

        <!-- Scripts Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

        <script type="text/javascript" >
            function preventBack() {
                window.history.forward();
            }
            setTimeout("preventBack()", 0);
            window.onunload = function () {
                null
            };
        </script>
    </head>
    <body class="bg-dark" id="fondo" ncontextmenu="return false" onselectstart="return false" ondragstart="return false">

        <nav class="navbar navbar-expand-lg navbar-dark text-center">
            <div class="container-fluid">

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse pt-4" id="navbarNavDropdown">

                    <ul class="navbar-nav">

                        <li class="nav-item">
                            <a class="nav-link active px-5" href="listadoArticulos.jsp"><h2><u>LISTADO POR ARTICULOS</u></h2></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link px-5" href="listadoTablas.jsp"><h2>LISTADO POR TABLAS</h2></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link px-5" href="index.jsp">
                                <img class="img-fluid logout" alt="logout" src="./img/logout.png">
                            </a>
                        </li>

                    </ul>

                </div>
            </div>
        </nav>

        <%
            Usuarios usuActivo = (Usuarios) request.getSession().getAttribute("sesionUsuario");
            String apodo = "";
            String usu = "";

            if (usuActivo != null) {
                apodo = usuActivo.getApodo();
                usu = usuActivo.getUsu();
            } else {
                response.sendRedirect("validacion.jsp");
            }

            ArrayList<Personajes> persList = new ArrayList();

        %>

        <h3 class="text-center p-3">Sesión iniciada como: <%= usu%> (<%= apodo%>)</h3>
        <h1 class="text-center">LISTADO DE PERSONAJES POR ARTICULOS</h1>


        <section class="row p-5">
            <%

                persList = MetodosPersonajes.verDatosPersonajes();

                for (int i = 0; i < MetodosPersonajes.obtNumeroPersonajesTotal(); i++) {

                    int idp = persList.get(i).getIdp();
                    String nombrep = persList.get(i).getNombrep();
                    int costep = persList.get(i).getCostep();
                    String rol = persList.get(i).getRol();
                    Date lanzamientop = persList.get(i).getLanzamientop();


            %>
            <article>

                <h4 class="text-center p-3">
                    <%= nombrep%> |
                    <%= costep%><img class="img-fluid pb-2" style="width: 25px; height: auto;" src="./img/esencia.png">|
                    <%= rol%>
                </h4>
                <p class="text-center"><img class="img-fluid imgHover" src="./img/personajes/<%= nombrep%>.jpg"></p>
                <h5 class="text-center p-3">Fecha de lanzamiento: <%= lanzamientop%></h5>
                <hr>
            </article>
            <%
                }
            %>

        </section>

    </body>
</html>
