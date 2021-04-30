package meetu.dao;

import java.util.ArrayList;
import java.sql.*;
import common.dbutil.ConnectionUniversity;
import common.dbutil.Disconnection;

public class CollegeDAO {
	Connection con;
	private static CollegeDAO collegeDAO;
	
	private CollegeDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static CollegeDAO getInstance() {
		if(collegeDAO == null) {
			collegeDAO = new CollegeDAO();
		}
		
		return collegeDAO;
	}
}
