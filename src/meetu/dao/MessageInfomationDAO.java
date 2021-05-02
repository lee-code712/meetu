package meetu.dao;

import java.util.ArrayList;
import java.sql.*;
import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

public class MessageInfomationDAO {
	Connection con;
	private static MessageInfomationDAO MessageInfomationDAO;
	
	private MessageInfomationDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static MessageInfomationDAO getInstance() {
		if(MessageInfomationDAO == null) {
			MessageInfomationDAO = new MessageInfomationDAO();
		}
		
		return MessageInfomationDAO;
	}
}
