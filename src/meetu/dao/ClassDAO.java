package meetu.dao;

import java.util.ArrayList;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

import java.sql.*;

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
