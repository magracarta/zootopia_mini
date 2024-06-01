package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.controller.dto.ContestPetDTO;
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
	public ArrayList<ContestPetDTO> getCpdList(int cseq) {
		ArrayList<ContestPetDTO> list = new ArrayList<ContestPetDTO>();
		con = DB.getConnection();
		String sql = "select * from contestpetiv_view where cseq = ? order by recommends";
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
		return result;

	}
	
	
	
	
	

}
