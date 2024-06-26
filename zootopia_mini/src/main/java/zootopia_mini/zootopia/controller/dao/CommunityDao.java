package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import zootopia_mini.zootopia.controller.dto.AdminVO;
import zootopia_mini.zootopia.controller.dto.CommunityReplyDTO;
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

    public ArrayList<CommunityVO> selectCommunity(Paging paging, int categorynum, String search) {
        ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
        String whereadd = "  ";
        if(categorynum != 0) {
        	whereadd = " and c.kind = "+ categorynum;
        }
        
        String sql = "SELECT c.gseq, c.subject, c.content, c.createdate, c.recommands, c.userid, m.nickname, m.userid AS user_id, c.kind, c.vcount " +
                     "FROM community c JOIN member m ON c.userid = m.userid where c.subject like concat('%',?,'%')" + whereadd +
                     " ORDER BY c.gseq DESC LIMIT ? OFFSET ?;";
        con = DB.getConnection();
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, search);
            pstmt.setInt(2, paging.getRecordrow());
            pstmt.setInt(3, paging.getOffsetnum());

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
   
    public int getAllCount(int kind, String search) {
        int count = 0;
        ResultSet rs = null;
        String kindwhere = " ";
        if(kind > 0 ) {
        	kindwhere = " and kind = "+kind;
        }
        
        try {
            con = DB.getConnection();
            String sql = "SELECT COUNT(*) AS cnt FROM community where subject like concat('%',?,'%') " + kindwhere;
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,search);
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
        CommunityVO cvo = new CommunityVO(); 
        String sql = "SELECT c.* , n.nickname FROM community c JOIN member n ON c.userid = n.userid WHERE c.gseq = ?";
        con = DB.getConnection();

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, gseq);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                cvo = new CommunityVO(); 
                cvo.setGseq(gseq);
                cvo.setVcount(rs.getInt("vcount"));
                cvo.setUserid(rs.getString("userid"));
                cvo.setSubject(rs.getString("subject"));
                cvo.setContent(rs.getString("content"));
                cvo.setRecommands(rs.getInt("recommands"));
                cvo.setKind(rs.getInt("kind"));
                cvo.setCreatedate(rs.getTimestamp("createdate"));
                cvo.setNickname(rs.getString("nickname")); 
                cvo.setSaveImage(getSaveImage(cvo.getUserid())); 
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
        con = DB.getConnection();

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, cvo.getSubject());
            pstmt.setString(2, cvo.getContent());
            pstmt.setInt(3, cvo.getKind());
            pstmt.setString(4, cvo.getUserid());
            int f = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
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
	
    public void deleteCommunity(int gseq) {
    	con = DB.getConnection();
    	String sql = "DELETE FROM community WHERE gseq=?";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, gseq);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
    }
    
    public void updateRecommendations(int gseq) {
        String sql = "UPDATE community SET recommands = recommands + 1 WHERE gseq = ?";
        con = DB.getConnection();
        try {           
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, gseq);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

	public void increaseViewCount(int gseq) {
    String sql = "UPDATE community SET vcount = vcount + 1 WHERE gseq = ?";
    con = DB.getConnection();
    try {
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, gseq);
        pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        DB.close(con, pstmt, rs);
    }
}

	
	public ArrayList<CommunityVO> getTop3Posts() {
	    ArrayList<CommunityVO> top3Posts = new ArrayList<>();
	    con = DB.getConnection();
	    String sql = "SELECT c.gseq, c.subject, c.content, c.userid, c.recommands, c.kind, c.vcount, m.nickname, c.createdate " +
	    		"FROM community c JOIN member m ON c.userid = m.userid " +
	    		"ORDER BY c.recommands DESC LIMIT 3";

	    try {
	        pstmt = con.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            CommunityVO cvo = new CommunityVO();
	            cvo.setGseq(rs.getInt("gseq"));
	            cvo.setSubject(rs.getString("subject"));
	            cvo.setContent(rs.getString("content"));
	            cvo.setUserid(rs.getString("userid"));
	            cvo.setRecommands(rs.getInt("recommands"));
	            cvo.setVcount(rs.getInt("vcount"));
	            cvo.setKind(rs.getInt("kind"));
	            cvo.setNicknameFromView(rs.getString("nickname"));
	            cvo.setCreatedate(rs.getTimestamp("createdate"));
	            top3Posts.add(cvo);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DB.close(con, pstmt, rs);
	    }

	    return top3Posts;
	}

	  public ArrayList<CommunityVO> findcontent(String subject, Paging paging, int categorynum) {
		  	
	        ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
	        con = DB.getConnection();
	        String whereadd = "  ";
	        if(categorynum != 0) {
	        	whereadd = " and c.kind = "+ categorynum ;
	        }
	        String sql = "SELECT c.gseq, c.subject, c.content, c.userid, c.recommands, c.kind, m.nickname, c.createdate " 
	        		+ "FROM community c JOIN member m ON c.userid = m.userid "+
                    " WHERE c.subject LIKE concat ('%', ? ,'%')" + whereadd +" ORDER BY c.gseq DESC LIMIT ? OFFSET ?";

	        try {

	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1,  subject);
	            pstmt.setInt(2, paging.getRecordrow());
	            pstmt.setInt(3, paging.getOffsetnum());
	            rs = pstmt.executeQuery();

	            while (rs.next()) {
	                CommunityVO cvo = new CommunityVO();
	                cvo.setGseq(rs.getInt("gseq")); 
	                cvo.setSubject(rs.getString("subject"));
	                cvo.setContent(rs.getString("content")); 
	                cvo.setUserid(rs.getString("userid")); 
	                cvo.setRecommands(rs.getInt("recommands"));
	                cvo.setKind(rs.getInt("kind"));
	                cvo.setNicknameFromView(rs.getString("nickname"));
	                cvo.setNickname(rs.getString("nickname")); 
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

	public void admininsertCommunity(CommunityVO cvo, HttpServletRequest request) {

		String sql = "INSERT INTO community (subject, content, kind, adminid) VALUES (?, ?, ?, ?)";
		

        try {
            con = DB.getConnection();
            pstmt = con.prepareStatement(sql);
            
            HttpSession session = request.getSession(false);
            AdminVO adminVO = (AdminVO) session.getAttribute("adminUser");
            String adminId = adminVO.getAdminid();
            pstmt.setString(1, cvo.getSubject());
            pstmt.setString(2, cvo.getContent());
            pstmt.setInt(3, cvo.getKind());
            pstmt.setString(4, adminId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
		
	}
	
	  public String getSaveImage(String userid) {
	        String saveImage = null;
	        Connection con = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        try {
	            con = DB.getConnection();
	            String sql = "select saveimage from member where userid = ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, userid);
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

	public int getAllCount(String subject , int categorynum) {
		int count = 0;
        ResultSet rs = null;
        String whereadd = "  ";
        if(categorynum != 0) {
        	whereadd = " and c.kind = "+ categorynum ;
        }
        try {
            con = DB.getConnection();
            String sql = "SELECT COUNT(*) AS cnt FROM community"+
                    " WHERE subject LIKE concat ('%', ? ,'%')" + whereadd;
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, subject);
            
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

	public int getAllCount(int kind) {
		 String where = "";
        if (kind > 0) {
        	where = " where kind ="+ kind;
        } 
        int count = 0;
        ResultSet rs = null;

        try {
            con = DB.getConnection();
            String sql = "SELECT COUNT(*) AS cnt FROM community" + where;
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
	
}