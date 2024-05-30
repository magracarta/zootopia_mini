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
				cvo.setUserid(rs.getString("userid"));
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
    
}