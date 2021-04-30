package meetu.common.dbutil;

import java.sql.*;

public class Disconnection {
	
	public static void close(Connection conn, Statement st, ResultSet rs) {
		 try {
            if(rs != null) rs.close();
            if(st != null) st.close();
            if(conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	 }
}
