package meetu.dao;

import java.util.ArrayList;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

import java.sql.*;

public class StudentDAO {
	Connection con;
	private static StudentDAO studentDAO;
	
	private StudentDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static StudentDAO getInstance() {
		if(studentDAO == null) {
			studentDAO = new StudentDAO();
		}
		
		return studentDAO;
	}
}
