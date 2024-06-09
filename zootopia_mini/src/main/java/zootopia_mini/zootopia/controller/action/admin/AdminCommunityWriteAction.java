package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.AdminVO;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class AdminCommunityWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false); // 세션이 없는 경우 null을 반환
	    if (session == null || session.getAttribute("adminUser") == null) {
	        response.sendRedirect("adminLogin.jsp"); // 로그인 페이지로 리다이렉트
	        return;
	    }
	
	    AdminVO avo = (AdminVO) request.getSession().getAttribute("adminUser");
	    String adminid = avo.getAdminid();
	    // CommunityVO 객체 생성
	    CommunityVO cvo = new CommunityVO();
	    cvo.setUserid(adminid); // 가져온 아이디를 CommunityVO 객체에 설정
	    cvo.setSubject(request.getParameter("subject")); 
	    cvo.setContent(request.getParameter("content")); 
	    cvo.setKind(Integer.parseInt(request.getParameter("kind"))); 
    
	    CommunityDao cdao = CommunityDao.getInstance();
	    cdao.admininsertCommunity(cvo, request);
    
	    // 글 작성 후에는 커뮤니티 게시판으로 redirect 합니다.
	    response.sendRedirect("zootopia.do?command=admincommunitylist");
		
	}

}
