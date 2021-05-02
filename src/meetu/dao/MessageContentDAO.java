package meetu.dao;

import java.util.ArrayList;
import java.sql.*;
import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

public class MessageContentDAO {
	Connection con;
	private static MessageContentDAO MessageContentDAO;
	
	private MessageContentDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static MessageContentDAO getInstance() {
		if(MessageContentDAO == null) {
			MessageContentDAO = new MessageContentDAO();
		}
		
		return MessageContentDAO;
	}
}
