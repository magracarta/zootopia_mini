package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import zootopia_mini.zootopia.controller.dto.AdminVO;
import zootopia_mini.zootopia.controller.dto.MemberVO;
import zootopia_mini.zootopia.util.DB;
import zootopia_mini.zootopia.util.Paging;


public class AdminDao {

	private AdminDao() {}
	private static AdminDao itc = new AdminDao();
	public static AdminDao getInstance() { return itc; }
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public AdminVO getAdmin(String adminid) {

		AdminVO avo = null;
		con = DB.getConnection();
		String sql = "select * from admins where adminid=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, adminid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				avo = new AdminVO();
				avo.setAdminid(rs.getString("adminid"));
				avo.setPwd(rs.getString("pwd"));
				avo.setName(rs.getString("name"));
				avo.setPhone(rs.getString("phone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			DB.close(con, pstmt, rs);
		}
		return avo;
	}

	public int getAllCount(String tablename, String fieldname, String key) {

		int count = 0;
		con = DB.getConnection();
		String sql = "select count(*) as cnt from " + tablename 
				+ " where " + fieldname + " like concat('%', ?, '%')";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, key);
			rs = pstmt.executeQuery();
			if(rs.next())
				count = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(con, pstmt, rs);
		}
		
		return count;
	}

	public ArrayList<MemberVO> adminMemberList(Paging paging, String key) {

		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		con = DB.getConnection();
		String sql = "select * from member "
				+ " where name like concat('%', ?, '%') "
				+ " order by createdate desc "
				+ " limit ? offset ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, key);
			pstmt.setInt(2, paging.getDisplayRow());
			pstmt.setInt(3, paging.getStartNum()-1);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO mvo = new MemberVO();
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
				
				

				list.add(mvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(con, pstmt, rs);
		}
		
		return list;
	}
	
}
