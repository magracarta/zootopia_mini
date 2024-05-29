package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import zootopia_mini.zootopia.controller.dto.CommunityVO;
import zootopia_mini.zootopia.util.DB;

public class CommunityDao {

    private CommunityDao() {}
    private static CommunityDao instance = new CommunityDao();
    public static CommunityDao getInstance() { return instance; }
    
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public ArrayList<CommunityVO> getAllCommunity() {
        ArrayList<CommunityVO> community = new ArrayList<>();
        con = DB.getConnection();
        String sql = "SELECT * FROM communities";
        try {
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CommunityVO community = new CommunityVO();
                community.setGseq(rs.getInt("gseq"));
                community.setVcount(rs.getInt("vcount"));
                community.setUserid(rs.getString("userid"));
                community.setNickname(rs.getString("nickname"));
                community.setSubject(rs.getString("subject"));
                community.setContent(rs.getString("content"));
                community.setRecommands(rs.getInt("recommands"));
                community.setKind(rs.getInt("kind"));
                community.setCreatedate(rs.getTimestamp("createdate"));
                communities.add(community); // 수정된 부분
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
        return communities; // 수정된 부분
    }
}