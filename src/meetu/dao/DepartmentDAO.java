package meetu.dao;

import java.util.ArrayList;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

import java.sql.*;

public class DepartmentDAO {
	Connection con;
	private static DepartmentDAO departmentDAO;
	
	private DepartmentDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static DepartmentDAO getInstance() {
		if(departmentDAO == null) {
			departmentDAO = new DepartmentDAO();
		}
		
		return departmentDAO;
	}
}
