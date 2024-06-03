package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;

public class CommunityRecommandsAction implements Action {

	@Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gseq = Integer.parseInt(request.getParameter("gseq"));

        // DAO 호출하여 추천 수 증가
        CommunityDao cdao = CommunityDao.getInstance();
        cdao.updateRecommendations(gseq);

        // 추천 버튼을 누른 후 다시 게시글 상세 페이지로 이동
        response.sendRedirect("zootopia.do?command=communityDetail&gseq=" + gseq);
    }
}