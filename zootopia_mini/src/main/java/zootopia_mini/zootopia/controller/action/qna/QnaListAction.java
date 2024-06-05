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
	    
	    	QnaDao qdao = QnaDao.getInstance();
	    	

            int page = 1;
            if (request.getParameter("pagenum") != null) {
                page = Integer.parseInt(request.getParameter("pagenum"));
                session.setAttribute("pagenum", page);
            } else if (session.getAttribute("pagenum") != null) {
                page = (Integer) session.getAttribute("pagenum");
            }
	    	
            Paging paging = new Paging();
            paging.setCurrentPage(page);
            paging.setPagecnt(10);
            paging.setRecordrow(10);

            // 레코드의 전체 갯수 조회
            int count = qdao.getAllCount();
            paging.setRecordAllcount(count);
	    		    	
	    	ArrayList<QnaVO> list = qdao.selectQna(paging);
	    	
	    	request.setAttribute("paging", paging);
	    	request.setAttribute("qnaList", list);
	    	request.getRequestDispatcher( "qna/qnaList.jsp").forward(request, response);
	    }

	

}
