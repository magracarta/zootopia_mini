package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import zootopia_mini.zootopia.controller.dto.MemberVO;
import zootopia_mini.zootopia.util.DB;

public class MemberDao {

	private MemberDao() {}
	private static MemberDao itc = new MemberDao();
	public static MemberDao getInstance() { return itc; }
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs =  null;
			
	
	public MemberVO getMember(String userid) {

		MemberVO mvo = null;
		con = DB.getConnection();
		String sql = "select * from member where userid=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mvo = new MemberVO();
				mvo.setUserid(rs.getString("userid"));
				mvo.setNickname(rs.getString("nickname"));
				mvo.setPwd(rs.getString("pwd"));
				mvo.setName(rs.getString("name"));
				mvo.setPhone(rs.getString("phone"));
				mvo.setEmail(rs.getString("email"));
				mvo.setCreatedate(rs.getTimestamp("createdate"));
				mvo.setImage(rs.getString("image"));
				mvo.setSaveimage(rs.getString("saveimage"));
				mvo.setKind(rs.getString("kind"));
				mvo.setUseyn(rs.getString("useyn"));
				mvo.setPetname(rs.getString("petname"));
				mvo.setPetgender(rs.getString("petgender"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(con, pstmt, rs);
		}
		
		return mvo;
		
	
	}


	public int insertMember(MemberVO mvo) {

		int result = 0;
		
		con = DB.getConnection();
		String sql = "insert into member(userid, nickname, pwd, name, phone, email, "
				+ " image, saveimage, kind, petname, petgender) " 
				+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo.getUserid());
			pstmt.setString(2, mvo.getNickname());
			pstmt.setString(3, mvo.getPwd());
			pstmt.setString(4, mvo.getName());
			pstmt.setString(5, mvo.getPhone());
			pstmt.setString(6, mvo.getEmail());
			pstmt.setString(7, mvo.getImage());
			pstmt.setString(8, mvo.getSaveimage());
			pstmt.setString(9, mvo.getKind());
			pstmt.setString(10, mvo.getPetname());
			pstmt.setString(11, mvo.getPetgender());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(con, pstmt, rs);
		}
		
		return result;
	}
	
}
