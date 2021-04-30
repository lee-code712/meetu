package meetu.dao;

import java.util.ArrayList;
import java.sql.*;
import common.dbutil.ConnectionUniversity;
import common.dbutil.Disconnection;

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
