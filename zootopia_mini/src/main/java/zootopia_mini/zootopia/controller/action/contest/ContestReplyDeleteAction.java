package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.Contest_replyDTO;

public class ContestReplyDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		int crseq = Integer.parseInt(request.getParameter("crseq"));
		String index = request.getParameter("index");
		
		ContestDao cdao = ContestDao.getInstance();
		cdao.deleteContestReply(crseq);
		
		request.setAttribute("replyDelete", "replyDelete");
		request.setAttribute("cseq", cseq);
		request.setAttribute("index", index);
		request.getRequestDispatcher("zootopia.do?command=contestDetail").forward(request, response);

	}

}
