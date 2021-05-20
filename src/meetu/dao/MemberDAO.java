package meetu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import meetu.common.dbutil.DBConnection;
import meetu.dto.MemberUserDTO;
import meetu.dto.UniversityDTO;

public class MemberDAO {
	// DAO : Data Access Object
	// DB접근해서 처리하는 작업을 모두 처리하는 객체
	/*
	 * DB 처리해야 할 일이 있으면 DAO 인스턴스를 받아서 각각 insert, delete 등 모든 작업을 모듈화 해 놓으면 다른 객체에서
	 * 호출해서 사용
	 */

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	// login정보 확인
	public boolean loginOk(MemberUserDTO dto, String univ, String role) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean ck = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from member_user JOIN member USING (member_id) where user_id=? and password=? and role=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, role);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ck = true;
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

		return ck;
	}

	// 대학정보 확인
	public boolean univCheck(String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean ck = false;

		try {
			Connection conn = DBConnection.getConnection("admin");

			pstmt = conn.prepareStatement("select * from university where univ_id=?");
			pstmt.setString(1, univ);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ck = true;
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

		return ck;
	}

	// join - 대학정보 확인
	public UniversityDTO univSearch(UniversityDTO dto) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Connection conn = DBConnection.getConnection("admin");

			pstmt = conn.prepareStatement("select * from university where univ_name=?");
			pstmt.setString(1, dto.getUnivName());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setUnivId(rs.getString("univ_id"));
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

		return dto;
	}

	// join - 학번 체크
	public MemberUserDTO memberIdCheck(MemberUserDTO memUsrDTO, UniversityDTO univDTO) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		boolean id_check = false; // 유효한 학번인지 검사
		String member_id = null;

		try {
			Connection conn = DBConnection.getConnection(univDTO.getUnivId());
			String query = "select * from member";

			member_id = memUsrDTO.getMember_id(); // 학번

			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String tmp = rs.getString("member_id");
				if (member_id.equals(tmp)) {
					id_check = true;
				}
			}

			if (id_check == false) { // 존재하지 않는 학번인 경우 null return
				return null;
			} else { // 존재하는 학번인 경우 이미 가입한 학번인지 확인
				query = "select * from member_user";

				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					String tmp = rs.getString("member_id");
					if (member_id.equals(tmp)) {
						id_check = false; // db에 존재, 즉 이미 가입된 학번이면 false
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
		} catch (NamingException e) {
			e.printStackTrace();
		}

		if (id_check) { // 유효한 학번인 경우 memUsrDTO에 아이디 정보 추가
			String user_id = univDTO.getUnivId() + member_id;
			memUsrDTO.setUser_id(user_id);
		}

		return memUsrDTO;
	}
}
