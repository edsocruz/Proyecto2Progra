
<%@page import="clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <% Usuario us = (Usuario) request.getSession().getAttribute("Usuario"); %>
 
<nav class="navbar justify-content-between">
    <div  class="dropdown show">
        <div id="dropHeder">
            <button class="btn btn-secondary dropdown-toggle" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Usuario
            </button>
            <label id="usuario"> 
            </label>
            <div class="dropdown-menu" id="showDrop">
                <a href="Vistas/Perfil.jsp"><button class="dropdown-item">Perfil</button></a>
                <form action="Vistas/VistaPrincipal.jsp" >
                    <button type="submit" class="dropdown-item">Salir</button>
                </form>
            </div>
        </div>
        <div id="hederButton">
            
            <% if(us != null){%>
            <% if(us.getTipo().equals("Cliente") ) {%>
            <form action="Vistas/Menu.jsp">
                <button  type="submit" class="btn btn-secondary" >
                    Menu
                </button>
            </form>
            <%}%>
            <% if(us.getTipo().equals("Administrador") ){%>
               <form action="Vistas/Menu.jsp">
                <button  type="submit" class="btn btn-secondary" >
                    Menu
                </button>
            </form>
                   <%}}%>
                   
        </div>
       
        <div id="carritoIconDiv">
            
        </div>




    </div>
</nav>
<script>
      var carritoCompras = [];
    </script>