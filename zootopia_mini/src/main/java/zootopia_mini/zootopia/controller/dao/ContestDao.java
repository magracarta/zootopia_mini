package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import zootopia_mini.zootopia.controller.dto.ContestDTO;

public class ContestDao {
	private static ContestDao itc = new ContestDao();
	public static ContestDao getInstance() { return itc; }
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public ArrayList<ContestDTO> getList() {
		
		return null;
	}
	
	
	
	
	

}
