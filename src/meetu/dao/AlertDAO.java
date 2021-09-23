package meetu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import meetu.common.dbutil.DBConnection;
import meetu.dto.*;

public class AlertDAO {
	private static AlertDAO instance = new AlertDAO();

	public static AlertDAO getInstance() {
		return instance;
	}
	
	// 새로운 알림 개수 반환
	public int getNewAlert(String id, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int new_count = 0;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select count(*) from alert where user_id=? and is_read=0";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				new_count = rs.getInt(1);
			}

			// if close
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return new_count;
	}
	
	// 새로운 알림 dto 반환
	public ArrayList<AlertDTO> getNewAlerts(String id, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AlertDTO> alerts = new ArrayList<AlertDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from alert where user_id=? and is_read=0 order by alert_date desc";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				AlertDTO alert_dto = new AlertDTO();
				alert_dto.setAlertId(rs.getString("alert_id"));
				alert_dto.setAlertDate(rs.getString("alert_date"));
				alert_dto.setAlertType(rs.getInt("alert_type"));
				alert_dto.setAlertMsg(rs.getString("alert_msg"));
				alert_dto.setIsRead(rs.getInt("is_read"));
				alert_dto.setUserId(rs.getString("user_id"));
				alerts.add(alert_dto);
					
				while(rs.next()) {
					alert_dto = new AlertDTO();
					alert_dto.setAlertId(rs.getString("alert_id"));
					alert_dto.setAlertDate(rs.getString("alert_date"));
					alert_dto.setAlertType(rs.getInt("alert_type"));
					alert_dto.setAlertMsg(rs.getString("alert_msg"));
					alert_dto.setIsRead(rs.getInt("is_read"));
					alert_dto.setUserId(rs.getString("user_id"));
					alerts.add(alert_dto);
				}
			}
			else {
				return null;
			}
			// if close
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return alerts;
	}
	
	// 새로운 알림 db에 추가
	public boolean addAlert(AlertDTO alert_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_added = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "insert into alert (alert_id, alert_date, alert_type, alert_msg, user_id) ";
			sql += "values (alert_seq.NEXTVAL, sysdate, ?, ?, ?)";
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, alert_dto.getAlertType());
			pstmt.setString(2, alert_dto.getAlertMsg());
			pstmt.setString(3, alert_dto.getUserId());

			rs = pstmt.executeQuery();
			
			is_added = true;
				
			// if close
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return is_added;
	}
	
	// is_read를 0에서 1로 변경
	public boolean changeRead(String id, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_changed = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "update alert set is_read=1 where user_id=? and is_read=0";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
						
			is_changed = true;
						
			// if close
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return is_changed;
	}
	
	// 확인한 알림 db에서 삭제
	public boolean deleteAlert(String id, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_deleted = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "delete from alert where user_id=? and is_read=1";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
								
			is_deleted = true;
								
			// if close
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return is_deleted;
	}
	
	// 알림내역에 대한 알림유형 dto 반환
	public AlertTypeDTO getAlertTypeInfo(AlertDTO alert_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AlertTypeDTO alert_type_dto = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from alert_type where type=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, alert_dto.getAlertType());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				alert_type_dto = new AlertTypeDTO();
				alert_type_dto.setType(rs.getInt("type"));
				alert_type_dto.setTitle(rs.getString("title"));
			}
			// if close
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return alert_type_dto;
	}
	
	// 알림내역에 해당하는 alertType의 alert내역이 존재하는지 확인해서 날짜 반환 - 로그인 시 상담예정일 알림이 추가되므로 확인을 안했을 때 중복으로 추가되는 것을 막기 위함
	public String isExist(int type, String id, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String exist_date = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from alert where alert_type=? and user_id=? and is_read=0";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			pstmt.setString(2, id);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				exist_date = rs.getString("alert_date");
			}
								
			// if close
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return exist_date;
	}
}
