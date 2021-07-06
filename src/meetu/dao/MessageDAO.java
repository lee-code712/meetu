package meetu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import meetu.common.dbutil.DBConnection;
import meetu.dto.*;

public class MessageDAO {
	private static MessageDAO instance = new MessageDAO();

	public static MessageDAO getInstance() {
		return instance;
	}
	
	// login한 회원과 선택한 회원이 주고받은 모든 쪽지정보 dto 반환
	public ArrayList<MessageInformationDTO> getMessagesInfo(String user_id, String mem_usr_id, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MessageInformationDTO> messages = new ArrayList<MessageInformationDTO>();

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from message_info where (send_id=? and recv_id=?) or (send_id=? and recv_id=?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, mem_usr_id);
			pstmt.setString(3, mem_usr_id);
			pstmt.setString(4, user_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				MessageInformationDTO msg_info_dto = new MessageInformationDTO();
				msg_info_dto.setMsgId(rs.getString("msg_id"));
				msg_info_dto.setSentTime(rs.getString("sent_time"));
				msg_info_dto.setIsRead(rs.getInt("is_read"));
				msg_info_dto.setSendId(rs.getString("send_id"));
				msg_info_dto.setRecvId(rs.getString("recv_id"));
				messages.add(msg_info_dto);
					
				while(rs.next()) {
					msg_info_dto = new MessageInformationDTO();
					msg_info_dto.setMsgId(rs.getString("msg_id"));
					msg_info_dto.setSentTime(rs.getString("sent_time"));
					msg_info_dto.setIsRead(rs.getInt("is_read"));
					msg_info_dto.setSendId(rs.getString("send_id"));
					msg_info_dto.setRecvId(rs.getString("recv_id"));
					messages.add(msg_info_dto);
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

		return messages;
	}
	
	// 특정 메시지 id에 대한 내용 dto를 반환
	public MessageContentDTO getMessage(String msg_id, String univ) throws NamingException/* , SQLException */ {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MessageContentDTO msg_content_dto = null;

		try {
			Connection conn = DBConnection.getConnection(univ);
			String sql = "select * from message_content where msg_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, msg_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				msg_content_dto = new MessageContentDTO();
				msg_content_dto.setMsgId(rs.getString("msg_id"));
				msg_content_dto.setMsg(rs.getString("msg"));
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

		return msg_content_dto;
	}

}
