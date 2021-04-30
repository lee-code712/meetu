package meetu.dao;

import java.util.ArrayList;

import meetu.common.dbutil.DBConnection;
import meetu.common.dbutil.Disconnection;

import java.sql.*;

public class ReservationDAO {
	Connection con;
	private static ReservationDAO ReservationDAO;
	
	private ReservationDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static ReservationDAO getInstance() {
		if(ReservationDAO == null) {
			ReservationDAO = new ReservationDAO();
		}
		
		return ReservationDAO;
	}
}
