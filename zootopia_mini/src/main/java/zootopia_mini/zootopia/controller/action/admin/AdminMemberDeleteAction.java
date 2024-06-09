package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.AdminDao;

public class AdminMemberDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userid = request.getParameter("userid");
		System.out.println("Deleting user with id: " + userid);
		AdminDao adao = AdminDao.getInstance();
		adao.deleteMember(userid);
		response.sendRedirect("zootopia.do?command=adminmemberlist");
		
	}

}
