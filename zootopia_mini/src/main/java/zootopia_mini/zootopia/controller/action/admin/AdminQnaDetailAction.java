package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.QnaDao;
import zootopia_mini.zootopia.controller.dto.QnaVO;

public class AdminQnaDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int qseq = Integer.parseInt( request.getParameter("qseq") );
		QnaDao qdao = QnaDao.getInstance();
		QnaVO qvo = qdao.getQna(qseq);
		
		request.setAttribute("qnaVO", qvo);
		request.getRequestDispatcher("admin/qna/qnaDetail.jsp").forward(request, response);
		
	}

}
