package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import zootopia_mini.zootopia.controller.dto.CommunityReplyDTO;
import zootopia_mini.zootopia.util.DB;

public class CommunityReplyDao {

	private CommunityReplyDao() {}
    private static CommunityReplyDao instance = new CommunityReplyDao();
    public static CommunityReplyDao getInstance() { return instance; }

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
	public void insertCommunityReply(CommunityReplyDTO crdto) {

		String sql = "INSERT INTO community_reply (content, Userid, gseq) VALUES (?, ?, ?) ";
		con =DB.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, crdto.getContent());
			pstmt.setString(2, crdto.getUserid());
			pstmt.setInt(3, crdto.getGseq ());
            pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
            DB.close(con, pstmt, rs);
        }
		
	}

	/*
	 * public ArrayList<CommunityReplyDTO> getCommunityReplies(int gseq) {
	 * ArrayList<CommunityReplyDTO> replies = new ArrayList<>(); String sql =
	 * "SELECT * FROM community_reply WHERE gseq = ? ORDER BY createdate DESC"; con
	 * = DB.getConnection(); try { pstmt = con.prepareStatement(sql);
	 * pstmt.setInt(1, gseq); rs = pstmt.executeQuery(); while (rs.next()) {
	 * CommunityReplyDTO reply = new CommunityReplyDTO();
	 * reply.setUserid(rs.getString("Userid")); reply.setGseq(rs.getInt("gseq"));
	 * reply.setGrseq(rs.getInt("grseq"));
	 * reply.setContent(rs.getString("content")); replies.add(reply); } } catch
	 * (SQLException e) { e.printStackTrace(); } finally { DB.close(con, pstmt, rs);
	 * } return replies; }
	 */
	
	public ArrayList<CommunityReplyDTO> getCommunityReplies(int grseq) {
        ArrayList<CommunityReplyDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DB.getConnection(); // 데이터베이스 연결을 가져옵니다.
            String sql = "SELECT r.*, m.nickname FROM community_reply r JOIN member m ON r.userid = m.userid WHERE gseq = ? ORDER BY r.createdate DESC";

            pstmt = con.prepareStatement(sql); // SQL 쿼리를 준비합니다.
            pstmt.setInt(1, grseq); // SQL 쿼리에 매개변수를 설정합니다.
            rs = pstmt.executeQuery(); // SQL 쿼리를 실행하고 결과 집합을 가져옵니다.

            // 결과 집합에서 각 레코드를 반복하여 CommunityReplyDTO 객체를 생성하고 목록에 추가합니다.
            while (rs.next()) {
                CommunityReplyDTO crdto = new CommunityReplyDTO();
                crdto.setGrseq(rs.getInt("grseq")); // grseq 설정
                crdto.setGseq(rs.getInt("gseq")); // gseq 설정
                crdto.setUserid(rs.getString("userid")); // 사용자 ID 설정
                crdto.setContent(rs.getString("content")); // 내용 설정
                crdto.setNickname(rs.getString("nickname")); // 닉네임 추가
                list.add(crdto); // 목록에 추가
            }
        } catch (SQLException e) {
            e.printStackTrace(); // SQL 예외 처리
        } finally {
            DB.close(con, pstmt, rs); // 데이터베이스 연결을 닫습니다.
        }

        return list; // 결과 목록 반환
    }

	
}
