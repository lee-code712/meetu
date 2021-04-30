package meetu.dao;

import java.sql.*;
import common.dbutil.ConnectionUniversityManage;
import common.dbutil.Disconnection;

public class UniversityDAO {
	Connection con;
	private static UniversityDAO universityDAO;
	
	private UniversityDAO() {
		
	}
	
	/*
	 * 책은 action > service > dao 순서로 요청 전달, service 클래스에서 연결 생성 (getConnection)
	 * 멘토님 파일, 톡방 블로그 링크에서는 service 클래스 없이 각 dao 메소드에서 연결 생성
	 * service 클래스 없이 진행한다면 setConnection 클래스는 없어도 될 듯...? (확실 x)
	 * public void setConnection(Connection con) {
	 *     this.con = con;
	 * }
	*/
	
	public static UniversityDAO getInstance() {
		if(universityDAO == null) {
			universityDAO = new UniversityDAO();
		}
		
		return universityDAO;
	}
}
