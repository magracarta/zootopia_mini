package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
        String sql = "SELECT c.gseq, c.subject, c.content, c.createdate, c.recommands, c.userid, m.nickname, m.userid AS user_id, c.kind " +
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
                cvo.setKind(rs.getInt("kind")); // kind 추가
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
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;

        try {
            con = DB.getConnection();
            String sql = "SELECT COUNT(*) AS cnt FROM community";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt("cnt");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
     
        return count;
    }

    public CommunityVO getCommunity(int gseq) {
        CommunityVO cvo = null; // 결과가 없는 경우에는 null로 초기화
        
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
                cvo = new CommunityVO(); 
                cvo.setGseq(gseq);
                cvo.setVcount(rs.getInt("vcount"));
               // cvo.setNicknameFromView(rs.getString("nickname"));
                cvo.setUserid(rs.getString("userid"));
                cvo.setSubject(rs.getString("subject"));
                cvo.setContent(rs.getString("content"));
                cvo.setRecommands(rs.getInt("recommands"));
                cvo.setKind(rs.getInt("kind"));
                cvo.setCreatedate(rs.getTimestamp("createdate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }

        return cvo;
    }

    public void insertCommunity(CommunityVO cvo) {
        String sql = "INSERT INTO community (subject, content, kind, userid) VALUES (?, ?, ?, ?)";

        try {
            con = DB.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, cvo.getSubject());
            pstmt.setString(2, cvo.getContent());
            pstmt.setInt(3, cvo.getKind());
            pstmt.setString(4, cvo.getUserid());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
    }

    public String getNickname(String userid) {
        String nickname = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DB.getConnection();
            String sql = "SELECT nickname FROM nickname WHERE userid = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                nickname = rs.getString("nickname");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }

        return nickname;
    }

    public void updateCommunity(CommunityVO cvo) {
        String sql = "UPDATE community SET kind=?, subject=?, content=? WHERE gseq=?";
        con = DB.getConnection();
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, cvo.getKind());
            pstmt.setString(2, cvo.getSubject());
            pstmt.setString(3, cvo.getContent());
            pstmt.setInt(4, cvo.getGseq());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally { 
            DB.close(con, pstmt, rs);  
        }   
    }
	
	
}