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
			
	// 특정 학생 회원 정보 dto 반환
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
		
	// 특정 교수 회원 정보 dto 반환
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
	
	// 모든 회원 정보 dto 반환
	public ArrayList<MemberDTO> getAllMembers(String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberDTO> members = new ArrayList<MemberDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from member JOIN member_user USING (member_id)";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				MemberDTO mem_dto = new MemberDTO();
				mem_dto.setMemberId(rs.getString("member_id"));
				mem_dto.setName(rs.getString("name"));
				mem_dto.setRole(rs.getString("role"));
				members.add(mem_dto);
					
				while(rs.next()) {
					mem_dto = new MemberDTO();
					mem_dto.setMemberId(rs.getString("member_id"));
					mem_dto.setName(rs.getString("name"));
					mem_dto.setRole(rs.getString("role"));
					members.add(mem_dto);
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

		return members;
	}
		
	// 특정 회원의 학과 정보 dto 반환
	public DepartmentDTO getDepartmentInfo(MemberDTO mem_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DepartmentDTO dept_dto = null;
		String role = mem_dto.getRole();
			
		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "";
			if(role.equals("0")) {
				sql += "select * from student s, member m, department d ";
				sql += "where s.stu_id = m.member_id and s.dept_id = d.dept_id and member_id=?";
			}
			else {
				sql += "select * from professor p, member m, department d ";
				sql += "where p.prof_id = m.member_id and p.dept_id = d.dept_id and member_id=?";
					
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_dto.getMemberId());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dept_dto = new DepartmentDTO();
				dept_dto.setDeptId(rs.getString("dept_id"));
				dept_dto.setDeptName(rs.getString("dept_name"));
				dept_dto.setCollegeId(rs.getString("college_id"));
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
		return dept_dto;
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

	// 교수 이름에 해당하는 professorDTO 반환
	public ArrayList<ProfessorDTO> ProfessorSearch(UniversityDTO univ_dto, String name) throws NamingException {
		ArrayList<ProfessorDTO> profs = new ArrayList<ProfessorDTO>();

		PreparedStatement pstmtMember_id = null;
		ResultSet rsMember_id = null;

		try {
			Connection conn = DBConnection.getConnection(univ_dto.getUnivId());

			name = "'%" + name + "%'";

			pstmtMember_id = conn.prepareStatement("select * from member where name like " + name + " and role=1");
			rsMember_id = pstmtMember_id.executeQuery();

			if (rsMember_id.next()) {
				String member_id = rsMember_id.getString("member_id");
				
				PreparedStatement pstmtResult = conn.prepareStatement("select * from professor where prof_id=" + member_id);
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
