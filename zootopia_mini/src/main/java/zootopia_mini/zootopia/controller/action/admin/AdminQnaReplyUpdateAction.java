package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.AdminDao;

public class AdminQnaReplyUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String qseqParam = request.getParameter("qseq");
		if (qseqParam != null && !qseqParam.isEmpty()) {
		    int qseq = Integer.parseInt(qseqParam);
		    String reply = request.getParameter("reply");
		    AdminDao adao = AdminDao.getInstance();
		    adao.qnaReplyUpdate(qseq, reply);
		    response.sendRedirect("zootopia.do?command=adminqnadetail&qseq=" + qseq);
		} else {
		    // qseq가 null이거나 빈 문자열인 경우 처리할 내용을 여기에 작성합니다.
		    // 예를 들어, 오류 메시지를 출력하거나 적절한 조치를 취할 수 있습니다.
		    System.out.println("qseq 값이 null이거나 빈 문자열입니다."); // 오류 메시지 출력 예시
		    // 적절한 조치를 취하세요.
		}
		
	}

}
