package meetu.dao;

import java.sql.*;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

public class UniversityDAO {
	Connection con;
	private static UniversityDAO universityDAO;
	
	private UniversityDAO() {
		
	}
	
	public static UniversityDAO getInstance() {
		if(universityDAO == null) {
			universityDAO = new UniversityDAO();
		}
		
		return universityDAO;
	}
}
