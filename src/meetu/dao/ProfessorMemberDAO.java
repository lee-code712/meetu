package meetu.dao;

import java.util.ArrayList;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

import java.sql.*;

public class ProfessorMemberDAO {
	private static ProfessorMemberDAO professorMemberDAO;
	
	private ProfessorMemberDAO() {
		
	}
	
	public static ProfessorMemberDAO getInstance() {
		if(professorMemberDAO == null) {
			professorMemberDAO = new ProfessorMemberDAO();
		}
		
		return professorMemberDAO;
	}
	
	// 교수회원의 id, pwd 확인
	public static String isUserID(String univ, String id, String pw) {
					
		Connection con = null;
		Statement st = null;       
		ResultSet rs = null;
				
		String sql = "select * from professor_member"; 
			         
		boolean id_check = false;
		boolean pw_check = false;
				        
		try {
			DBConnection ct = new DBConnection();    
			con = ct.getConnectionUsers(univ);
			st = con.createStatement();
			rs = st.executeQuery(sql);
				            
			while(rs.next()) {
				String e_id = rs.getString("p_user_id");
				String e_pwd = rs.getString("password");
				if(id.equals(e_id)) {
					id_check = true;
					if(pw.equals(e_pwd))
						pw_check = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Disconnection.close(con, st, rs);
		}
		        
		if(!id_check || !pw_check)
			return "-1"; 
		else 
			return univ;
	}
}
