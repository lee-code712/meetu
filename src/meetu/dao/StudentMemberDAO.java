package meetu.dao;

import java.util.ArrayList;
import java.sql.*;
import common.dbutil.ConnectionUniversity;
import common.dbutil.Disconnection;

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
