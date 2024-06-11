package zootopia_mini.zootopia.controller.action.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MemberDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String referrer = request.getParameter("referrer");
		String command = request.getParameter("command");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		MemberDao mdao = MemberDao.getInstance();
		MemberVO mvo = mdao.getMember(userid);
		
		String url = "member/loginForm.jsp";
		System.out.println("referrer :"+referrer);
		if(mvo==null) {
			request.setAttribute("message", "아이디가 없습니다");
		}else if(!mvo.getPwd().equals(pwd)) {
			request.setAttribute("message", "패스워드가 틀립니다");
		}else if(mvo.getUseyn().equals("N")) {
			request.setAttribute("message", "해당 계정은 휴면상태이거나 탈퇴상태입니다. 관리자에게 문의하세요");
		}else if(mvo.getPwd().equals(pwd)) {
			url = "zootopia.do?command=main";
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mvo);
			if( referrer != null && !referrer.contains("logout") && !referrer.contains("login")) url =(referrer);
		}else {
			request.setAttribute("message", "관리자에게 문의하세요");
		}
		
	
		 request.getRequestDispatcher(url).forward(request, response);
	
		
	}

}
