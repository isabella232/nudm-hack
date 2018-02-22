package com.nudm.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/simple")
public class SimpleServlet extends HttpServlet {
    public SimpleServlet() {
        super();
    }

    Connection conn = null;
    Statement statement = null;

    @Override
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        try {
            printAgencyData(out);
        } catch (SQLException e) {
            out.println(e.getMessage());
        }
        out.println("SimpleServlet Executed");
        out.flush();
        out.close();
    }

    private void printAgencyData(PrintWriter out) throws SQLException {
        String selectTableSQL = "SELECT name, email from agencies";
        try {
            // The newInstance() call is a work around for some
            // broken Java implementations
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            // Create connection to your db
            conn = DriverManager.getConnection("jdbc:mysql://localhost/nudm?user=app&password=app");
            // Create a statement
            statement = conn.createStatement();

            // Execute your query and store it in the result set
            ResultSet rs = statement.executeQuery(selectTableSQL);

            // Iterate your results
            while (rs.next()) {
                // get selected fields
                String name = rs.getString("name");
                String email = rs.getString("email");

                // print them out
                out.println("Name : " + name);
                out.println("Email : " + email);
            }

        } catch (SQLException ex) {
            // handle the error
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Close things
            if (statement != null) {
                statement.close();
            }

            if (conn != null) {
                conn.close();
            }
        }
    }
}