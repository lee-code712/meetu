package meetu.dao;

import java.util.ArrayList;
import java.sql.*;
import common.dbutil.ConnectionUniversity;
import common.dbutil.Disconnection;

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
