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
	public MemberDTO loginOk(MemberUserDTO mem_usr_dto, String univ, String role)
			throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO mem_dto = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from member_user JOIN member USING (member_id) where user_id=? and password=? and role=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_usr_dto.getUserId());
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

	// 비밀번호 찾기 - 아이디가 존재하는지 확인 후, 비밀번호와 이메일 반환
	public ArrayList<String> findPassword(String univ, String id, String role)
			throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> find_info = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from member_user mu, ";
			if (role.equals("1")) {
				sql += "professor p where mu.member_id=p.prof_id and user_id=?";
			} else {
				sql += "student s where mu.member_id=s.stu_id and user_id=?";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				find_info = new ArrayList<String>();
				find_info.add(rs.getString("email"));
				find_info.add(rs.getString("password"));
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

		return find_info;
	}
	
	// 특정 학생 학사 정보 dto 반환
		public StudentDTO getStudent(String univ, String id) throws NamingException/* , SQLException */ {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StudentDTO stu_dto = null;

			try {
				Connection conn = DBConnection.getConnection(univ);
				String sql = "select * from student where stu_id=?";

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

		// 특정 교수 학사 정보 dto 반환
		public ProfessorDTO getProfessor(String univ, String id) throws NamingException/* , SQLException */ {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ProfessorDTO prof_dto = null;

			try {
				Connection conn = DBConnection.getConnection(univ);
				String sql = "select * from professor where stu_id=?";

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
	public ArrayList<MemberUserDTO> getAllMemberUsers(String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberUserDTO> members = new ArrayList<MemberUserDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from member JOIN member_user USING (member_id)";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				MemberUserDTO mem_usr_dto = new MemberUserDTO();
				mem_usr_dto.setUserId(rs.getString("user_id"));
				mem_usr_dto.setPhone(rs.getString("phone"));
				mem_usr_dto.setMemberId(rs.getString("member_id"));
				members.add(mem_usr_dto);

				while (rs.next()) {
					mem_usr_dto = new MemberUserDTO();
					mem_usr_dto.setUserId(rs.getString("user_id"));
					mem_usr_dto.setPhone(rs.getString("phone"));
					mem_usr_dto.setMemberId(rs.getString("member_id"));
					members.add(mem_usr_dto);
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

		return members;
	}

	// 모든 대학 구성원 정보 dto 반환
	public ArrayList<MemberDTO> getAllMembers(String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberDTO> members = new ArrayList<MemberDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from member";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				MemberDTO mem_dto = new MemberDTO();
				mem_dto.setMemberId(rs.getString("member_id"));
				mem_dto.setName(rs.getString("name"));
				mem_dto.setRole(rs.getString("role"));
				members.add(mem_dto);

				while (rs.next()) {
					mem_dto = new MemberDTO();
					mem_dto.setMemberId(rs.getString("member_id"));
					mem_dto.setName(rs.getString("name"));
					mem_dto.setRole(rs.getString("role"));
					members.add(mem_dto);
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

		return members;
	}

	// 모든 교수 정보 반환
	public ArrayList<ProfessorDTO> getAllProfessors(String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ProfessorDTO> professors = new ArrayList<ProfessorDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from professor";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ProfessorDTO prof_dto = new ProfessorDTO();
				prof_dto.setProfId(rs.getString("prof_id"));
				prof_dto.setMajor(rs.getString("major"));
				prof_dto.setEmail(rs.getString("email"));
				prof_dto.setOffice(rs.getString("office"));
				prof_dto.setDeptId(rs.getString("dept_id"));
				professors.add(prof_dto);

				while (rs.next()) {
					prof_dto = new ProfessorDTO();
					prof_dto.setProfId(rs.getString("prof_id"));
					prof_dto.setMajor(rs.getString("major"));
					prof_dto.setEmail(rs.getString("email"));
					prof_dto.setOffice(rs.getString("office"));
					prof_dto.setDeptId(rs.getString("dept_id"));
					professors.add(prof_dto);
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

		return professors;
	}

	// 특정 회원 정보 dto user_id로 검색해 반환
	public MemberDTO getMemberInfo(String univ, String id) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO mem_dto = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from member JOIN member_user USING (member_id) where user_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				mem_dto = new MemberDTO();
				mem_dto.setMemberId(rs.getString("member_id"));
				mem_dto.setName(rs.getString("name"));
				mem_dto.setRole(rs.getString("role"));
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

		return mem_dto;
	}
	
	// 특정 회원 정보 dto member_id로 검색해 반환
	public MemberDTO getMemberInfoByMemberID(String univ, String id) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO mem_dto = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from member where member_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				mem_dto = new MemberDTO();
				mem_dto.setMemberId(rs.getString("member_id"));
				mem_dto.setName(rs.getString("name"));
				mem_dto.setRole(rs.getString("role"));
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

		return mem_dto;
	}

	// 특정 회원 계정 정보 dto 반환 (password는 반환하지 않음)
	public MemberUserDTO getMemberUserInfo(MemberDTO mem_dto, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberUserDTO mem_usr_dto = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from member JOIN member_user USING (member_id) where name=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_dto.getName());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				mem_usr_dto = new MemberUserDTO();
				mem_usr_dto.setUserId(rs.getString("user_id"));
				mem_usr_dto.setPhone(rs.getString("phone"));
				mem_usr_dto.setPhone(rs.getString("member_id"));
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

		return mem_usr_dto;
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
			if (role.equals("0")) {
				sql += "select * from student s, member m, department d ";
				sql += "where s.stu_id = m.member_id and s.dept_id = d.dept_id and member_id=?";
			} else {
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

			member_id = mem_usr_dto.getMemberId(); // 학번

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
		} else { // 이미 가입된 학번인 경우 -3 리턴
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

			query += "('" + mem_usr_dto.getUserId() + "', '" + mem_usr_dto.getPassword() + "', '"
					+ mem_usr_dto.getMemberId() + "')";

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

	// 학과 id에 해당하는 학과 dto 반환
	public DepartmentDTO getDepartmentDTO(UniversityDTO univ_dto, String dept_id) throws NamingException {
		DepartmentDTO dept_dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Connection conn = DBConnection.getConnection(univ_dto.getUnivId());
			String sql = "select * from department where dept_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dept_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dept_dto = new DepartmentDTO();
				dept_dto.setDeptId(dept_id);
				dept_dto.setDeptName(rs.getString("dept_name"));
				dept_dto.setCollegeId(rs.getString("college_id"));
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

		return dept_dto;
	}
	
	// 교수 정보를 검색해 해당하는 professorDTO 반환
	public ArrayList<ProfessorDTO> professorSearchByProfInfo(UniversityDTO univ_dto, String keyword) throws NamingException {
		ArrayList<ProfessorDTO> profs = new ArrayList<ProfessorDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Connection conn = DBConnection.getConnection(univ_dto.getUnivId());
			String sql = "select * from member m JOIN professor p ON (m.member_id = p.prof_id) where ";
			sql += "m.name like ? or replace(p.major, ' ', '') like ? or ";
			sql += "p.dept_id IN (select dept_id from department where dept_name like ?)";

			keyword = "%" + keyword + "%";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				ProfessorDTO prof_dto = new ProfessorDTO();
				prof_dto.setProfId(rs.getString("prof_id"));
				prof_dto.setMajor(rs.getString("major"));
				prof_dto.setEmail(rs.getString("email"));
				prof_dto.setOffice(rs.getString("office"));
				prof_dto.setDeptId(rs.getString("dept_id"));
				profs.add(prof_dto);

				while (rs.next()) {
					prof_dto = new ProfessorDTO();
					prof_dto.setProfId(rs.getString("prof_id"));
					prof_dto.setMajor(rs.getString("major"));
					prof_dto.setEmail(rs.getString("email"));
					prof_dto.setOffice(rs.getString("office"));
					prof_dto.setDeptId(rs.getString("dept_id"));
					profs.add(prof_dto);
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

		return profs;
	}
	
	// 교수 상담기록을 검색해 해당하는 professorDTO 반환
	public ArrayList<ProfessorDTO> professorSearchByConsultRecord(UniversityDTO univ_dto, String keyword) throws NamingException {
		ArrayList<ProfessorDTO> profs = new ArrayList<ProfessorDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Connection conn = DBConnection.getConnection(univ_dto.getUnivId());
			String sql = "select DISTINCT p.prof_id, p.major, p.email, p.office, p.dept_id, count(p.prof_id) OVER(PARTITION BY p.prof_id) as cnt ";
			sql += "from consult_record cr join professor p on (cr.prof_id = p.prof_id) ";
			sql += "where replace(cr.reason, ' ', '') like ? ";
			sql += "order by cnt DESC";

			keyword = "%" + keyword + "%";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				ProfessorDTO prof_dto = new ProfessorDTO();
				prof_dto.setProfId(rs.getString("prof_id"));
				prof_dto.setMajor(rs.getString("major"));
				prof_dto.setEmail(rs.getString("email"));
				prof_dto.setOffice(rs.getString("office"));
				prof_dto.setDeptId(rs.getString("dept_id"));
				profs.add(prof_dto);

				while (rs.next()) {
					prof_dto = new ProfessorDTO();
					prof_dto.setProfId(rs.getString("prof_id"));
					prof_dto.setMajor(rs.getString("major"));
					prof_dto.setEmail(rs.getString("email"));
					prof_dto.setOffice(rs.getString("office"));
					prof_dto.setDeptId(rs.getString("dept_id"));
					profs.add(prof_dto);
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

		return profs;
	}
	
	// 특정 학과에 해당하는 professorDTO 반환
	public ArrayList<ProfessorDTO> professorSearchByDept(UniversityDTO univ_dto, String dept_name)
			throws NamingException {
		ArrayList<ProfessorDTO> profs = new ArrayList<ProfessorDTO>();

		PreparedStatement pstmtDept_id = null;
		ResultSet rsDept_id = null;

		try {
			Connection conn = DBConnection.getConnection(univ_dto.getUnivId());

			pstmtDept_id = conn.prepareStatement("select * from department where dept_name=?");
			pstmtDept_id.setString(1, dept_name);
			rsDept_id = pstmtDept_id.executeQuery();

			if (rsDept_id.next()) {
				String dept_id = rsDept_id.getString("dept_id");

				PreparedStatement pstmtResult = conn
						.prepareStatement("select * from professor where dept_id=" + dept_id);
				ResultSet rsResult = pstmtResult.executeQuery();

				while (rsResult.next()) {
					String prof_id = rsResult.getString("prof_id");
					String major = rsResult.getString("major");
					String email = rsResult.getString("email");
					String office = rsResult.getString("office");

					ProfessorDTO prof_dto = new ProfessorDTO();
					prof_dto.setProfId(prof_id);
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
			if (rsDept_id != null)
				rsDept_id.close();
			if (pstmtDept_id != null)
				pstmtDept_id.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return profs;
	}
	
	// 특정 교수가 가르치는 course dto 반환
	public ArrayList<CourseDTO> getCourseInfo(ProfessorDTO prof_dto, String univ)
			throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<CourseDTO> courses = new ArrayList<CourseDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from class where prof_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prof_dto.getProfId());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				String course_id = rs.getString("course_id");

				sql = "select * from course where course_id=?";

				PreparedStatement pstmt_new = conn.prepareStatement(sql);
				pstmt_new.setString(1, course_id);

				ResultSet rs_new = pstmt_new.executeQuery();

				if (rs_new.next()) {
					String title = rs_new.getString("title");

					CourseDTO course_dto = new CourseDTO();
					course_dto.setCourseId(course_id);
					course_dto.setTitle(title);

					courses.add(course_dto);
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

		return courses;
	}

	// 학과별 course dto 반환
	public ArrayList<CourseDTO> getCourseByDept(DepartmentDTO dept_dto, String univ) throws NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CourseDTO> courses = new ArrayList<CourseDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from course where dept_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dept_dto.getDeptId());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				CourseDTO course_dto = new CourseDTO();
				course_dto.setCourseId(rs.getString("course_id"));
				course_dto.setTitle(rs.getString("title"));
				course_dto.setDeptId(rs.getString("dept_id"));
				courses.add(course_dto);

				while (rs.next()) {
					course_dto = new CourseDTO();
					course_dto.setCourseId(rs.getString("course_id"));
					course_dto.setTitle(rs.getString("title"));
					course_dto.setDeptId(rs.getString("dept_id"));
					courses.add(course_dto);
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

		return courses;
	}

	public ArrayList<CollegeDTO> getCollege(UniversityDTO univ) throws NamingException {
		ArrayList<CollegeDTO> colleges = new ArrayList<CollegeDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Connection conn = DBConnection.getConnection(univ.getUnivId());
			String sql = "select * from college";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String college_id = rs.getString("college_id");
				String college_name = rs.getString("college_name");

				CollegeDTO college_dto = new CollegeDTO();
				college_dto.setCollegeId(college_id);
				college_dto.setCollegeName(college_name);

				colleges.add(college_dto);
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

		return colleges;
	}

	public ArrayList<DepartmentDTO> getDeptByCollege(UniversityDTO univ, String college_id) throws NamingException {
		ArrayList<DepartmentDTO> depts = new ArrayList<DepartmentDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Connection conn = DBConnection.getConnection(univ.getUnivId());
			String sql = "select * from department where college_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, college_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String dept_id = rs.getString("dept_id");
				String dept_name = rs.getString("dept_name");

				DepartmentDTO dept_dto = new DepartmentDTO();
				dept_dto.setDeptId(dept_id);
				dept_dto.setDeptName(dept_name);

				depts.add(dept_dto);
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

		return depts;
	}

	// 교수 정보 dto 내용 변경
	public boolean changeProfInfo(ProfessorDTO prof_dto, String column, String univ) throws NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_changed = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "update professor set " + column + "=? where prof_id=?";

			pstmt = conn.prepareStatement(sql);
			if (column.equals("major")) {
				pstmt.setString(1, prof_dto.getMajor());
			} else if (column.equals("email")) {
				pstmt.setString(1, prof_dto.getEmail());
			} else if (column.equals("office")) {
				pstmt.setString(1, prof_dto.getOffice());
			}
			pstmt.setString(2, prof_dto.getProfId());

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

	// 개설과목 추가
	public boolean addClass(CourseDTO course_dto, String member_id, String univ) throws NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_added = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "insert into class (prof_id, course_id) values (?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setString(2, course_dto.getCourseId());

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

	// 개설과목 삭제
	public boolean deleteClass(CourseDTO course_dto, String member_id, String univ) throws NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_deleted = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "delete from class where prof_id=? and course_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setString(2, course_dto.getCourseId());

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
	
	// 비밀번호 확인
	public boolean checkPwd(MemberUserDTO mem_usr_dto, String univ) throws NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from member_user where user_id=? and password=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_usr_dto.getUserId());
			pstmt.setString(2, mem_usr_dto.getPassword());

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
	
	// 비밀번호 변경
	public boolean changePwd(MemberUserDTO mem_usr_dto, String univ) throws NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_changed = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "update member_user set password=? where user_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_usr_dto.getPassword());
			pstmt.setString(2, mem_usr_dto.getUserId());

			rs = pstmt.executeQuery();
			
			int change_row_cnt = pstmt.executeUpdate();
			System.out.print(change_row_cnt);
			if(change_row_cnt > 0) {
				is_changed = true;
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

		return is_changed;
	}
	
	// 회원정보 dto 삭제(회원탈퇴)
	public boolean deleteMemberUser(MemberUserDTO mem_usr_dto, String univ) throws NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean is_deleted = false;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "delete from member_user where user_id=? and password=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_usr_dto.getUserId());
			pstmt.setString(2, mem_usr_dto.getPassword());

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
