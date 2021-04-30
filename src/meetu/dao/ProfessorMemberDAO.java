package meetu.dao;

import java.util.ArrayList;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

import java.sql.*;

public class ProfessorMemberDAO {
	Connection con;
	private static ProfessorMemberDAO professorMemberDAO;
	
	private ProfessorMemberDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static ProfessorMemberDAO getInstance() {
		if(professorMemberDAO == null) {
			professorMemberDAO = new ProfessorMemberDAO();
		}
		
		return professorMemberDAO;
	}
}
