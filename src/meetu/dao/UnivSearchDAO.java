package meetu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import meetu.common.dbutil.DBConnection;
import meetu.dto.UniversityDTO;

public class UnivSearchDAO {
	private static UnivSearchDAO instance = new UnivSearchDAO();

	public static UnivSearchDAO getInstance() {
		return instance;
	}

	public ArrayList<UniversityDTO> univSearch(UniversityDTO dto) throws NamingException/* , SQLException */ {
		ArrayList<UniversityDTO> univs = new ArrayList<UniversityDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Connection conn = DBConnection.getConnection("admin");
			
			String input = dto.getUnivName();
			input = "'%" + input + "%'";
			
			pstmt = conn.prepareStatement("select * from university where univ_name like " + input);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String univ_name = rs.getString("univ_name");
		    	String univ_id = rs.getString("univ_id");
		    	
		    	UniversityDTO u = new UniversityDTO();
		    	u.setUnivName(univ_name);
		    	u.setUnivId(univ_id);
		    	univs.add(u);
		    	
		    	while(rs.next()) {
		    		univ_name = rs.getString("univ_name");
			    	univ_id = rs.getString("univ_id");
			    	
			    	u = new UniversityDTO();
			    	u.setUnivName(univ_name);
			    	u.setUnivId(univ_id);
			    	univs.add(u);
			    }
			}
			else
				return null;
			
			// if close
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return univs;
	}
}
