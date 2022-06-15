package Conexao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexao  {

    public static getConnection getConnection;
    public static Connection getConnection(){
        Connection conn2 = null;
        try {
            String dbURL2 = "jdbc:postgresql://localhost/Projetofacu";
            String user = "postgres";
            String pass = "123456";
            conn2 = DriverManager.getConnection(dbURL2, user, pass);
            return conn2;
        } catch (SQLException ex) {
            throw new RuntimeException("Erro. "+ex);
        }
    }

    public static class getConnection {

        public getConnection() {
        }

        public boolean next() {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        public String getString(String nome) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        public void close() {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }
    }
    
}


