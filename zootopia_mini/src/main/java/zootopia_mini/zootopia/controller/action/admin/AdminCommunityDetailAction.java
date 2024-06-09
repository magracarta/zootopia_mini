package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class AdminCommunityDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
        int gseq = Integer.parseInt(request.getParameter("gseq"));

        CommunityDao cdao = CommunityDao.getInstance();
        CommunityVO cvo = cdao.getCommunity(gseq); 

        request.setAttribute("communityVO", cvo);
        request.setAttribute("kind", cvo.getKind()); // kind 값 추가

        request.getRequestDispatcher("admin/community/communityDetail.jsp").forward(request, response);
		
	}

}
