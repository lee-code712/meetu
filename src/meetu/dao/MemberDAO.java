package meetu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import meetu.common.dbutil.DBConnection;
import meetu.dto.*;

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

	// login정보 확인-성공 시 회원정보 반환 
	public MemberDTO loginOk(MemberUserDTO mem_usr_dto, String univ, String role) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO mem_dto = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from member_user JOIN member USING (member_id) where user_id=? and password=? and role=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_usr_dto.getUser_id());
			pstmt.setString(2, mem_usr_dto.getPassword());
			pstmt.setString(3, role);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				mem_dto = new MemberDTO();
				mem_dto.setMemberId(rs.getString("member_id"));
				mem_dto.setName(rs.getString("name"));
				mem_dto.setRole(rs.getString("role"));
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

		return mem_dto;
	}
			
	// 학생 회원 정보 dto 반환
	public StudentDTO getStudentInfo(String univ, String id) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudentDTO stu_dto = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from student s, member_user m where s.stu_id = m.member_id and user_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				stu_dto = new StudentDTO();
				stu_dto.setStuId(rs.getString("stu_id"));
				stu_dto.setYear(Integer.parseInt(rs.getString("year")));
				stu_dto.setEmail(rs.getString("email"));
				stu_dto.setDeptId(rs.getString("dept_id"));
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

		return stu_dto;
	}
		
	// 교수 회원 정보 dto 반환
	public ProfessorDTO getProfessorInfo(String univ, String id) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProfessorDTO prof_dto = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from professor p, member_user m where p.prof_id = m.member_id and user_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				prof_dto = new ProfessorDTO();
				prof_dto.setProfId(rs.getString("prof_id"));
				prof_dto.setMajor(rs.getString("major"));
				prof_dto.setEmail(rs.getString("email"));
				prof_dto.setOffice(rs.getString("office"));
				prof_dto.setDeptId(rs.getString("dept_id"));
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

		return prof_dto;
	}

	// join - 학번 체크, 유효한 학번인 경우 id 생성해 리턴
	public String userIdCreate(MemberUserDTO mem_usr_dto, UniversityDTO univ_dto) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		boolean id_check = false; // 유효한 학번인지 검사
		String member_id = null;

		try {
			Connection conn = DBConnection.getConnection(univ_dto.getUnivId());
			String query = "select * from member";

			member_id = mem_usr_dto.getMember_id(); // 학번

			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String tmp = rs.getString("member_id");
				if (member_id.equals(tmp)) {
					id_check = true;
				}
			}

			if (id_check == false) { // 존재하지 않는 학번인 경우 -2 리턴
				return "-2";
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

		if (id_check) { // 유효한 학번인 경우 아이디 생성해 리턴
			String user_id = univ_dto.getUnivId() + member_id;
			return user_id;
		}
		else { // 이미 가입된 학번인 경우 -3 리턴
			return "-3";
		}
	}
	
	// join - 회원가입 정보 db에 추가
	public String addUser(MemberUserDTO mem_usr_dto, UniversityDTO univ_dto) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String is_added = "-4"; // db에 추가 실패시 -4 리턴

		try {
			Connection conn = DBConnection.getConnection(univ_dto.getUnivId());
			String query = "insert into member_user (user_id, password, member_id) values ";

			query += "('" + mem_usr_dto.getUser_id() + "', '" + mem_usr_dto.getPassword() + "', '" + mem_usr_dto.getMember_id() + "')";

			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			is_added = "1";
			
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
		
		return is_added;
	}
	
	// memberID에 해당하는 이름 반환
	public String getName(String member_id) throws NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String name = null;

		try {
			Connection conn = DBConnection.getConnection("dwu");
			String sql = "select name from member where member_id = " + member_id;

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				name = rs.getString("name");
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

		return name;
	}
	
	// professorDTO 반환
	public ArrayList<ProfessorDTO> ProfessorSearch(String name) throws NamingException {
		ArrayList<ProfessorDTO> profs = new ArrayList<ProfessorDTO>();

		PreparedStatement pstmtMember_id = null;
		ResultSet rsMember_id = null;

		try {
			Connection conn = DBConnection.getConnection("dwu");

			name = "'%" + name + "%'";

			pstmtMember_id = conn.prepareStatement("select member_id from member where name like " + name + "and role like 2");
			rsMember_id = pstmtMember_id.executeQuery();

			if (rsMember_id.next()) {
				String member_id = rsMember_id.getString("member_id");
				
				PreparedStatement pstmtResult = conn.prepareStatement("select * from professor where prof_id like " + member_id);
				ResultSet rsResult = pstmtResult.executeQuery();
								
				while (rsResult.next()) {
					String major = rsResult.getString("major");
					String email = rsResult.getString("email");
					String office = rsResult.getString("office");
					String dept_id = rsResult.getString("dept_id");
						
					ProfessorDTO prof_dto = new ProfessorDTO();
					prof_dto.setProfId(member_id);
					if (major != null)
						prof_dto.setMajor(major);
					if (email != null)
						prof_dto.setEmail(email);
					if (office != null)
						prof_dto.setOffice(office);
					if (dept_id != null)
						prof_dto.setDeptId(dept_id);
					
					profs.add(prof_dto);
				}
				
				if (rsResult != null)
					rsResult.close();
				if (pstmtResult != null)
					pstmtResult.close();
			}
			else
				return null;

			// if close
			if (rsMember_id != null)
				rsMember_id.close();
			if (pstmtMember_id != null)
				pstmtMember_id.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return profs;
	}
}
