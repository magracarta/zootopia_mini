package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.AdminDao;

public class AdminCommunityDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String gseq = request.getParameter("gseq");
		System.out.println("Deleting user with gseq: " + gseq);
		AdminDao adao = AdminDao.getInstance();
		adao.deleteCommunity(gseq);
		response.sendRedirect("zootopia.do?command=admincommunitylist");
		
	}

}
