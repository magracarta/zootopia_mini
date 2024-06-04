package zootopia_mini.zootopia.controller.action.qna;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.QnaDao;

public class QnaDeleteAction implements Action{

	@Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int qseq = Integer.parseInt(request.getParameter("qseq"));

        QnaDao qdao = QnaDao.getInstance();

        qdao.deleteQna(qseq);

        // 게시판 목록 페이지로 리다이렉트합니다.
        response.sendRedirect("zootopia.do?command=qnaList");
    }
	
}
