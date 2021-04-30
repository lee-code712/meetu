package meetu.dao;

import java.util.ArrayList;
import java.sql.*;
import common.dbutil.ConnectionUniversity;
import common.dbutil.Disconnection;

public class CourseDAO {
	Connection con;
	private static CourseDAO courseDAO;
	
	private CourseDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static CourseDAO getInstance() {
		if(courseDAO == null) {
			courseDAO = new CourseDAO();
		}
		
		return courseDAO;
	}
}
