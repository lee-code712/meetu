package meetu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import meetu.common.dbutil.DBConnection;
import meetu.dto.MemberDTO;

public class LoginDAO {
 //DAO : Data Access Object
 //DB접근해서 처리하는 작업을 모두 처리하는 객체
 /*
  * DB 처리해야 할 일이 있으면 DAO
  * 인스턴슬 받아서
  * 각각 insert, delete 등 모든 작업을
  * 모듈화 해 놓으면 다른 객체에서 호출해서 사용
  */
	
  private static LoginDAO instance = new LoginDAO();
  
  public static LoginDAO getInstance() {
	  return instance;
  }
  
  public MemberDTO loginOk(MemberDTO dto) throws NamingException/* , SQLException */ {
     PreparedStatement pstmt =null;
     ResultSet rs = null;
     
     try {       
	     Connection conn = DBConnection.getConnection(); 
	     
	     pstmt = conn.prepareStatement("select user_id from member where user_id=? and password=? and roll=?");
	     pstmt.setString(1, dto.getUser_id());
	     pstmt.setString(2, dto.getPassword());
	     pstmt.setString(3, dto.getRoll());
	     
	     rs = pstmt.executeQuery();
	     
	     if(!rs.next()) { // 로그인 실패
	    	 dto = null;
	     }
	     
	     //if close
	     if (rs != null)
	    	 rs.close();
	     if(pstmt != null)
	    	 pstmt.close();
	     if(conn != null)
	    	 conn.close();
    } catch(SQLException e) {
    	e.printStackTrace();
    }
      //connection .닫기	
	return dto;
   }
}
