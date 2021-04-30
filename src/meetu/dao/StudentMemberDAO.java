package meetu.dao;

import java.util.ArrayList;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

import java.sql.*;

public class StudentMemberDAO {
	Connection con;
	private static StudentMemberDAO studentMemberDAO;
	
	private StudentMemberDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static StudentMemberDAO getInstance() {
		if(studentMemberDAO == null) {
			studentMemberDAO = new StudentMemberDAO();
		}
		
		return studentMemberDAO;
	}
}
