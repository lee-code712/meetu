package meetu.dao;

import java.util.ArrayList;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

import java.sql.*;

public class StudentMemberDAO {
	private static StudentMemberDAO studentMemberDAO;
	
	private StudentMemberDAO() {
		
	}
	
	public static StudentMemberDAO getInstance() {
		if(studentMemberDAO == null) {
			studentMemberDAO = new StudentMemberDAO();
		}
		
		return studentMemberDAO;
	}
	
	// 학생회원의 id, pwd 확인
	public static String isUserID(String univ, String id, String pw) {
				
		Connection con = null;
		Statement st = null;       
		ResultSet rs = null;
			
		String sql = "select * from student_member"; 
		         
		boolean id_check = false;
		boolean pw_check = false;
			        
		try {
			DBConnection ct = new DBConnection();    
			con = ct.getConnectionUsers(univ);
			st = con.createStatement();
			rs = st.executeQuery(sql);
			            
			while(rs.next()) {
				String e_id = rs.getString("s_user_id");
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
