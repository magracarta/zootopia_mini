package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.AdminDao;

public class AdminCommunityReplyDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String grseq = request.getParameter("grseq");
		AdminDao adao = AdminDao.getInstance();
		adao.deleteCommunityReply(grseq);
		response.sendRedirect("zootopia.do?command=admincommunitydetail");
		
	}

}
