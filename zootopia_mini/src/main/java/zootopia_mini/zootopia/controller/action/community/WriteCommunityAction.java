package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class WriteCommunityAction implements Action {
    
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	 HttpSession session = request.getSession(false); 
    	    if (session == null || session.getAttribute("loginUser") == null) {
    	        response.sendRedirect("loginform.jsp");
    	        return;
    	    }
    	
    	MemberVO mvo = (MemberVO) request.getSession().getAttribute("loginUser");
    	String userId = mvo.getUserid();
        CommunityVO cvo = new CommunityVO();
        cvo.setUserid(userId); 
        cvo.setSubject(request.getParameter("subject")); 
        cvo.setContent(request.getParameter("content")); 
        cvo.setKind(Integer.parseInt(request.getParameter("kind"))); 
        
		CommunityDao cdao = CommunityDao.getInstance();
        cdao.insertCommunity(cvo);
        
        response.sendRedirect("zootopia.do?command=communityBoard");
    }
}

