package zootopia_mini.zootopia.controller.action.mypage;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MypageDao;
import zootopia_mini.zootopia.controller.dto.CommunityReplyDTO;
import zootopia_mini.zootopia.controller.dto.Contest_replyDTO;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class MyReplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser"); // 세션에서 사용자 아이디를 가져옵니다.
		
		
		if (mvo == null) {
            response.sendRedirect("zootopia.do?command=loginform");
        } else {
            MypageDao mdao = MypageDao.getInstance();
            ArrayList<Contest_replyDTO> myCntReplyList = mdao.getMyCntReplyList(mvo.getUserid());
            
            ArrayList<CommunityReplyDTO> myComReplyList = mdao.getMyComReplyList(mvo.getUserid());
            
            int myContestReplyCount = mdao.getMyContestReplyCount("contest_reply" , mvo.getUserid());
            int myCommunityReplyCount = mdao.getMyCommunityReplyCount("community_reply" , mvo.getUserid());
           
          

            

            request.setAttribute("myCntReplyList", myCntReplyList);
            request.setAttribute("myComReplyList", myComReplyList);
            request.setAttribute("myContestReplyCount", myContestReplyCount);
            request.setAttribute("myCommunityReplyCount", myCommunityReplyCount);
            
            
            request.getRequestDispatcher("mypage/myreply.jsp").forward(request, response);
        }
		
		
	}

}
