package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;

public class CommunityDeleteAction implements Action {

	@Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gseq = Integer.parseInt(request.getParameter("gseq"));

        CommunityDao cdao = CommunityDao.getInstance();

        cdao.deleteCommunity(gseq);

        // 게시판 목록 페이지로 리다이렉트합니다.
        response.sendRedirect("zootopia.do?command=communityBoard");
    }

}
