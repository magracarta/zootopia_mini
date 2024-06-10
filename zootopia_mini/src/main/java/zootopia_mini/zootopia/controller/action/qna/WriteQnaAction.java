package zootopia_mini.zootopia.controller.action.qna;

import java.io.IOException;

import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.QnaDao;
import zootopia_mini.zootopia.controller.dto.QnaVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteQnaAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		QnaVO qvo = new QnaVO();
		qvo.setCategory( Integer.parseInt(request.getParameter("category")) );
		qvo.setUserid( request.getParameter("userid") );
		qvo.setSubject( request.getParameter("subject") );
		qvo.setContent( request.getParameter("content") );
		qvo.setCategory(Integer.parseInt(request.getParameter("category")));	
		
		QnaDao qdao = QnaDao.getInstance();
		qdao.insertQna( qvo );
		
		response.sendRedirect("zootopia.do?command=qnaList");
	}

}
