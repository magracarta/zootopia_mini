package zootopia_mini.zootopia.controller.action.communityreply;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityReplyDao;
import zootopia_mini.zootopia.controller.dto.CommunityReplyDTO;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class WriteCommunityReplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   	 	HttpSession session = request.getSession(false); 
	    if (session == null || session.getAttribute("loginUser") == null) {
	        response.sendRedirect("loginform.jsp"); // 로그인 페이지로 리다이렉트
	        return;
	    }
	
	    MemberVO mvo = (MemberVO) request.getSession().getAttribute("loginUser");
    	String userId = mvo.getUserid();
    	
    	CommunityReplyDTO crdto = new CommunityReplyDTO();
    	crdto.setContent(request.getParameter("content"));
    	crdto.setUserid(request.getParameter("userId"));
    	crdto.setGseq(Integer.parseInt(request.getParameter("gseq")));

    	CommunityReplyDao crdao = CommunityReplyDao.getInstance();
    	crdao.insertCommunityReply(crdto);
	    
    	response.sendRedirect("zootopia.do?command=communityDetail");
    	
	}

}
