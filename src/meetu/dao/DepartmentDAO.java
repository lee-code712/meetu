package meetu.dao;

import java.util.ArrayList;
import java.sql.*;
import common.dbutil.ConnectionUniversity;
import common.dbutil.Disconnection;

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
