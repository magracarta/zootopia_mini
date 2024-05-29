package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.controller.dto.ContestPetDTO;
import zootopia_mini.zootopia.util.DB;

public class ContestDao {
	private static ContestDao itc = new ContestDao();
	public static ContestDao getInstance() { return itc; }
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public ArrayList<ContestDTO> getList() {
		ArrayList<ContestDTO> list = new ArrayList<ContestDTO>();
		
		con = DB.getConnection();
		String sql = "select * from contestpet_view order by cseq desc";
		try {
			pstmt =  con.prepareStatement(sql);
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
		String sql = "select * from contest_pet where cseq = ? order by recommends";
		try {
			pstmt =  con.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new ContestPetDTO(
						rs.getInt("cpseq"),
						rs.getString("userid"),
						rs.getString("nickname"),
						rs.getInt("cseq"),
						rs.getString("content"),
						rs.getInt("recommends"),
						rs.getString("image"),
						rs.getString("saveimage")
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
