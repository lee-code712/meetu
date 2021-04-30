package meetu.dao;

import java.util.ArrayList;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

import java.sql.*;

public class ProfessorConsultTimeDAO {
	Connection con;
	private static ProfessorConsultTimeDAO professorConsultTimeDAO;
	
	private ProfessorConsultTimeDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static ProfessorConsultTimeDAO getInstance() {
		if(professorConsultTimeDAO == null) {
			professorConsultTimeDAO = new ProfessorConsultTimeDAO();
		}
		
		return professorConsultTimeDAO;
	}
}
