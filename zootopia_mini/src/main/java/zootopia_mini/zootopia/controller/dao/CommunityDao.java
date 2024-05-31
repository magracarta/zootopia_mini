package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import zootopia_mini.zootopia.controller.dto.CommunityVO;
import zootopia_mini.zootopia.util.DB;
import zootopia_mini.zootopia.util.Paging;

public class CommunityDao {

	private CommunityDao() {}
    private static CommunityDao instance = new CommunityDao();
    public static CommunityDao getInstance() { return instance; }

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public ArrayList<CommunityVO> selectCommunity(Paging paging) {
        ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
        String sql = "SELECT c.gseq, c.subject, c.content, c.createdate, c.recommands, m.nickname FROM "
        		+ "community c JOIN member m ON c.userid = m.userid ORDER BY c.gseq DESC LIMIT ? OFFSET ?;";
        con = DB.getConnection();
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, paging.getRecordrow());
            pstmt.setInt(2, paging.getFirstnum());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CommunityVO cvo = new CommunityVO();
                cvo.setGseq(rs.getInt("gseq"));
                cvo.setSubject(rs.getString("subject"));
                cvo.setContent(rs.getString("content"));
                cvo.setCreatedate(rs.getTimestamp("createdate"));
                cvo.setRecommands(rs.getInt("recommands"));
                // 닉네임 설정
                cvo.setNicknameFromView(rs.getString("nickname"));
                list.add(cvo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
        return list;
    }
   
    public int getAllCount() {
        int count = 0;
        con = DB.getConnection();
        String sql = "select count(*) as cnt from community";
        try {
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) 
                count = rs.getInt("cnt");
        } catch (SQLException e) { 
            e.printStackTrace();
        } finally {  
            DB.close(con, pstmt, rs);  
        }
        return count;
    }

    public CommunityVO getCommunity(int gseq) {
        CommunityVO community = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DB.getConnection();
            String sql = "SELECT c.*, n.nickname FROM community c JOIN nickname n ON c.userid = n.userid WHERE c.gseq = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, gseq);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                community = new CommunityVO();
                community.setGseq(gseq);
                community.setVcount(rs.getInt("vcount"));
                community.setNickname(rs.getString("nickname"));
                community.setSubject(rs.getString("subject"));
                community.setContent(rs.getString("content"));
                community.setRecommands(rs.getInt("recommands"));
                community.setKind(rs.getInt("kind"));
                community.setCreatedate(rs.getTimestamp("createdate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }

        return community;
    }
	
}