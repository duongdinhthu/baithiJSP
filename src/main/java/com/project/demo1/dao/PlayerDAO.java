package com.project.demo1.dao;



import com.project.demo1.model.Player;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlayerDAO {
    public List<Player> getAllPlayers() {
        List<Player> players = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM player")) {
            while (rs.next()) {
                players.add(new Player(rs.getInt("player_id"), rs.getString("name"), rs.getInt("age")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return players;
    }

    public void addPlayer(Player player) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("INSERT INTO player (name, age) VALUES (?, ?)")) {
            ps.setString(1, player.getName());
            ps.setInt(2, player.getAge());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deletePlayer(int id) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM player WHERE player_id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
