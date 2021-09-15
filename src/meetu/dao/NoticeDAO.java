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
			String sql = "select * from notice order by write_date desc";

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
	
	// option에 따라 검색한 notice dto 반환
	public ArrayList<NoticeDTO> searchNotices(String option, String keyword, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NoticeDTO> notices = new ArrayList<NoticeDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from notice ";
			keyword = "%" + keyword + "%";
				
			if(option.equals("t+c")) {
				sql += "where title like ? or content like ? order by write_date";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setString(2, keyword);
			}
			else {
				if(option.equals("t")) {
					sql += "where title like ? order by write_date";
				}
				else {
					sql += "where content like ? order by write_date";
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
				
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
	
	// 총 공지사항 개수(row) 반환
	public int getAllNoticeRowSize(String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row_size = 0;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from notice";

			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			rs = pstmt.executeQuery();
			
			rs.last();
			row_size = rs.getRow(); 
			
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

		return row_size;
	}
	
	// 검색 결과 공지 개수(row) 반환
	public int getSearchNoticeRowSize(String option, String keyword, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row_size = 0;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from notice ";
			keyword = "%" + keyword + "%";
			
			if(option.equals("t+c")) {
				sql += "where title like ? or content like ?";
				pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, keyword);
				pstmt.setString(2, keyword);
			}
			else {
				if(option.equals("t")) {
					sql += "where title like ?";
				}
				else {
					sql += "where content like ?";
				}
				pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, keyword);
			}
			
			rs = pstmt.executeQuery();
			
			rs.last();
			row_size = rs.getRow(); 
			
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

		return row_size;
	}
	
	// 특정 공지사항 dto db에서 삭제
	public boolean deleteNotice(NoticeDTO notice_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_deleted = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "delete from notice where notice_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_dto.getNoticeId());

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
	
	// 공지사항 dto db에 추가
	public boolean addNotice(NoticeDTO notice_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_added = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "insert into notice (notice_id, title, write_date, content) ";
			sql += "values (notice_seq.NEXTVAL, ?, sysdate, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice_dto.getTitle());
			pstmt.setString(2, notice_dto.getContent());

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
}
