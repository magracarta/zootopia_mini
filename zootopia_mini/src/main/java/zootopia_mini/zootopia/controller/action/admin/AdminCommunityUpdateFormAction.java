package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.AdminVO;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class AdminCommunityUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		AdminVO avo = (AdminVO) session.getAttribute("adminUser");
        
        // 로그인된 사용자가 없다면 로그인 페이지로 리다이렉트
        if (avo == null) {
            response.sendRedirect("zootopia.do?command=admin");
            return;
        }
        
		
        int gseq = Integer.parseInt(request.getParameter("gseq"));
        CommunityDao cdao = CommunityDao.getInstance();
        CommunityVO cvo = cdao.getCommunity(gseq);
        
        request.setAttribute("communityVO", cvo);
        request.getRequestDispatcher("admin/community/communityUpdate.jsp").forward(request, response);
		
	}

}
