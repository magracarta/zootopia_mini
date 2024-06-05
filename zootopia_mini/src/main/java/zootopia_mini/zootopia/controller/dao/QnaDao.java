package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import zootopia_mini.zootopia.controller.dto.QnaVO;
import zootopia_mini.zootopia.util.DB;
import zootopia_mini.zootopia.util.Paging;

public class QnaDao {

	private QnaDao() { }
	private static QnaDao ist = new QnaDao();
	public static QnaDao getInstance() { 	return ist;	}
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<QnaVO> selectQna( Paging paging ) {
		ArrayList<QnaVO> list = new ArrayList<QnaVO>();
		String sql = "select * from qnareply order by qseq desc limit ?  offset ?";
		con = DB.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, paging.getRecordrow() );
			pstmt.setInt(2,  paging.getOffsetnum() );
			rs = pstmt.executeQuery();
			while(rs.next()) {
		    	QnaVO qvo = new QnaVO();
		    	qvo.setQseq( rs.getInt("qseq") );
		    	qvo.setSubject( rs.getString("subject") );
		    	qvo.setContent (rs.getString("content") );
		    	qvo.setUserid( rs.getString("userid") );
		    	qvo.setCreatedate( rs.getTimestamp("createdate") );
		    	qvo.setReply( rs.getString("reply") ) ;		    	
		    	list.add(qvo);
		    }
		} catch (SQLException e) {e.printStackTrace();
		} finally { DB.close(con, pstmt, rs);  }
		return list;
	}

	public QnaVO getQna(int qseq) {
		QnaVO qvo = new QnaVO();
		String sql = "select * from qnareply where qseq = ?";
		con = DB.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  qseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				qvo.setQseq(qseq);
				qvo.setSubject(rs.getString("subject"));
				qvo.setContent(rs.getString("content"));
				qvo.setUserid(rs.getString("userid"));
				qvo.setCreatedate(rs.getTimestamp("createdate"));
				qvo.setReply(rs.getString("reply"));
			}
		} catch (SQLException e) {e.printStackTrace();
		} finally { DB.close(con, pstmt, rs);}
		return qvo;
	}

	public void insertQna(QnaVO qvo) {
		
		String sql = "insert into qnareply ( subject, content, userid)  values( ? , ? , ? )";
		con = DB.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qvo.getSubject());
		    pstmt.setString(2, qvo.getContent());
		    pstmt.setString(3, qvo.getUserid());
		    pstmt.executeUpdate();  
		} catch (SQLException e) {e.printStackTrace();
		} finally {  DB.close(con, pstmt, rs);  }
		
	}

	public int getAllCount() {
		int count = 0;
		con = DB.getConnection();
		String sql = "select count(*) as cnt from qnareply";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) 
				count = rs.getInt("cnt");
		} catch (SQLException e) { e.printStackTrace();
		} finally {  DB.close(con, pstmt, rs);  }
		
		return count;
	}
	 public void deleteQna(int qseq) {
	        Connection con = null;
	        PreparedStatement pstmt = null;

	        try {
	            con = DB.getConnection();
	            String sql = "DELETE FROM qnareply WHERE qseq=?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, qseq);
	            pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DB.close(con, pstmt, rs);
	        }
	    }
}







