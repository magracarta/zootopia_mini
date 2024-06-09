package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import zootopia_mini.zootopia.controller.dto.AdminVO;
import zootopia_mini.zootopia.controller.dto.CommunityVO;
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

	public void updateProduct(MemberVO mvo) {
		
		String sql = "update member set nickname=?, pwd=?, name=?,  phone=?, "
				+ " email=?, image=?, saveimage=?, kind=?, petname=?, petgender=? where userid=?";
		con = DB.getConnection();
		try {			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo.getNickname());
		    pstmt.setString(2, mvo.getPwd());
		    pstmt.setString(3, mvo.getName());
		    pstmt.setString(4, mvo.getPhone());
		    pstmt.setString(5, mvo.getEmail());
		    pstmt.setString(6, mvo.getImage());
		    pstmt.setString(7, mvo.getSaveimage());
		    pstmt.setString(8, mvo.getKind());
		    pstmt.setString(9, mvo.getPetname());
		    pstmt.setString(10, mvo.getPetgender() );
		    pstmt.setString(11, mvo.getUserid());
		    pstmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();
		} finally { DB.close(con, pstmt, rs);  }
		
	}

	public void deleteMember(String userid) {

		con = DB.getConnection();
		String sql = "delete from member where userid=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(con, pstmt, rs);
		}
		
	}

	public ArrayList<CommunityVO> selectCommunity(Paging paging) {

		ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
        String sql = "SELECT c.gseq, c.subject, c.content, c.createdate, c.recommands, c.userid, m.nickname, m.userid AS user_id, c.kind, c.vcount " +
                     "FROM community c JOIN member m ON c.userid = m.userid " +
                     "ORDER BY c.gseq DESC LIMIT ? OFFSET ?;";
        con = DB.getConnection();
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, paging.getRecordrow());
            pstmt.setInt(2, paging.getOffsetnum());

            rs = pstmt.executeQuery();
            while (rs.next()) {
                CommunityVO cvo = new CommunityVO();
                cvo.setGseq(rs.getInt("gseq"));
                cvo.setSubject(rs.getString("subject"));
                cvo.setUserid(rs.getString("userid"));
                cvo.setContent(rs.getString("content"));
                cvo.setCreatedate(rs.getTimestamp("createdate"));
                cvo.setRecommands(rs.getInt("recommands"));
                cvo.setNicknameFromView(rs.getString("nickname"));
                cvo.setKind(rs.getInt("kind"));
                cvo.setVcount(rs.getInt("vcount")); 
                list.add(cvo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
        return list;
		
		
	}

	public void deleteCommunity(String gseq) {

		con = DB.getConnection();
		String sql = "delete from community where gseq=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, gseq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(con, pstmt, rs);
		}
		
	}

	
	public String getAdminIdByName(String name) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String adminId = null;
        try {
            con = DB.getConnection();
            String sql = "SELECT adminid FROM admin WHERE username = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                adminId = rs.getString("adminid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
        return adminId;
    }
	

	
}
