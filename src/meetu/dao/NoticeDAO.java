package meetu.dao;

import java.util.ArrayList;
import java.sql.*;
import common.dbutil.DBConnection;
import common.dbutil.Disconnection;

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
