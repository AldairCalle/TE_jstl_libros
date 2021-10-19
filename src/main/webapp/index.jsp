<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@page import="com.emergentes.modelo.Libro"%>
<%@page import="com.emergentes.modelo.GestorLibros"%>
<%
    if(session.getAttribute("agenda")==null){
        GestorLibros objeto1=new GestorLibros();
        objeto1.insertarLibro(new Libro("El Alquimista","Paulo Coelho","El libro trata sobre los sueños y los medios que utilizamos para alcanzarlos, sobre el azar en nuestra vida y las señales que se presentan a lo largo de esta","Magnetico"));
        objeto1.insertarLibro(new Libro("El Hombre mediocre","Jose Ingenieros","La obra trata sobre la naturaleza del hombre, oponiendo dos tipos de personalidades: la del hombre mediocre y la del idealista, analizando las características morales de cada uno","Fisico"));
        session.setAttribute("agenda", objeto1);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL - Libros</title>
    </head>
    <body>
        <h1>Lista de Libros</h1>
        <a href="Controller?op=nuevo">Nuevo</a>
        <table border="1">
            <tr>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Resumen</th>
                <th>Medio</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                <tr>
                    <td>${item.titulo}</td>
                    <td>${item.autor}</td>
                    <td>${item.resumen}</td>
                    <td>${item.medio}</td>
                    <td><a href="Controller?op=modificar&titulo=${item.titulo}">Modificar</a></td>
                    <td><a href="Controller?op=eliminar&titulo=${item.titulo}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

