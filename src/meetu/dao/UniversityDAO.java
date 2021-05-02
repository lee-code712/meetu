package meetu.dao;

import java.sql.*;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

public class UniversityDAO {
	private static UniversityDAO universityDAO;
	
	private UniversityDAO() {
		
	}
	
	public static UniversityDAO getInstance() {
		if(universityDAO == null) {
			universityDAO = new UniversityDAO();
		}
		
		return universityDAO;
	}
	
	// 대학 id가 맞는지 확인
	public static boolean isUnivID(String u) {
		Connection con = null;
        Statement st = null;       
        ResultSet rs = null;
        String sql = "select * from university"; 
        
        boolean univ_check = false;
        
        try {
            DBConnection ct = new DBConnection();
            con = ct.getConnectionUniv();           
            st = con.createStatement();
            rs = st.executeQuery(sql);
            
            while(rs.next()) {
            	String e_univ = rs.getString("univ_id");
            	if(u.equals(e_univ)) {
            		univ_check = true;
            	}
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	 Disconnection.close(con, st, rs);
        }
        
        return univ_check;
	}
}