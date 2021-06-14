<%-- 
    Document   : listadoTablas
    Created on : 27-may-2021, 20:49:43
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
        <title>Listado Por Tablas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

        <!-- Custom CSS Todas las páginas-->
        <link rel="stylesheet" type="text/css" href="./css/all.css">




        <!-- Scripts Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>



        <script type="text/javascript">
            function preventBack() {
                window.history.forward();
            }
            setTimeout("preventBack()", 0);
            window.onunload = function () {
                null
            };

        </script>

        <!--<script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>-->

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
                            <a class="nav-link px-5" href="listadoArticulos.jsp"><h2>LISTADO POR ARTICULOS</h2></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link px-5 active" href="listadoTablas.jsp"><h2><u>LISTADO POR TABLAS</u></h2></a>
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
        <h1 class="text-center">LISTADO DE PERSONAJES POR TABLAS</h1>
        <hr>

        <section class="section-content p-3 text-center">
            <table class="table pt-5">
                <thead class="thead-dark">
                    <tr style="color:yellow">

                        <th scope="col" class="tabletitles">NOMBRE</th>
                        <th scope="col" class="tabletitles">COSTE</th>
                        <th scope="col" class="tabletitles">ROL</th>
                        <th scope="col" class="tabletitles">LANZAMIENTO</th>
                        <th scope="col" class="tabletitles">INFO</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>

                        <c:when test='${param.rol == null}'>
                        <form class="text-center p-5">
                            <!-- <input type="hidden" name="porLanzamiento" value="true"/> -->
                            <select name="rol">
                                <option value="TOP">TOP</option>
                                <option value="JUNG" >JUNG</option>
                                <option value="MID" >MID</option>
                                <option value="ADC" >ADC</option>
                                <option value="SUPP" >SUPP</option>
                            </select>
                            <input type="submit" value="Filtrar por ROL"/>
                        </form>

                        <hr>


                        <%
                            persList = MetodosPersonajes.verDatosPersonajes();

                            for (int i = 0; i < MetodosPersonajes.obtNumeroPersonajesTotal(); i++) {

                                int idp = persList.get(i).getIdp();
                                String nombrep = persList.get(i).getNombrep();
                                int costep = persList.get(i).getCostep();
                                String rol = persList.get(i).getRol();
                                Date lanzamientop = persList.get(i).getLanzamientop();


                        %>
                        <tr style="color: white">
                            <td class="tableinfo">
                                <%= nombrep%>
                            </td>
                            <td class="tableinfo">
                                <%= costep%>
                                <img class="img-fluid pb-2" style="width: 20px; height: auto;" src="./img/esencia.png">
                            </td> 
                            <td class="tableinfo">
                                <%= rol%>
                            </td>
                            <td class="tableinfo">
                                <%= lanzamientop%>
                            </td>

                            <td class="tableinfo">
                                <!--<img id="<%= nombrep%>" class="img-fluid" src="./img/personajes/<%= nombrep%>.jpg">-->

                                <a href="./img/personajes/<%= nombrep%>.jpg" target="_blank" class="pr-5">
                                    <button type="button" class="btn btn-primary">

                                        Ver imagen de <%= nombrep%>
                                    </button>
                                </a>
                            </td>
                        </tr>

                        <%
                            }
                        %>


                    </c:when>
                    <c:when test='${param.rol != null}'>
                        <form class="text-center p-5">
                            <!-- <input type="hidden" name="porLanzamiento" value="true"/> -->
                            <select name="rol">
                                <option value="TOP">TOP</option>
                                <option value="JUNG" >JUNG</option>
                                <option value="MID" >MID</option>
                                <option value="ADC" >ADC</option>
                                <option value="SUPP" >SUPP</option>
                            </select>
                            <br>
                            <input type="submit" value="Filtrar por ROL"/>
                        </form>

                        <hr>

                        <%
                            String porRol = request.getParameter("rol");
                          

                            persList = MetodosPersonajes.verDatosPersonajesPorRol(porRol);

                            for (int i = 0; i < MetodosPersonajes.obtNumeroPersonajesPorRolTotal(porRol); i++) {

                                int idp = persList.get(i).getIdp();
                                String nombrep = persList.get(i).getNombrep();
                                int costep = persList.get(i).getCostep();
                                String rol = persList.get(i).getRol();
                                Date lanzamientop = persList.get(i).getLanzamientop();


                        %>
                        <tr style="color: white">
                            <td class="tableinfo">
                                <%= nombrep%>
                            </td>
                            <td class="tableinfo">
                                <%= costep%>
                                <img class="img-fluid pb-2" style="width: 20px; height: auto;" src="./img/esencia.png">
                            </td> 
                            <td class="tableinfo">
                                <%= rol%>
                            </td>
                            <td class="tableinfo">
                                <%= lanzamientop%>
                            </td>

                            <td class="tableinfo">
                                <!--<img id="<%= nombrep%>" class="img-fluid" src="./img/personajes/<%= nombrep%>.jpg">-->

                                <a href="./img/personajes/<%= nombrep%>.jpg" target="_blank" class="pr-5">
                                    <button type="button" class="btn btn-primary">

                                        Ver imagen de <%= nombrep%>
                                    </button>
                                </a>
                            </td>
                        </tr>

                        <%
                            }
                        %>


                    </c:when>
                </c:choose>



                </tbody>
            </table>
        </section>








    </body>
</html>
