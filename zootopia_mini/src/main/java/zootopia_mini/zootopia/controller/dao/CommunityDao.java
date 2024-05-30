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
        CommunityVO cvo = null;
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
                cvo = new CommunityVO();
                cvo.setGseq(rs.getInt("gseq"));
                cvo.setVcount(rs.getInt("vcount"));
                // cvo.setUserid(rs.getString("userid")); 
                cvo.setNickname(rs.getString("nickname"));
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
    
    public ArrayList<CommunityVO> communityList(Paging paging, String key) {
		ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
		con = DB.getConnection();
		String sql = "SELECT * FROM qna WHERE subject LIKE CONCAT('%',?,'%') ORDER BY qseq DESC LIMIT ? OFFSET ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, key);
			pstmt.setInt(2, paging.getRecordrow());
			pstmt.setInt(3, paging.getFirstnum()-1);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommunityVO cvo = new CommunityVO();
				cvo.setGseq(rs.getInt("gseq"));
				cvo.setSubject(rs.getString("subject"));
				cvo.setContent(rs.getString("content"));
				cvo.setUserid(rs.getString("userid"));
				cvo.setCreatedate(rs.getTimestamp("createdate"));
				cvo.setRecommands(rs.getInt("recommands"));
//				System.out.println(mvo.toString());
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
		// 검색어가 '부츠' CONCAT의 결과 '%부츠%' -> 부츠를 포함한 상품명 검색
		// 검색어가 '' CONCAT의 결과 '%%' -> 모두검색
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