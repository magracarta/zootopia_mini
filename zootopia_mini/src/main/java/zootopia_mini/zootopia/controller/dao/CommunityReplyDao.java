package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import zootopia_mini.zootopia.controller.dto.CommunityReplyDTO;
import zootopia_mini.zootopia.util.DB;

public class CommunityReplyDao {

	private CommunityReplyDao() {}
    private static CommunityReplyDao instance = new CommunityReplyDao();
    public static CommunityReplyDao getInstance() { return instance; }

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
	public void insertCommunityReply(CommunityReplyDTO crdto) {

		String sql = "INSERT INTO community_reply (content, Userid, gseq) VALUES (?, ?, ?) ";
		con =DB.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, crdto.getContent());
			pstmt.setString(2, crdto.getUserid());
			pstmt.setInt(3, crdto.getGseq ());
            pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
            DB.close(con, pstmt, rs);
        }
		
	}


	
	public ArrayList<CommunityReplyDTO> getCommunityReplies(int grseq) {
        ArrayList<CommunityReplyDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DB.getConnection(); 
            String sql = "SELECT r.*, m.nickname FROM community_reply r JOIN member m ON r.userid = m.userid WHERE gseq = ? ORDER BY r.createdate DESC";

            pstmt = con.prepareStatement(sql); 
            pstmt.setInt(1, grseq); 
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CommunityReplyDTO crdto = new CommunityReplyDTO();
                crdto.setGrseq(rs.getInt("grseq"));
                crdto.setGseq(rs.getInt("gseq"));
                crdto.setUserid(rs.getString("userid"));
                crdto.setContent(rs.getString("content"));
                crdto.setNickname(rs.getString("nickname"));
                crdto.setSaveImage(crdaogetSaveImage(crdto));
                list.add(crdto);
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        } finally {
            DB.close(con, pstmt, rs);
        }

        return list;
    }

	public void deleteCommunityReply(int grseq) {
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        con = DB.getConnection();
	        String sql = "DELETE FROM community_reply WHERE grseq=?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, grseq);
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DB.close(con, pstmt, rs);
	    }
	}



    public String crdaogetSaveImage(CommunityReplyDTO reply) {
        String saveImage = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            con = DB.getConnection();
            String sql = "select saveimage from member where userid = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, reply.getUserid());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                saveImage = rs.getString("saveimage");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }

        return saveImage;
    }



    public void updateCommunityReply(int grseq, String content) {
    	con = DB.getConnection();
    	String sql = "update community_reply set content = ? where grseq = ?";
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, content);
            System.out.println("contet:" +content);
            pstmt.setInt(2, grseq);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
    }

	
}
