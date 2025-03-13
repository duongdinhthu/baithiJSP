package com.project.demo1.controller;



import com.project.demo1.dao.PlayerDAO;
import com.project.demo1.model.Player;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/players")
public class PlayerServlet extends HttpServlet {
    private PlayerDAO playerDAO = new PlayerDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Player> players = playerDAO.getAllPlayers();
        request.setAttribute("players", players);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        playerDAO.addPlayer(new Player(0, name, age));
        response.sendRedirect("players");
    }
}
