package meetu.action;

import meetu.dao.UniversityDAO;
import meetu.dao.StudentMemberDAO;
import meetu.dao.ProfessorMemberDAO;

public class LoginAction {
	
	public static String checkLogin(String p, String id, String pw) {
		
		String ck = "-1";
		String univ = "";
		 
		int i = 0;
		char c = id.charAt(i);
		while(c >= 'a' && c <= 'z') {
			univ += c;
	        i++;
	        if(i >= id.length())
	        	break;
	        c = id.charAt(i);
	     }
	     
		if(UniversityDAO.isUnivID(univ) && id.length() > univ.length()) {
	    	 if(p.equals("0")) {
	    		 ck = StudentMemberDAO.isUserID(univ, id, pw);
	    	 } 
	    	 else {
	    		 ck = ProfessorMemberDAO.isUserID(univ, id, pw);
	    	 }
	     }
	     
		return ck;
	}
	
}
