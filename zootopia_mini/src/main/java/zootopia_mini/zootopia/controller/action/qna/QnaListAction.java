package zootopia_mini.zootopia.controller.action.qna;

import java.io.IOException;
import java.util.ArrayList;

import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.QnaDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;
import zootopia_mini.zootopia.controller.dto.QnaVO;
import zootopia_mini.zootopia.util.Paging;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class QnaListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
	    MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
	    if (mvo == null) {
	    	response.sendRedirect("zootopia.do?command=loginform");
	    } else {
	    	QnaDao qdao = QnaDao.getInstance();
	    	
	    	int page = 1;
	    	if( request.getParameter("page") != null ) {
	    		page = Integer.parseInt( request.getParameter("page") );
	    		session.setAttribute("page", page);
	    	}else if( session.getAttribute("page")!=null) {
	    		page = (Integer)session.getAttribute("page");
	    	}
	    	
	    	Paging paging = new Paging();
	    	paging.setPage(page);
	    	paging.setDisplayPage(5);
			paging.setDisplayRow(5);
			
			// 레코드의 전체 갯수 조회
			int count = qdao.getAllCount();    	
			paging.setTotalCount(count);
	    		    	
	    	ArrayList<QnaVO> list = qdao.selectQna(paging);
	    	
	    	request.setAttribute("paging", paging);
	    	request.setAttribute("qnaList", list);
	    	request.getRequestDispatcher( "qna/qnaList.jsp").forward(request, response);
	    }

	}

}
