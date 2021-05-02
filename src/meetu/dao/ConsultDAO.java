package meetu.dao;

import java.util.ArrayList;
import java.sql.*;
import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

public class ConsultDAO {
	Connection con;
	private static ConsultDAO ConsultDAO;
	
	private ConsultDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static ConsultDAO getInstance() {
		if(ConsultDAO == null) {
			ConsultDAO = new ConsultDAO();
		}
		
		return ConsultDAO;
	}
}
