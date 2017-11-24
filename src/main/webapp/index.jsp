<%-- 
    Document   : index
    Created on : 2017-11-23, 22:58:19
    Author     : PC
--%>
<%@page import = "java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserting Data into Database</title>
    </head>
    <body>
        <h1>Inserting Data Into Database</h1>
        <%!
            public class Actor {

                String URL = "jdbc:derby://localhost:1527/GoogleData";
                String USERNAME = "admin3";
                String PASSWORD = "admin3";

                Connection connection = null;
                PreparedStatement selectActors = null;
                ResultSet resultSet = null;

                public Actor() {
                    try {
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                        selectActors = connection.prepareStatement("SELECT NAME, ADDRESS, DEPARTMENT FROM EMPLOYEE");

                    } catch (SQLException e) {
                        e.printStackTrace();
                    }

                }

                public ResultSet getActors() {
                    try {
                        resultSet = selectActors.executeQuery();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return resultSet;
                }
            }

        %>
        <%
            Actor actor = new Actor();
            ResultSet actors = actor.getActors();

        %>
        <table border="1">
            <thead>
                <tr>
                    <th>NAME</th>
                    <th>ADDRESS</th>
                    <th>DEPARTMENT</th>
                </tr>
                <% while (actors.next()) {%>

            </thead>
            <tbody>
                <tr>
                    <td><%= actors.getString("NAME")%></td>
                    <td><%= actors.getString("ADDRESS") %></td>
                    <td><%= actors.getString("DEPARTMENT") %></td>
                </tr>
                <% } %>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>


    </body>
</html>
