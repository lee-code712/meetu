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
	 * ì±…ì? action > service > dao ?ˆœ?„œë¡? ?š”ì²? ? „?‹¬, service ?´?˜?Š¤?—?„œ ?—°ê²? ?ƒ?„± (getConnection)
	 * ë©˜í† ?‹˜ ?ŒŒ?¼, ?†¡ë°? ë¸”ë¡œê·? ë§í¬?—?„œ?Š” service ?´?˜?Š¤ ?—†?´ ê°? dao ë©”ì†Œ?“œ?—?„œ ?—°ê²? ?ƒ?„±
	 * service ?´?˜?Š¤ ?—†?´ ì§„í–‰?•œ?‹¤ë©? setConnection ?´?˜?Š¤?Š” ?—†?–´?„ ?  ?“¯...? (?™•?‹¤ x)
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
