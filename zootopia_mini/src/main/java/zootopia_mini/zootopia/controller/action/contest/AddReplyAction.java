package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;
import java.sql.Timestamp;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.Contest_replyDTO;

public class AddReplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String content = request.getParameter("content");
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		String index = request.getParameter("index");

		
		ContestDao cdao = ContestDao.getInstance();
		Contest_replyDTO crdto = new Contest_replyDTO(cseq, userid , content);
		cdao.insertContestReply(crdto);
		
		response.sendRedirect("zootopia.do?command=contestDetail&cseq="+cseq+"&index="+index);
	}

}
