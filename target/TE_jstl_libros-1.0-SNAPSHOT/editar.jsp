<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL - Libros</title>
    </head>
    <body>
        <h1>
            <c:if test="${requestScope.op=='nuevo'}" var="res" scope="request">
                Registro de
            </c:if>
            <c:if test="${requestScope.op=='modificar'}" var="res" scope="request">
                Modificar
            </c:if>
            libros
        </h1>
        <jsp:useBean id="miLibro" scope="request" class="com.emergentes.modelo.Libro"/>
        <form action="Controller" method="post">
            <table>
                <tr>
                    <td>Titulo</td>
                    <td>
                        <input type="text" name="titulo" value="<jsp:getProperty name="miLibro" property="titulo"/>" required>
                    </td>
                </tr>
                <tr>
                    <td>Autor</td>
                    <td>
                        <input type="text" name="autor" value="<jsp:getProperty name="miLibro" property="autor"/>">
                    </td>
                </tr>
                <tr>
                    <td>Resumen</td>
                    <td>
                        <textarea name="resumen"><jsp:getProperty name="miLibro" property="resumen"/></textarea>
                    </td>
                </tr>  
                <tr>
                    <td>Medio</td>
                    <td>
                        <input type="radio" name="medio" value="Fisico" required
                               <c:if test="${miLibro.medio=='Fisico'}" var="res" scope="request">
                                    checked
                                </c:if>
                        >Fisico<br>
                        <input type="radio" name="medio" value="Magnetico" required
                               <c:if test="${miLibro.medio=='Magnetico'}" var="res" scope="request">
                                    checked
                                </c:if>
                        >Magnetico<br>  
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="opg" value="${requestScope.op}"/>
                        <input type="hidden" name="op" value="grabar"/>         
                    </td>
                    <td><input type="submit" value="Enviar"/></td>
                </tr>
                <tr>
            </table>          
        </form>
    </body>
</html>
