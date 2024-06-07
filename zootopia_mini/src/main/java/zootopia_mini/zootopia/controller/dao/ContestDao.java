package zootopia_mini.zootopia.controller.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import zootopia_mini.zootopia.controller.action.contest.testDto;
import zootopia_mini.zootopia.controller.dto.CommunityVO;
import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.controller.dto.ContestPetDTO;
import zootopia_mini.zootopia.controller.dto.Contest_replyDTO;
import zootopia_mini.zootopia.util.DB;
import zootopia_mini.zootopia.util.Paging;

public class ContestDao {
	private static ContestDao itc = new ContestDao();
	public static ContestDao getInstance() { return itc; }
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public ArrayList<ContestDTO> getList(Paging page, String search) {
		ArrayList<ContestDTO> list = new ArrayList<ContestDTO>();
		
		con = DB.getConnection();
		String sql = "select * from contestpet_view  where subject like concat('%',?,'%') and useyn ='Y' order by cseq desc limit ? offset ?";
		try {
			pstmt =  con.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setInt(2, page.getRecordrow());
			pstmt.setInt(3, page.getOffsetnum());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				list.add(new ContestDTO(
						rs.getInt("cseq"),
						rs.getString("userid"),
						rs.getString("subject"),
						rs.getString("content"),
						rs.getTimestamp("createdate"),
						rs.getTimestamp("lastdate"),
						rs.getInt("cnt"),
						rs.getString("useyn"),
						rs.getInt("pcnt"),
						rs.getInt("allpcnt"),
						rs.getString("nickname")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
	
		
		return list;
	}
	
	
	public ArrayList<ContestDTO> getList(Paging page, String search , String category) {
		ArrayList<ContestDTO> list = new ArrayList<ContestDTO>();
		con = DB.getConnection();
		String useyn = " and useyn ='Y' ";
		if(category.equals("wating")) {
			useyn = " and useyn ='W' ";
		}else if(category.equals("all")) {
			useyn = "  ";
			
		}else if(category.equals("playing")) {
			useyn = "and now() < lastdate  and useyn ='Y' ";
			
		}else if(category.equals("accomplished")) {
			useyn = " and now() > lastdate and useyn ='Y'";
		}
		String sql = "select * from contestpet_view  where subject like concat('%',?,'%')"
				+ useyn
				+ "order by useyn desc , cseq desc limit ? offset ?";
		
		try {
			pstmt =  con.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setInt(2, page.getRecordrow());
			pstmt.setInt(3, page.getOffsetnum());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				list.add(new ContestDTO(
						rs.getInt("cseq"),
						rs.getString("userid"),
						rs.getString("subject"),
						rs.getString("content"),
						rs.getTimestamp("createdate"),
						rs.getTimestamp("lastdate"),
						rs.getInt("cnt"),
						rs.getString("useyn"),
						rs.getInt("pcnt"),
						rs.getInt("allpcnt"),
						rs.getString("nickname")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
	
		
		return list;
	}
	
	
	public int getAllCount(String table, String search) {
		int count = 0;
		con = DB.getConnection();
		String sql = "select count(*) as cnt from "+table+ " where useyn ='Y' and subject like concat('%',?,'%')";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();
			if(rs.next()) count = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return count;
	}
	
	public int getAllCount(String table, String search, String category) {
		int count = 0;
		String useyn = " and useyn ='Y' ";
		if(category.equals("wating")) {
			useyn = " and useyn ='W' ";
		}else if(category.equals("all")) {
			useyn = "  ";
			
		}else if(category.equals("playing")) {
			useyn = "and now() < lastdate  and useyn ='Y' ";
			
		}else if(category.equals("accomplished")) {
			useyn = " and now() > lastdate ";
		}
		con = DB.getConnection();
		String sql = "select count(*) as cnt from "+table+ " where subject like concat('%',?,'%') and useyn !='N' "
				+ useyn;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();
			if(rs.next()) count = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return count;
	}
	public ArrayList<ContestPetDTO> getCpdList(int cseq) {
		ArrayList<ContestPetDTO> list = new ArrayList<ContestPetDTO>();
		con = DB.getConnection();
		String sql = "select * from contestpetiv_view where cseq = ? order by recommends desc";
		try {
			pstmt =  con.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new ContestPetDTO(
						rs.getInt("cpseq"),
						rs.getString("content"),
						rs.getString("userid"),
						rs.getString("nickname"),
						rs.getInt("cseq"),
						rs.getInt("recommends"),
						rs.getString("image"),
						rs.getString("saveimage"),
						rs.getString("petname"),
						rs.getString("petgender"),
						rs.getString("kind"),
						rs.getString("password")
						));
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return list;
	}
	public void insertContest(ContestDTO cdto) {
		con = DB.getConnection();
		String sql = "insert into contest (userid , subject , content, lastdate ,pcnt ) values (?, ?, ?, ? ,? )";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cdto.getUserid());
			pstmt.setString(2, cdto.getSubject());
			pstmt.setString(3, cdto.getContent());
			pstmt.setTimestamp(4, cdto.getLastdate());
			pstmt.setInt(5, cdto.getPcnt());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
	}
	public ContestDTO getContest(int cseq) {
		ContestDTO cdto = null;
		con = DB.getConnection();
		String sql = "select * from contestpet_view where cseq = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cdto = new ContestDTO(
							rs.getInt("cseq"),
							rs.getString("userid"),
							rs.getString("subject"),
							rs.getString("content"),
							rs.getTimestamp("createdate"),
							rs.getTimestamp("lastdate"),
							rs.getInt("cnt"),
							rs.getString("useyn"),
							rs.getInt("pcnt"),
							rs.getInt("allpcnt"),
							rs.getString("nickname")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return cdto;
	}
	public void viewCountUp(int visitcount, String csep) {
		con = DB.getConnection();
		String sql = "update contest set cnt = ? where cseq = ? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, visitcount);
			pstmt.setInt(2, Integer.parseInt(csep));
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
				
		
	}
	public void updateContest(ContestDTO cdto) {
		con =DB.getConnection();
		String sql = "update contest set subject = ? , content = ? , lastdate = ? ,pcnt =?  where cseq = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cdto.getSubject());
			pstmt.setString(2, cdto.getContent());
			pstmt.setTimestamp(3, cdto.getLastdate());
			pstmt.setInt(4, cdto.getPcnt());
			pstmt.setInt(5, cdto.getCseq());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
	}
	public int deleteContest(int cseq) {
		int result = 0;
		con =DB.getConnection();
		String sql = "delete from contest where cseq = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		int petdelte = deletecontest_pet(cseq);
		
		
		return result;
	}
	
	public int deletecontest_pet(int cseq) {
		int result = 0;
		con =DB.getConnection();
		String sql ="delete from contest_pet where cseq = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		return result;
	}
	public int getCpdList(String userid, String cseq) {
		int result =0;
		con=DB.getConnection();
		String sql ="select * from contest_pet where cseq = ? && userid =?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cseq));
			pstmt.setString(2, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) result = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		
		return result;
	}
	public void insertContestPet(ContestPetDTO cpdto) {
		con=DB.getConnection();
		String sql ="insert into contest_pet (userid , cseq , content , image , saveimage) values(? , ? , ? , ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cpdto.getUserid());
			pstmt.setInt(2, cpdto.getCseq());
			pstmt.setString(3, cpdto.getContent());
			pstmt.setString(4, cpdto.getImage());
			pstmt.setString(5, cpdto.getSaveimage());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
	}
	public ContestPetDTO getContestPet(int cpseq) {
		ContestPetDTO cdto = null;
		con = DB.getConnection();
		String sql = "select * from contestpetiv_view where cpseq = ?";
		try {
			pstmt =  con.prepareStatement(sql);
			pstmt.setInt(1, cpseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cdto = (new ContestPetDTO(
						rs.getInt("cpseq"),
						rs.getString("content"),
						rs.getString("userid"),
						rs.getString("nickname"),
						rs.getInt("cseq"),
						rs.getInt("recommends"),
						rs.getString("image"),
						rs.getString("saveimage"),
						rs.getString("petname"),
						rs.getString("petgender"),
						rs.getString("kind"),
						rs.getString("password")
						));
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return cdto;
	}
	public void addRecommend(int recommends, int cpseq) {
		con = DB.getConnection();
		String sql = "update contest_pet set recommends = ? where cpseq = ?";
		try {
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, recommends);
			pstmt.setInt(2, cpseq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
	}
	public void updateContestPet(ContestPetDTO cpdto) {
		con = DB.getConnection();
		String sql = "update contest_pet set userid = ?, cseq = ? , content = ?,  image = ? , saveimage = ? where cpseq = ?";
		
		try {
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, cpdto.getUserid());
			pstmt.setInt(2, cpdto.getCseq());
			pstmt.setString(3, cpdto.getContent());
			pstmt.setString(4, cpdto.getImage());
			pstmt.setString(5, cpdto.getSaveimage());
			pstmt.setInt(6, cpdto.getCpseq());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
	}
	public void deletePet(int cpseq) {
		
		con = DB.getConnection();
		String sql = "delete from contest_pet where cpseq = ?";
		
		try {
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, cpseq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
	}
	public ArrayList<Contest_replyDTO> getContestList(String cseq, Paging page) {
		ArrayList<Contest_replyDTO> list = new ArrayList<Contest_replyDTO>();
		
		con = DB.getConnection();
		String sql = "select * from contest_reply where cseq = ? order by crseq desc limit ? offset ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cseq));
			pstmt.setInt(2, page.getRecordrow());
			pstmt.setInt(3, page.getOffsetnum());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Contest_replyDTO(
							rs.getInt("crseq"),
							rs.getInt("cseq"),
							rs.getString("userid"),
							rs.getTimestamp("createdate"),
							rs.getString("content")
						));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		
		return list;
	}
	public int getAllCountReply(String cseq) {
		int count =0;
		con = DB.getConnection();
		String sql = "select count(*) as cnt from contest_reply where cseq = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cseq));
			rs =pstmt.executeQuery();
			if(rs.next()) count = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return count;
	}
	public void insertContestReply(Contest_replyDTO crdto) {
		con = DB.getConnection();
		String sql = "insert into contest_reply ( cseq , userid , content ) values ( ? , ?, ?) ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, crdto.getCseq());
			pstmt.setString(2, crdto.getUserid());
			pstmt.setString(3, crdto.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
	}
	public void deleteContestReply(int crseq) {
		con = DB.getConnection();
		String sql = "delete from contest_reply where crseq = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,crseq);
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
	}
	public void updateContestReply(int crseq, String content) {
		con = DB.getConnection();
		String sql = "update contest_reply set content = ? where crseq = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, crseq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
	}

	public ArrayList<ContestDTO> getContestThirdList() {
		ArrayList<ContestDTO> lsit = new ArrayList<ContestDTO>();
		con = DB.getConnection();
		String sql =  "select * from contestpet_view where lastdate > now() "
				+ "and lastdate > now() and  useyn = 'Y' order by cnt desc limit 3;";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				lsit.add( new ContestDTO(
							rs.getInt("cseq"),
							rs.getString("userid"),
							rs.getString("subject"),
							rs.getString("content"),
							rs.getTimestamp("createdate"),
							rs.getTimestamp("lastdate"),
							rs.getInt("cnt"),
							rs.getString("useyn"),
							rs.getInt("pcnt"),
							rs.getInt("allpcnt"),
							rs.getString("nickname")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return lsit;
	}
	public ArrayList<ContestPetDTO> getMainCpdList(int cseq) {
		ArrayList<ContestPetDTO> lsit = new ArrayList<ContestPetDTO>();
		con = DB.getConnection();
		String sql =  "select * from contestpetiv_view where cseq = ? order by recommends desc limit 3;";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				lsit.add(new ContestPetDTO(
						rs.getInt("cpseq"),
						rs.getString("content"),
						rs.getString("userid"),
						rs.getString("nickname"),
						rs.getInt("cseq"),
						rs.getInt("recommends"),
						rs.getString("image"),
						rs.getString("saveimage"),
						rs.getString("petname"),
						rs.getString("petgender"),
						rs.getString("kind"),
						rs.getString("password")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return lsit;
	}
	public ArrayList<CommunityVO> getCommunityMainList() {
		ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
		String sql = "SELECT c.gseq, c.subject, c.content, c.createdate, c.recommands, c.userid, m.nickname, m.userid AS user_id, c.kind " +
                "FROM community c JOIN member m ON c.userid = m.userid " +
                "where c.createdate > DATE_SUB(NOW(), INTERVAL 7 DAY) ORDER BY c.recommands DESC , c.vcount DESC LIMIT 4;";
		   con = DB.getConnection();
		   try {
		       pstmt = con.prepareStatement(sql);
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


	public ArrayList<testDto> testProcedure(String userId) {
		 ArrayList<testDto> list = new ArrayList<testDto>();
		 con = DB.getConnection();
		 String query = "{ CALL get_user_comments(?) }";
		 CallableStatement cstmt = null;

		 try {
			cstmt = con.prepareCall(query);
			
			 cstmt.setString(1, userId);
	         rs = cstmt.executeQuery();
	         while (rs.next()) {
	        	 testDto tdto = new testDto();
	        	 tdto.setSource(rs.getString("source"));
	        	 tdto.setUserId(rs.getString("user_id"));
	        	 tdto.setPostId(rs.getInt("post_id"));
	        	 tdto.setReplyId(rs.getInt("reply_id"));
	        	 tdto.setReplyContent(rs.getString("reply_content"));
	        	 tdto.setReplyDate(rs.getString("reply_date"));
                list.add(tdto);
	            }

	         
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			try {
				if(cstmt != null)cstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	       DB.close(con, pstmt, rs);
	   }
		 
		 
		 
		 
		 return list;
	}
	
	
	
	
	

}
