package zootopia_mini.zootopia.controller.action.mypage;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MypageDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;
import zootopia_mini.zootopia.controller.dto.MemberVO;
import zootopia_mini.zootopia.util.Paging;

public class MywriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String currentPage = request.getParameter("pagenum");
		String search = request.getParameter("search");
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		MypageDao mdao = MypageDao.getInstance();
		
		
		
		if(mvo == null)
		{
			response.sendRedirect("zootopia.do?command=loginform");
		} else {
			int myWriteAllCount;
			if (search == null || search.trim().isEmpty()) {
                myWriteAllCount = mdao.getAllCount("community", mvo.getUserid());
            } else {
                myWriteAllCount = mdao.getAllCountWithSearch("community", mvo.getUserid(), search); // 검색어를 포함한 카운트 조회 메서드 호출
            }
			
			Paging page = new Paging();
			
			if(currentPage != null) page.setCurrentPage(Integer.parseInt(currentPage));
			else if(session.getAttribute("paging") != null ) page = (Paging)session.getAttribute("paging");
			else if(request.getParameter("paging") == null && session.getAttribute("paging")== null) page.setCurrentPage(1);
			
			page.setRecordAllcount(myWriteAllCount);
			
			ArrayList<CommunityVO> communityList;
			if (search == null || search.trim().isEmpty()) {
                communityList = mdao.getMyCommunityList(page, mvo.getUserid());
            } else {
                communityList = mdao.getMyCommunityListWithSearch(page, mvo.getUserid(), search); // 검색어를 포함한 목록 조회 메서드 호출
            }
			
			request.setAttribute("communityList", communityList);
			session.setAttribute("paging", page);
			request.setAttribute("allcnt", myWriteAllCount);
			request.setAttribute("search", search);
			
			request.getRequestDispatcher("mypage/mywrite.jsp").forward(request, response);
		}
		
		
	}

}
