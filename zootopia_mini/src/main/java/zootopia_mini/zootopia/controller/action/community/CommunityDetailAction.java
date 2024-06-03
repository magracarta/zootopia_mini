package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class CommunityDetailAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gseq = Integer.parseInt(request.getParameter("gseq"));

        CommunityDao cdao = CommunityDao.getInstance();
        CommunityVO cvo = cdao.getCommunity(gseq); 

        request.setAttribute("communityVO", cvo);
        request.setAttribute("kind", cvo.getKind()); // kind 값 추가

        request.getRequestDispatcher("community/community_detail.jsp").forward(request, response);
    }
}