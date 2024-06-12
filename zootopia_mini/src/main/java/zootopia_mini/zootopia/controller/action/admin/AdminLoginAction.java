package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.AdminDao;
import zootopia_mini.zootopia.controller.dto.AdminVO;

public class AdminLoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String adminid = request.getParameter("adminid");
		String pwd = request.getParameter("pwd");
		
		AdminDao adao = AdminDao.getInstance();
		AdminVO avo = adao.getAdmin(adminid);
		
		String url = "admin/adminLogin.jsp";
		if(avo == null)
			request.setAttribute("message1", "존재하지 않는 아이디입니다");
		else if(!avo.getPwd().equals(pwd))
			request.setAttribute("message1", "패스워드가 일치하지 않습니다");
		else if(avo.getPwd().equals(pwd)) {
			HttpSession session = request.getSession();
			session.setAttribute("adminUser", avo);
			url = "zootopia.do?command=adminmain";
		}
		request.getRequestDispatcher(url).forward(request, response);
		
	}
}
