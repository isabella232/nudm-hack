<%--
  Created by IntelliJ IDEA.
  User: dmitryrozental
  Date: 2/13/18
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <%@ page isELIgnored="false" %>
    <title>Hello...</title>
</head>
<body>
    <div>
        Hello  <c:out value = "${sayTo}"/>!
    </div>
</body>
</html>
