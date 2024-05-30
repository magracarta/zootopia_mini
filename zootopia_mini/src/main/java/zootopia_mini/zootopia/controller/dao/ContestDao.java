package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	public ArrayList<ContestDTO> getList(Paging page) {
		ArrayList<ContestDTO> list = new ArrayList<ContestDTO>();
		
		con = DB.getConnection();
		String sql = "select * from contestpet_view order by cseq desc limit ? offset ?";
		try {
			pstmt =  con.prepareStatement(sql);
			pstmt.setInt(1, page.getRecordrow());
			pstmt.setInt(2, page.getOffsetnum());
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
	public int getAllCount(String string) {
		int count = 0;
		con = DB.getConnection();
		String sql = "select count(*) as cnt from contest";
		
		try {
			pstmt = con.prepareStatement(sql);
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
	
	
	
	
	

}
