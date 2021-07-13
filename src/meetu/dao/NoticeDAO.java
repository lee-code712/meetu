package meetu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import meetu.common.dbutil.DBConnection;
import meetu.dto.*;

public class NoticeDAO {
	private static NoticeDAO instance = new NoticeDAO();

	public static NoticeDAO getInstance() {
		return instance;
	}
	
	// 모든 공지사항 dto 반환
	public ArrayList<NoticeDTO> getNotices(String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NoticeDTO> notices = new ArrayList<NoticeDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from notice";

			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				NoticeDTO notice_dto = new NoticeDTO();
				notice_dto.setNoticeId(rs.getInt("notice_id"));
				notice_dto.setTitle(rs.getString("title"));
				notice_dto.setWriteDate(rs.getString("write_date"));
				notice_dto.setViews(rs.getInt("views"));
				notice_dto.setContent(rs.getString("content"));
				notices.add(notice_dto);
					
				while(rs.next()) {
					notice_dto = new NoticeDTO();
					notice_dto.setNoticeId(rs.getInt("notice_id"));
					notice_dto.setTitle(rs.getString("title"));
					notice_dto.setWriteDate(rs.getString("write_date"));
					notice_dto.setViews(rs.getInt("views"));
					notice_dto.setContent(rs.getString("content"));
					notices.add(notice_dto);
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

		return notices;
	}
	
	// 특정 공지사항 dto 반환
	public NoticeDTO getNotice(int notice_id, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeDTO notice_dto = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from notice where notice_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_id);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				notice_dto = new NoticeDTO();
				notice_dto.setNoticeId(rs.getInt("notice_id"));
				notice_dto.setTitle(rs.getString("title"));
				notice_dto.setWriteDate(rs.getString("write_date"));
				notice_dto.setViews(rs.getInt("views"));
				notice_dto.setContent(rs.getString("content"));
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

		return notice_dto;
	}
	
	// view 증가
	public boolean changeView(int notice_id, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_changed = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "update notice set views=views+1 where notice_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_id);

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
}
