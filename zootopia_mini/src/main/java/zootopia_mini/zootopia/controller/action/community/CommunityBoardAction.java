package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;
import zootopia_mini.zootopia.controller.dto.MemberVO;
import zootopia_mini.zootopia.util.Paging;

public class CommunityBoardAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
	    MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
	    if (mvo == null) {
	    	response.sendRedirect("zootopia.do?command=loginForm");
	    } else {
	    	CommunityDao cdao = CommunityDao.getInstance();
	    	
	    	int page = 1;
	    	if( request.getParameter("page") != null ) {
	    		page = Integer.parseInt( request.getParameter("page") );
	    		session.setAttribute("page", page);
	    	}else if( session.getAttribute("page")!=null) {
	    		page = (Integer)session.getAttribute("page");
	    	}
	    	
	    	Paging paging = new Paging();
	    	paging.setCurrentPage(page);
	    	paging.setPagecnt(6);
			paging.setRecordrow(5);
			
			// 레코드의 전체 갯수 조회
			int count = cdao.getAllCount();    	
			paging.setPageAllcount(count);
	    		    	
			ArrayList<CommunityVO> list = cdao.selectCommunity(paging);
	    	
	    	request.setAttribute("paging", paging);
	    	request.setAttribute("commList", list); 
	    	request.getRequestDispatcher( "community/community_board.jsp").forward(request, response);
	    }

	}

}
	