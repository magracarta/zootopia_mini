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

public class CommunityUpdateFormAction implements Action {

	 @Override
	    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
	        
	        // 로그인된 사용자가 없다면 로그인 페이지로 리다이렉트
	        if (mvo == null) {
	            response.sendRedirect("zootopia.do?command=loginForm");
	            return;
	        }
	        
	        String loginUserid = mvo.getUserid();
			
	        int gseq = Integer.parseInt(request.getParameter("gseq"));
	        CommunityDao cdao = CommunityDao.getInstance();
	        CommunityVO cvo = cdao.getCommunity(gseq);
	        
	        // 작성자의 아이디와 로그인한 사용자의 아이디가 일치하는지 확인
	        if (cvo.getUserid().equals(loginUserid)) {
	            request.setAttribute("communityVO", cvo);
	            request.getRequestDispatcher("community/community_update.jsp").forward(request, response);
	        } else {
	            // 작성자의 아이디와 로그인한 사용자의 아이디가 일치하지 않으면 오류 페이지로 리다이렉트 또는 다른 처리 수행
	            response.sendRedirect("community_detail.jsp"); 
	        }
	    }
	}