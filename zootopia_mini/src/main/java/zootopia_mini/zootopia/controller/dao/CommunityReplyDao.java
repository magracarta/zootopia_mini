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

    public ArrayList<CommunityReplyDTO> getCommunityReplies(int gseq) {
    	ArrayList<CommunityReplyDTO> replies = new ArrayList<>();
        String sql = "SELECT * FROM community_reply WHERE gseq = ? ORDER BY createdate DESC";
        con = DB.getConnection();
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, gseq);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CommunityReplyDTO reply = new CommunityReplyDTO();
                reply.setUserid(rs.getString("Userid"));
                reply.setGseq(rs.getInt("gseq"));
                reply.setGrseq(rs.getInt("grseq"));
                reply.setContent(rs.getString("content"));
                replies.add(reply);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
        return replies;
    }
	
}
