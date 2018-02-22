<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: dmitryrozental
  Date: 2/13/18
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <%@ page isELIgnored="false" %>
    <title>Hello...</title>
</head>
<body>
    <div>
        Hello World, one more time! But let's get the data from the DB too!
        <%
            String selectTableSQL = "SELECT name, email from agencies";
            try {
                // The newInstance() call is a work around for some
                // broken Java implementations
                Class.forName("com.mysql.jdbc.Driver").newInstance();

                // Create connection to your db
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/nudm?user=app&password=app");
                // Create a statement
                Statement statement = conn.createStatement();

                // Execute your query and store it in the result set
                ResultSet rs = statement.executeQuery(selectTableSQL);

                // Iterate your results
                while (rs.next()) {
                // get selected fields
                String name = rs.getString("name");
                String email = rs.getString("email");

                // print them out
                %>
                Name : <%=name%> <br>
                Email : <%=email%><br>
                <br>
                <%
                }
            } catch (SQLException ex) {
                // handle the error
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        %>
    </div>
</body>
</html>
