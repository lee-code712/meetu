package meetu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import meetu.common.dbutil.DBConnection;
import meetu.dto.UniversityDTO;

import com.fasterxml.jackson.core.JsonProcessingException;

public class UniversityDAO {
	private static UniversityDAO instance = new UniversityDAO();

	public static UniversityDAO getInstance() {
		return instance;
	}

	// univ id에 해당하는 대학 정보 dto 반환
	public UniversityDTO getUnivInfo(String univ_id) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UniversityDTO univ_dto = null;

		try {
			Connection conn = DBConnection.getConnection("admin");

			pstmt = conn.prepareStatement("select * from university where univ_id=?");
			pstmt.setString(1, univ_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				univ_dto = new UniversityDTO();
				univ_dto.setUnivId(rs.getString("univ_id"));
				univ_dto.setUnivName(rs.getString("univ_name"));
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

		return univ_dto;
	}
	
	// univ name에 해당하는 대학 정보 dto 반환
	public UniversityDTO getUnivInfoByName(String univ_name) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UniversityDTO univ_dto = null;

		try {
			Connection conn = DBConnection.getConnection("admin");

			pstmt = conn.prepareStatement("select * from university where univ_name=?");
			pstmt.setString(1, univ_name);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				univ_dto = new UniversityDTO();
				univ_dto.setUnivId(rs.getString("univ_id"));
				univ_dto.setUnivName(rs.getString("univ_name"));
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

		return univ_dto;
	}

	// 입력된 문자열을 포함하는 대학들 검색. ex) "동" 입력 시 동국대학교, 동덕여자대학교 DTO ArrayList 반환
	public ArrayList<UniversityDTO> univSearch(String input) throws NamingException/* , SQLException */ {
		ArrayList<UniversityDTO> univs = new ArrayList<UniversityDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Connection conn = DBConnection.getConnection("admin");

			input = "'%" + input + "%'";

			pstmt = conn.prepareStatement("select * from university where univ_name like " + input);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String univ_name = rs.getString("univ_name");
				String univ_id = rs.getString("univ_id");

				UniversityDTO univ_dto = new UniversityDTO();
				univ_dto.setUnivName(univ_name);
				univ_dto.setUnivId(univ_id);
				univs.add(univ_dto);

				while (rs.next()) {
					univ_name = rs.getString("univ_name");
					univ_id = rs.getString("univ_id");

					univ_dto = new UniversityDTO();
					univ_dto.setUnivName(univ_name);
					univ_dto.setUnivId(univ_id);
					univs.add(univ_dto);
				}
			} else
				return null;

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

		return univs;
	}
	
	// join - 추천 대학명 검색 - 사용 X
	public String univNameSearch(String q) throws NamingException, JsonProcessingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String univs = null;
		
		if (q != null) { // 입력된 q가 빈 문자열이 아닌 경우
			try {
				Connection conn = DBConnection.getConnection("admin");

				pstmt = conn.prepareStatement("select * from university");
				rs = pstmt.executeQuery();

				while (rs.next()) {
					String univ_name = rs.getString("univ_name");
					if(univ_name.startsWith(q)) { // 대학명이 q로 시작하면 univs 문자열에 추가
						if (univs == null) {
							univs = univ_name;
						}
						else {
							univs += ", " + univ_name;
						}
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
		}

		if (univs == null) {
			return "해당 글자로 시작하는 대학이 존재하지 않습니다.";
		}
		else {
			return univs;
		}
	}
}
