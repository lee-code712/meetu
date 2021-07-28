package meetu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import meetu.common.dbutil.DBConnection;
import meetu.dto.*;


public class ReservationDAO {
	private static ReservationDAO instance = new ReservationDAO();

	public static ReservationDAO getInstance() {
		return instance;
	}
	
	// login한 회원의 모든 예약정보 dto 반환
	public ArrayList<ReservationDTO> getReservationInfo(String univ, String id) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReservationDTO> reservations = new ArrayList<ReservationDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from reservation where ";
			
			MemberDAO mem_dao = MemberDAO.getInstance();
			MemberDTO mem_dto = mem_dao.getMemberInfo(univ, id);
			String role = (String) mem_dto.getRole();
			if(role.equals("0")) {
				sql += "s_user_id=?";
			}
			else {
				sql += "p_user_id=?";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ReservationDTO reservation_dto = new ReservationDTO();
				reservation_dto.setResId(rs.getString("res_id"));
				reservation_dto.setResDate(rs.getString("res_date"));
				reservation_dto.setReason(rs.getString("reason"));
				reservation_dto.setType(rs.getInt("type"));
				reservation_dto.setApproval(rs.getInt("approval"));
				reservation_dto.setRejectMsg(rs.getString("reject_msg"));
				reservation_dto.setPUserId(rs.getString("p_user_id"));
				reservation_dto.setSUserId(rs.getString("s_user_id"));
				reservations.add(reservation_dto);
					
				while(rs.next()) {
					reservation_dto = new ReservationDTO();
					reservation_dto.setResId(rs.getString("res_id"));
					reservation_dto.setResDate(rs.getString("res_date"));
					reservation_dto.setReason(rs.getString("reason"));
					reservation_dto.setType(rs.getInt("type"));
					reservation_dto.setApproval(rs.getInt("approval"));
					reservation_dto.setRejectMsg(rs.getString("reject_msg"));
					reservation_dto.setPUserId(rs.getString("p_user_id"));
					reservation_dto.setSUserId(rs.getString("s_user_id"));
					reservations.add(reservation_dto);
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

		return reservations;
	}
	
	// approval을 승인(1)으로 변경
	public boolean changeToApproval(ReservationDTO reservation_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_changed = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "update reservation set approval=1 where res_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation_dto.getResId());

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

	// approval을 거절(2)로 변경
	public boolean changeToReject(ReservationDTO reservation_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_changed = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "update reservation set approval=2 where res_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation_dto.getResId());

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
		
	// 특정 예약정보 dto db에서 삭제
	public boolean deleteReservation(ReservationDTO reservation_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_deleted = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "delete from reservation where res_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation_dto.getResId());

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

}
