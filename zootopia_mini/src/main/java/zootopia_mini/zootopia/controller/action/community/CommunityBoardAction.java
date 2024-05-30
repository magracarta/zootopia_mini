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
	    MemberVO cvo = (MemberVO) session.getAttribute("loginUser");

	    if (cvo == null) {
	        response.sendRedirect("zootopia.do?command=main");
	    } else {
	        Paging paging = new Paging();
	        if (request.getParameter("page") != null) {
	            paging.setCurrentPage(Integer.parseInt(request.getParameter("page")));
	            session.setAttribute("page", Integer.parseInt(request.getParameter("page")));
	        } else if (session.getAttribute("page") != null) {
	            paging.setCurrentPage((Integer) session.getAttribute("page"));
	        } else {
	            paging.setCurrentPage(1);
	            session.removeAttribute("page");
	        }
	        String key = "";
	        if (request.getParameter("key") != null) {
	            key = request.getParameter("key");
	            session.setAttribute("key", key);
	        } else if (session.getAttribute("key") != null) {
	            key = (String) session.getAttribute("key");
	        } else {
	            session.removeAttribute("key");
	        }
	        CommunityDao cdao = CommunityDao.getInstance();
	        int count = cdao.getAllCount("community", "subject", key);
	        paging.setRecordAllcount(count);
	        
	        // 페이지네이션의 첫 페이지 숫자를 가져와서 속성으로 설정
	        request.setAttribute("firstnum", paging.getFirstnum());
	        
	        ArrayList<CommunityVO> communityList = cdao.communityList(paging, key);
	        request.setAttribute("paging", paging);
	        request.setAttribute("commList", communityList);
	        request.setAttribute("key", key);
	        request.getRequestDispatcher("community/community_board.jsp").forward(request, response);
	    }
	}
}