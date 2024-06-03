package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;

public class CommunityViewCountAction implements Action {

	@Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 게시글 번호 받기
        int gseq = Integer.parseInt(request.getParameter("gseq"));
        
        // DAO를 통해 조회수 증가 메서드 호출
        CommunityDao cdao = CommunityDao.getInstance();
        cdao.increaseViewCount(gseq);
        
        // 클라이언트에게 응답
        response.getWriter().write("View count increased successfully for post with gseq: " + gseq);
    }

}
