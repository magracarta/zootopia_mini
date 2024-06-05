package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dao.MemberDao;
import zootopia_mini.zootopia.controller.dto.ContestPetDTO;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class ReccomnadPetAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDao mdao = MemberDao.getInstance();
		MemberVO mvo =(MemberVO)session.getAttribute("loginUser");
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		int cpseq = Integer.parseInt(request.getParameter("cpseq"));
		String index =request.getParameter("index");
		
		String user = "user";
		String url ="contest/contestcount.jsp";
		if(mvo == null) {
			request.setAttribute("cseq", cseq);
			request.setAttribute("index", index);
			user = "no";
			 url ="zootopia.do?command=contestDetail";
		}else {
			
			
			
			ContestDao cdao = ContestDao.getInstance();
			ContestPetDTO cdto = cdao.getContestPet(cpseq);
			
			cdao.addRecommend(cdto.getRecommends()+1 , cdto.getCpseq());
			
			
		}
		request.setAttribute("user", user);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
