package meetu.dao;

import java.util.ArrayList;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

import java.sql.*;

public class ProfessorDAO {
	Connection con;
	private static ProfessorDAO professorDAO;
	
	private ProfessorDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static ProfessorDAO getInstance() {
		if(professorDAO == null) {
			professorDAO = new ProfessorDAO();
		}
		
		return professorDAO;
	}
}
