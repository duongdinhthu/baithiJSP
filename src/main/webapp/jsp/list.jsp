<%@ page import="java.util.List" %>
<%@ page import="com.project.demo1.model.Player" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Player List</title>
</head>
<body>
<h2>Player List</h2>
<table border="1">
    <tr>
        <th>ID</th><th>Name</th><th>Age</th><th>Actions</th>
    </tr>
    <%
        List<Player> players = (List<Player>) request.getAttribute("players");
        for (Player p : players) {
    %>
    <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getName() %></td>
        <td><%= p.getAge() %></td>
        <td>
            <a href="delete?id=<%= p.getId() %>">Delete</a>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>
