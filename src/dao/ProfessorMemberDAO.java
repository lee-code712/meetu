package meetu.dao;

import java.util.ArrayList;
import java.sql.*;
import common.dbutil.ConnectionUniversity;
import common.dbutil.Disconnection;

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
