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

    public ArrayList<CommunityVO> communityBoard() {
        ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
        con = DB.getConnection();
        String sql = "SELECT * FROM community";
        try {
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CommunityVO cvo = new CommunityVO();
                cvo.setGseq(rs.getInt("gseq"));
                cvo.setVcount(rs.getInt("vcount"));
                //cvo.setUserid(rs.getString("userid"));
                cvo.setNickname(rs.getString("nickname"));
                cvo.setSubject(rs.getString("subject"));
                cvo.setContent(rs.getString("content"));
                cvo.setRecommands(rs.getInt("recommands"));
                cvo.setKind(rs.getInt("kind"));
                cvo.setCreatedate(rs.getTimestamp("createdate"));
                list.add(cvo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
        return list;
    }

    public CommunityVO selectCommunity(int gseq) {
        CommunityVO community = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DB.getConnection();
            String sql = "SELECT * FROM community WHERE gseq = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, gseq);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                community = new CommunityVO();
                community.setGseq(rs.getInt("gseq"));
                community.setVcount(rs.getInt("vcount"));
                // community.setUserid(rs.getString("userid")); 
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
    
    public ArrayList<CommunityVO> communityList(Paging paging, String key) {
        ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
        con = DB.getConnection();
        String sql = "SELECT * FROM community WHERE subject LIKE CONCAT('%',?,'%') ORDER BY gseq DESC LIMIT ? OFFSET ?";
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, key);
            pstmt.setInt(2, paging.getRecordrow());
            pstmt.setInt(3, paging.getOffsetnum());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CommunityVO cvo = new CommunityVO();
                cvo.setGseq(rs.getInt("gseq"));
                cvo.setSubject(rs.getString("subject"));
                cvo.setContent(rs.getString("content"));
                cvo.setUserid(rs.getString("userid"));
                cvo.setCreatedate(rs.getTimestamp("createdate"));
                cvo.setRecommands(rs.getInt("recommands"));
                list.add(cvo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
        return list;
    }
    
    public int getAllCount(String tablename, String fieldname, String key) {
        int count = 0;
        con = DB.getConnection();
        String sql = "SELECT COUNT(*) AS cnt FROM " + tablename + " WHERE " + fieldname + " LIKE CONCAT('%', ?, '%')";
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, key);
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
}