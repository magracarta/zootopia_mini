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

public class AdminContestDao {
	private AdminContestDao() {}
	private static AdminContestDao itc = new AdminContestDao();
	public static AdminContestDao getInstance() { return itc; }
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void updateDeleteFunction(String sql) {
		con = DB.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}	
		
	}
	
	public int mysqlAllcount(String sql) {
		int count = 0;
		con = DB.getConnection();
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


	public <T> ArrayList<T> mysqlContestSelect(String sql , Object obj) {
		ArrayList<T> list = new ArrayList<>();
		con = DB.getConnection();
		try {
			pstmt =con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Object objDTO = null;
				if(obj instanceof ContestDTO) objDTO = getContestDto(rs);
				if(obj instanceof ContestPetDTO) objDTO = getContestPetDto(rs);
				list.add( (T) objDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		return list;
	}


	private ContestPetDTO getContestPetDto(ResultSet rs) {
		ContestPetDTO cpdto = null;
	
		try {
			cpdto = new ContestPetDTO(rs.getInt("cpseq"), rs.getString("content"), rs.getString("userid"),
					rs.getString("nickname"), rs.getInt("cseq"), rs.getInt("recommends"),
					rs.getString("image"), rs.getString("saveimage"), rs.getString("petname"), rs.getString("petgender"), rs.getString("kind"), rs.getString("password") );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cpdto;
	}


	private  ContestDTO getContestDto ( ResultSet rs ) {
	ContestDTO cdto = null;
		try {
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
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cdto;
	}


	
	
	

	


}
