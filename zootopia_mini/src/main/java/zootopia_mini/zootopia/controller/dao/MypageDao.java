package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import zootopia_mini.zootopia.controller.dto.MemberVO;
import zootopia_mini.zootopia.util.DB;

public class MypageDao {
	private MypageDao() {}
	private static MypageDao ist = new MypageDao();
	public static MypageDao getInstance() { return ist; }
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public void updateMember(MemberVO mvo1) {
		
		System.out.println("DB에 저장되는 파일명: " + mvo1.getSaveimage());
		con = DB.getConnection();
		String sql = "update member set pwd=?, name=?, email=? , "
				+ " phone=?, petname=?, kind=? , petgender=?, "
				+ " image=?, saveimage=? , nickname = ?  where userid = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo1.getPwd());
			pstmt.setString(2, mvo1.getName());
			pstmt.setString(3, mvo1.getEmail());
			pstmt.setString(4, mvo1.getPhone());
			pstmt.setString(5, mvo1.getPetname());
			pstmt.setString(6, mvo1.getKind());
			pstmt.setString(7, mvo1.getPetgender());
			pstmt.setString(8, mvo1.getImage());
			pstmt.setString(9, mvo1.getSaveimage());
			pstmt.setString(10, mvo1.getNickname());
			pstmt.setString(11, mvo1.getUserid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { DB.close(con, pstmt, rs);
		}
	 
	}


	public void deleteMember(String userid) {
		con = DB.getConnection();
		String sql = "update member set useyn='N' where userid = ? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { DB.close(con, pstmt, rs);
		}
	}
}
