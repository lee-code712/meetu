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
	public ArrayList<ReservationDTO> getReservationInfo(String univ, String id)
			throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReservationDTO> reservations = new ArrayList<ReservationDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from reservation where ";

			MemberDAO mem_dao = MemberDAO.getInstance();
			MemberDTO mem_dto = mem_dao.getMemberInfo(univ, id);
			String role = (String) mem_dto.getRole();
			if (role.equals("0")) {
				sql += "s_user_id=?";
			} else {
				sql += "p_user_id=?";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ReservationDTO reservation_dto = new ReservationDTO();
				reservation_dto.setResId(rs.getString("res_id"));
				reservation_dto.setStartTime(rs.getString("start_time"));
				reservation_dto.setEndTime(rs.getString("end_time"));
				reservation_dto.setReason(rs.getString("reason"));
				reservation_dto.setType(rs.getInt("type"));
				reservation_dto.setState(rs.getInt("state"));
				reservation_dto.setRejectMsg(rs.getString("reject_msg"));
				reservation_dto.setPUserId(rs.getString("p_user_id"));
				reservation_dto.setSUserId(rs.getString("s_user_id"));
				reservations.add(reservation_dto);

				while (rs.next()) {
					reservation_dto = new ReservationDTO();
					reservation_dto.setResId(rs.getString("res_id"));
					reservation_dto.setStartTime(rs.getString("start_time"));
					reservation_dto.setEndTime(rs.getString("end_time"));
					reservation_dto.setReason(rs.getString("reason"));
					reservation_dto.setType(rs.getInt("type"));
					reservation_dto.setState(rs.getInt("state"));
					reservation_dto.setRejectMsg(rs.getString("reject_msg"));
					reservation_dto.setPUserId(rs.getString("p_user_id"));
					reservation_dto.setSUserId(rs.getString("s_user_id"));
					reservations.add(reservation_dto);
				}
			} else {
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

	// 특정 예약정보 dto 반환
	public ReservationDTO getReservation(ReservationDTO reservation_dto, String univ)
			throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from reservation where res_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation_dto.getResId());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				reservation_dto.setResId(rs.getString("res_id"));
				reservation_dto.setStartTime(rs.getString("start_time"));
				reservation_dto.setEndTime(rs.getString("end_time"));
				reservation_dto.setReason(rs.getString("reason"));
				reservation_dto.setType(rs.getInt("type"));
				reservation_dto.setState(rs.getInt("state"));
				reservation_dto.setRejectMsg(rs.getString("reject_msg"));
				reservation_dto.setPUserId(rs.getString("p_user_id"));
				reservation_dto.setSUserId(rs.getString("s_user_id"));
			} else {
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

		return reservation_dto;
	}

	// state를 dto에 들어있는 상태에 따라 변경
	public boolean changeState(ReservationDTO reservation_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_changed = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "update reservation set state=? where res_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reservation_dto.getState());
			pstmt.setString(2, reservation_dto.getResId());

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
	public boolean deleteReservation(ReservationDTO reservation_dto, String univ)
			throws NamingException/* , SQLException */ {
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

	// 예약 dto에 거절 메시지 추가
	public boolean addRejectMessage(ReservationDTO reservation_dto, String univ)
			throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_added = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "update reservation set reject_msg=? where res_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation_dto.getRejectMsg());
			pstmt.setString(2, reservation_dto.getResId());

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
	
	// 같은 시간대에 예약 레코드가 존재하는지 확인
	public boolean checkSameResDate(ReservationDTO reservation_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;
		
		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from reservation where s_user_id=? and (state=0 or state=1) and ";
			sql += "((start_time >= TO_DATE(?,'YY/MM/DD HH24:MI:SS') and start_time < TO_DATE(?,'YY/MM/DD HH24:MI:SS')) "; 
			sql += "or (end_time > TO_DATE(?,'YY/MM/DD HH24:MI:SS') and end_time <= TO_DATE(?,'YY/MM/DD HH24:MI:SS')))";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation_dto.getSUserId());
			pstmt.setString(2, reservation_dto.getStartTime());
			pstmt.setString(3, reservation_dto.getEndTime());
			pstmt.setString(4, reservation_dto.getStartTime());
			pstmt.setString(5, reservation_dto.getEndTime());

			rs = pstmt.executeQuery();

			if(rs.next()) {
				check = true;
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

		return check;
	}

	// 예약 레코드 추가
	public boolean makeReservation(ReservationDTO reservation_dto, String univ)
			throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_added = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "insert into reservation (res_id, start_time, end_time, reason, type, state, p_user_id, s_user_id) ";
			sql += "values (reservation_seq.NEXTVAL, TO_DATE(?,'YY/MM/DD HH24:MI:SS'), TO_DATE(?,'YY/MM/DD HH24:MI:SS'), ?, ?, 0, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation_dto.getStartTime());
			pstmt.setString(2, reservation_dto.getEndTime());
			pstmt.setString(3, reservation_dto.getReason());
			pstmt.setInt(4, reservation_dto.getType());
			pstmt.setString(5, reservation_dto.getPUserId());
			pstmt.setString(6, reservation_dto.getSUserId());

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

	// 예약 레코드 수정
	public boolean updateReservation(ReservationDTO reservation_dto, String univ) throws NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_changed = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "update reservation set start_time=TO_DATE(?,'YY/MM/DD HH24:MI:SS'), end_time=TO_DATE(?,'YY/MM/DD HH24:MI:SS'), reason=?, type=? where res_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation_dto.getStartTime());
			pstmt.setString(2, reservation_dto.getEndTime());
			pstmt.setString(3, reservation_dto.getReason());
			pstmt.setInt(4, reservation_dto.getType());
			pstmt.setString(5, reservation_dto.getResId());

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

	// 교수 상담 가능 시간 반환
	public ArrayList<ConsultableTimeDTO> getConsultableTimes(String univ, String p_user_id) throws NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ConsultableTimeDTO> consultableTimes = new ArrayList<ConsultableTimeDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from consultable_time where p_user_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_user_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ConsultableTimeDTO consultable_time_dto = new ConsultableTimeDTO();
				consultable_time_dto.setAbleDate(rs.getString("able_date"));
				consultable_time_dto.setAbleTime(rs.getString("able_time"));
				consultable_time_dto.setPUserId(p_user_id);
				consultableTimes.add(consultable_time_dto);

				while (rs.next()) {
					consultable_time_dto = new ConsultableTimeDTO();
					consultable_time_dto.setAbleDate(rs.getString("able_date"));
					consultable_time_dto.setAbleTime(rs.getString("able_time"));
					consultable_time_dto.setPUserId(p_user_id);
					consultableTimes.add(consultable_time_dto);
				}
			} else {
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

		return consultableTimes;
	}

	// 교수 상담 가능 시간 추가
	public boolean addConsultableTime(ConsultableTimeDTO consultable_time_dto, String univ) throws NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_added = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "insert into consultable_time (able_date, able_time, p_user_id) values (?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, consultable_time_dto.getAbleDate());
			pstmt.setString(2, consultable_time_dto.getAbleTime());
			pstmt.setString(3, consultable_time_dto.getPUserId());

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

	// 교수 상담 가능 시간 삭제
	public boolean deleteConsultableTime(ConsultableTimeDTO consultable_time_dto, String univ) throws NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_deleted = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "delete from consultable_time where able_date=? and able_time=? and p_user_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, consultable_time_dto.getAbleDate());
			pstmt.setString(2, consultable_time_dto.getAbleTime());
			pstmt.setString(3, consultable_time_dto.getPUserId());

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

	// 같은 교수 예약 신청 대기/승인 레코드 존재 여부 반환
	public boolean isReservatedProfessor(String univ, String s_user_id, String p_user_id) throws NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from reservation where s_user_id=? and p_user_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_user_id);
			pstmt.setString(2, p_user_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (rs.getString("state").equals("0") || rs.getString("state").equals("1")) {
					return true;
				}
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

		return false;
	}

	// res_id에 해당하는 상담기록이 존재하는지 확인하여 상담내용 dto 반환
	public ConsultContentDTO getConsultContent(ReservationDTO reservation_dto, String univ)
			throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConsultContentDTO consult_content_dto = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from consult_content where res_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation_dto.getResId());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				consult_content_dto = new ConsultContentDTO();
				consult_content_dto.setResId(rs.getString("res_id"));
				consult_content_dto.setContent(rs.getString("content"));
			} else {
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

		return consult_content_dto;
	}

	// 상담내용 dto db에 추가
	public boolean addConsultContent(ConsultContentDTO consult_content_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_added = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "insert into consult_content (res_id, content) ";
			sql += "values (?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, consult_content_dto.getResId());
			pstmt.setString(2, consult_content_dto.getContent());

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

	// 상담내용 dto content 수정
	public boolean updateConsultContent(ConsultContentDTO consult_content_dto, String univ)
			throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		boolean is_changed = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql1 = "update consult_content set content=? where res_id=?";
			String sql2 = "update consult_record set content=? where res_id=?";

			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, consult_content_dto.getContent());
			pstmt.setString(2, consult_content_dto.getResId());
			
			rs1 = pstmt.executeQuery();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, consult_content_dto.getContent());
			pstmt.setString(2, consult_content_dto.getResId());
			
			rs2 = pstmt.executeQuery();

			is_changed = true;

			// if close
			if (rs1 != null && rs2 != null)
				rs1.close();
				rs2.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return is_changed;
	}
	
	// 회원의 모든 상담기록 dto 반환
	public ArrayList<ConsultRecordDTO> getConsultRecords(MemberDTO mem_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ConsultRecordDTO> records = new ArrayList<ConsultRecordDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from consult_record where ";

			String role = (String) mem_dto.getRole();
			if (role.equals("0")) {
				sql += "stu_id=?";
			} else {
				sql += "prof_id=?";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_dto.getMemberId());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ConsultRecordDTO consult_record_dto = new ConsultRecordDTO();
				consult_record_dto.setConsultId(rs.getString("consult_id"));
				consult_record_dto.setStartTime(rs.getString("start_time"));
				consult_record_dto.setEndTime(rs.getString("end_time"));
				consult_record_dto.setReason(rs.getString("reason"));
				consult_record_dto.setType(rs.getString("type"));
				consult_record_dto.setProfId(rs.getString("prof_id"));
				consult_record_dto.setStuId(rs.getString("stu_id"));
				consult_record_dto.setContent(rs.getString("content"));
				consult_record_dto.setResId(rs.getString("res_id"));
				records.add(consult_record_dto);

				while (rs.next()) {
					consult_record_dto = new ConsultRecordDTO();
					consult_record_dto.setConsultId(rs.getString("consult_id"));
					consult_record_dto.setStartTime(rs.getString("start_time"));
					consult_record_dto.setEndTime(rs.getString("end_time"));
					consult_record_dto.setReason(rs.getString("reason"));
					consult_record_dto.setType(rs.getString("type"));
					consult_record_dto.setProfId(rs.getString("prof_id"));
					consult_record_dto.setStuId(rs.getString("stu_id"));
					consult_record_dto.setContent(rs.getString("content"));
					consult_record_dto.setResId(rs.getString("res_id"));
					records.add(consult_record_dto);
				}
			} else {
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

		return records;
	}
	
	// 상담기록 dto 추가
	public boolean recordConsultInfo(ConsultRecordDTO consult_record_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_added = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "insert into consult_record (consult_id, start_time, end_time, reason, type, stu_id, prof_id, res_id) ";
			sql += "values (?, TO_DATE(?,'YY/MM/DD HH24:MI:SS'), TO_DATE(?,'YY/MM/DD HH24:MI:SS'), ?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, consult_record_dto.getConsultId());
			pstmt.setString(2, consult_record_dto.getStartTime());
			pstmt.setString(3, consult_record_dto.getEndTime());
			pstmt.setString(4, consult_record_dto.getReason());
			pstmt.setString(5, consult_record_dto.getType());
			pstmt.setString(6, consult_record_dto.getStuId());
			pstmt.setString(7, consult_record_dto.getProfId());
			pstmt.setString(8, consult_record_dto.getResId());
			
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
	
	public ArrayList<String> getConsultReason(MemberDTO mem_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> reasons = new ArrayList<>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select DISTINCT reason from consult_record where ";

			String role = (String) mem_dto.getRole();
			if (role.equals("0")) {
				sql += "stu_id=?";
			} else {
				sql += "prof_id=?";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_dto.getMemberId());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				reasons.add(rs.getString("reason"));
				while (rs.next()) {
					reasons.add(rs.getString("reason"));
				}
			} else {
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

		return reasons;
	}
	
	// 회원탈퇴 시 res_id를 null로 변경
	public boolean updateResId(MemberDTO mem_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_changed = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "update consult_record set res_id=? where ";	
			if(mem_dto.getRole().equals("0")) {
				sql += "stu_id=?";
			}
			else {
				sql += "prof_id=?";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, null);	
			pstmt.setString(2, mem_dto.getMemberId());

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

	// 
	public OfficeInfoDTO getMapInfo(String univ, String office) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		OfficeInfoDTO officeInfo_dto = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from office_info where office=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, office);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				officeInfo_dto = new OfficeInfoDTO();
				officeInfo_dto.setOffice(rs.getString("office"));
				officeInfo_dto.setLatitude(rs.getDouble("latitude"));
				officeInfo_dto.setLongitude(rs.getDouble("longitude"));
			} else {
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

		return officeInfo_dto;
	}
}
