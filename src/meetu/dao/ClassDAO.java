package meetu.dao;

import java.util.ArrayList;
import java.sql.*;
import common.dbutil.ConnectionUniversity;
import common.dbutil.Disconnection;

public class ClassDAO {
	Connection con;
	private static ClassDAO classDAO;
	
	private ClassDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static ClassDAO getInstance() {
		if(classDAO == null) {
			classDAO = new ClassDAO();
		}
		
		return classDAO;
	}
}
