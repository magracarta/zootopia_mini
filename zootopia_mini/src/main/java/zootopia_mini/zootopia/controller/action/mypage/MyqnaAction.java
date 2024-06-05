package zootopia_mini.zootopia.controller.action.mypage;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MypageDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;
import zootopia_mini.zootopia.controller.dto.QnaVO;
import zootopia_mini.zootopia.util.Paging;

public class MyqnaAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		String currentPage = request.getParameter("pagenum");
		MypageDao mdao = MypageDao.getInstance();

		if(mvo == null)
		{
			response.sendRedirect("zootopia.do?command=loginform");
			return;
		} else 
		{
			int myQnaAllCount = mdao.getAllCount("qnareply" , mvo.getUserid());
			
			Paging page = new Paging();
			
			if(currentPage != null) page.setCurrentPage(Integer.parseInt(currentPage));
			else if(session.getAttribute("paging") != null ) page = (Paging)session.getAttribute("paging");
			else if(request.getParameter("paging") == null && session.getAttribute("paging")== null) page.setCurrentPage(1);
			
			page.setRecordAllcount(myQnaAllCount);
			
			ArrayList<QnaVO> qnaList = mdao.getMyQnaList(page, mvo.getUserid());
			
			request.setAttribute("qnaList", qnaList);
			System.out.println(qnaList.toString());
			session.setAttribute("paging", page);
			request.setAttribute("allcnt", myQnaAllCount);
			
			request.getRequestDispatcher("mypage/myqna.jsp").forward(request, response);
		}
	}

}
