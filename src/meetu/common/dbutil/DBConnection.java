package meetu.common.dbutil;

import java.sql.*;

public class DBConnection {
	
	public Connection getConnectionUniv() {
        Connection conn = null;
         
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url ="jdbc:oracle:thin:@localhost:1521:xe";
            String user = "univ_m";
            String password = "univ_m";
            conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            System.out.println("driver load ?떎?뙣!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB ?뿰寃? ?떎?뙣!");
            e.printStackTrace();
        }
         
        return conn;
    }
	
	public Connection getConnectionUsers(String users_id) {
        Connection conn = null;
         
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url ="jdbc:oracle:thin:@localhost:1521:xe";
            String user = users_id;
            String password = users_id + "_pass";
            conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            System.out.println("driver load 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB 연결 실패");
            e.printStackTrace();
        }
         
        return conn;
    }
	
	public Connection getConnectionAdmin() {
        Connection conn = null;
         
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url ="jdbc:oracle:thin:@localhost:1521:xe";
            String user = "admin";
            String password = "admin_pass";
            conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            System.out.println("driver load 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB 연결 실패");
            e.printStackTrace();
        }
         
        return conn;
    }
}
