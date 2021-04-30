package meetu.dao;

import java.util.ArrayList;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

import java.sql.*;

public class NoticeDAO {
	Connection con;
	private static NoticeDAO NoticeDAO;
	
	private NoticeDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static NoticeDAO getInstance() {
		if(NoticeDAO == null) {
			NoticeDAO = new NoticeDAO();
		}
		
		return NoticeDAO;
	}
}
