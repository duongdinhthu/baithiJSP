<%@ page import="java.util.List, com.project.demo1.model.Player" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Player Management</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid black; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .btn { padding: 5px 10px; text-decoration: none; border: 1px solid #ccc; margin: 2px; display: inline-block; }
        .btn-edit { background-color: yellow; }
        .btn-delete { background-color: red; color: white; }
    </style>
</head>
<body>
<h2>Player Management</h2>

<%-- Form thêm cầu thủ --%>
<h3>Add Player</h3>
<form action="PlayerServlet" method="POST" onsubmit="return validateForm()">
    <label>Name:</label> <input type="text" name="name" id="name" required>
    <label>Age:</label> <input type="number" name="age" id="age" required min="10" max="40">
    <label>Index:</label>
    <select name="index_id">
        <option value="1">Speed</option>
        <option value="2">Strength</option>
        <option value="3">Accurate</option>
    </select>
    <label>Value:</label> <input type="number" name="value" required min="0" max="100">
    <input type="submit" value="Add">
</form>

<%-- Hiển thị danh sách cầu thủ --%>
<h3>Player List</h3>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Index</th>
        <th>Value</th>
        <th>Actions</th>
    </tr>
    <%
        List<Player> players = (List<Player>) request.getAttribute("players");
        if (players != null) {
            for (Player p : players) {
    %>
    <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getName() %></td>
        <td><%= p.getAge() %></td>
        <td>
            <a href="PlayerServlet?action=edit&id=<%= p.getId() %>" class="btn btn-edit">Edit</a>
            <a href="PlayerServlet?action=delete&id=<%= p.getId() %>" class="btn btn-delete" onclick="return confirm('Are you sure?');">Delete</a>
        </td>
    </tr>
    <% } } else { %>
    <tr><td colspan="6">No players found.</td></tr>
    <% } %>
</table>

<script>
    function validateForm() {
        let name = document.getElementById("name").value;
        let age = document.getElementById("age").value;
        if (name.trim() === "" || age.trim() === "") {
            alert("Please fill in all fields.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
