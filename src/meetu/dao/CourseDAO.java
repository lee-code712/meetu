package meetu.dao;

import java.util.ArrayList;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

import java.sql.*;

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
