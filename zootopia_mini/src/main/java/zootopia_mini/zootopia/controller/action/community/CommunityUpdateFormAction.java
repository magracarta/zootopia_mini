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
	        
	        if (mvo == null) {
	            response.sendRedirect("zootopia.do?command=loginform");
	            return;
	        }
	        
	        String loginUserid = mvo.getUserid();
			
	        int gseq = Integer.parseInt(request.getParameter("gseq"));
	        CommunityDao cdao = CommunityDao.getInstance();
	        CommunityVO cvo = cdao.getCommunity(gseq);
	        
	        if (cvo.getUserid().equals(loginUserid)) {
	            request.setAttribute("communityVO", cvo);
	            request.getRequestDispatcher("community/community_update.jsp").forward(request, response);
	        } else {
	            response.sendRedirect("community_detail.jsp"); 
	        }
	    }
	}