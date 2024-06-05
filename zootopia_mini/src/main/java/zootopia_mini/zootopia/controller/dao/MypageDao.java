package zootopia_mini.zootopia.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import zootopia_mini.zootopia.controller.dto.CommunityVO;
import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.controller.dto.ContestPetDTO;
import zootopia_mini.zootopia.controller.dto.MemberVO;
import zootopia_mini.zootopia.controller.dto.QnaVO;
import zootopia_mini.zootopia.util.DB;
import zootopia_mini.zootopia.util.Paging;

public class MypageDao {
	private MypageDao() {}
	private static MypageDao ist = new MypageDao();
	public static MypageDao getInstance() { return ist; }
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public void updateMember(MemberVO mvo1) {
		
		System.out.println("DB에 저장되는 파일명: " + mvo1.getSaveimage());
		con = DB.getConnection();
		String sql = "update member set pwd=?, name=?, email=? , "
				+ " phone=?, petname=?, kind=? , petgender=?, "
				+ " image=?, saveimage=? , nickname = ?  where userid = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo1.getPwd());
			pstmt.setString(2, mvo1.getName());
			pstmt.setString(3, mvo1.getEmail());
			pstmt.setString(4, mvo1.getPhone());
			pstmt.setString(5, mvo1.getPetname());
			pstmt.setString(6, mvo1.getKind());
			pstmt.setString(7, mvo1.getPetgender());
			pstmt.setString(8, mvo1.getImage());
			pstmt.setString(9, mvo1.getSaveimage());
			pstmt.setString(10, mvo1.getNickname());
			pstmt.setString(11, mvo1.getUserid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { DB.close(con, pstmt, rs);
		}
	 
	}


	public void deleteMember(String userid) {
		con = DB.getConnection();
		String sql = "update member set useyn='N' where userid = ? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { DB.close(con, pstmt, rs);
		}
	}


	public ArrayList<ContestDTO> getMyContestList(String userId) {
		ArrayList<ContestDTO> contestList = new ArrayList<>();
		String sql = "select * from contest where userid = ? ";
		con = DB.getConnection();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId); // 사용자 아이디를 매개변수로 설정합니다.
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ContestDTO cdto = new ContestDTO();
				cdto.setSubject(rs.getString("subject"));
				cdto.setContent(rs.getString("content"));
				
				System.out.println(cdto.getSubject());
				System.out.println(cdto.getContent());
				contestList.add(cdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { DB.close(con, pstmt, rs);}
		
		return contestList;
		}


	public ArrayList<ContestPetDTO> mypetList(String userid) {
		ArrayList<ContestPetDTO> list = new ArrayList<ContestPetDTO>();
		String sql = "select * from contestpetiv_view where userid = ? ";
		con = DB.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ContestPetDTO cpdto = new ContestPetDTO();
				cpdto.setCseq(rs.getInt("cseq"));
				list.add(cpdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally { DB.close(con, pstmt, rs);}
		
		return list;
	}


	public ContestDTO getMypetContest(int cseq) {
		ContestDTO cdto = null;
		String sql = "select * from contestpet_view where cseq = ? ";
		con = DB.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//int cseq, String userid, String subject, String content, 
				//Timestamp createdate , Timestamp lastdate, int cnt,
				//String useyn, int pcnt, int allpcnt, String nickname
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
		}finally { DB.close(con, pstmt, rs);}
		return cdto;
	}


	public ArrayList<ContestDTO> getClosedContests(String userid) {
		ArrayList<ContestDTO> list = new ArrayList<ContestDTO>();
		String sql = "select * from contest where userid = ? and lastdate < now()";
		con = DB.getConnection();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ContestDTO contest = new ContestDTO();
                contest.setCseq(rs.getInt("cseq"));
                contest.setUserid(rs.getString("userid"));
                contest.setUseyn(rs.getString("useyn"));
                contest.setSubject(rs.getString("subject"));
                contest.setContent(rs.getString("content"));
                contest.setLastdate(rs.getTimestamp("lastdate"));
                list.add(contest);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { DB.close(con, pstmt, rs);}
		
		return list;
	}
	
	public ArrayList<ContestDTO> getActiveContests(String userid) {
        ArrayList<ContestDTO> list = new ArrayList<ContestDTO>();
        String sql = "SELECT * FROM contest WHERE userid = ? AND lastdate >= NOW()";
        con = DB.getConnection();
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ContestDTO contest = new ContestDTO();
                contest.setCseq(rs.getInt("cseq"));
                contest.setUserid(rs.getString("userid"));
                contest.setUseyn(rs.getString("useyn"));
                contest.setSubject(rs.getString("subject"));
                contest.setContent(rs.getString("content"));
                contest.setLastdate(rs.getTimestamp("lastdate"));
                list.add(contest);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DB.close(con, pstmt, rs);
        }
        return list;
	}


	public ArrayList<CommunityVO> getMyCommunityList(Paging page, String userid) {
		ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
		String sql = "select * from community where userid = ? order by gseq desc limit ? offset ?";
		con = DB.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, page.getRecordrow());
			pstmt.setInt(3, page.getOffsetnum());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommunityVO community = new CommunityVO();
				community.setGseq(rs.getInt("gseq"));
				community.setVcount(rs.getInt("vcount"));
				community.setUserid(rs.getString("userid"));
				community.setSubject(rs.getString("subject"));
				community.setContent(rs.getString("content"));
				community.setRecommands(rs.getInt("recommands"));
				community.setKind(rs.getInt("kind"));
				community.setCreatedate(rs.getTimestamp("createdate"));
				list.add(community);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
            DB.close(con, pstmt, rs);
        }
		
		return list;
	}
	
	public ArrayList<QnaVO> getMyQnaList(Paging page, String userid) {
		ArrayList<QnaVO> list = new ArrayList<QnaVO>();
		String sql = "select * from qnareply where userid = ? order by qseq desc limit ? offset ?";
		con = DB.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, page.getRecordrow());
			pstmt.setInt(3, page.getOffsetnum());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QnaVO qna = new QnaVO();
				qna.setQseq(rs.getInt("qseq"));
				qna.setUserid(rs.getString("userid"));
				qna.setSubject(rs.getString("subject"));
				qna.setContent(rs.getString("content"));
				qna.setReply(rs.getString("reply"));
				qna.setCreatedate(rs.getTimestamp("createdate"));
				list.add(qna);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
            DB.close(con, pstmt, rs);
        }
		
		return list;
	}


	public int getAllCount(String table, String userid) {
		int count = 0;
		con = DB.getConnection();
		
		String sql = "select count(*) as gseq from "+table + " where userid = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) count = rs.getInt("gseq");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(con, pstmt, rs);
		}
		
		
		return count;
	}
}

