package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class FindCommunityAction implements Action {

	@Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subject = request.getParameter("search");
        if(subject != null && !subject.isEmpty()) {
            CommunityDao cdao = CommunityDao.getInstance();
            ArrayList<CommunityVO> list = cdao.findcontent(subject);
            request.setAttribute("search", subject);
            request.setAttribute("subjectList", list);
        }
        request.getRequestDispatcher("community/community_board.jsp").forward(request, response);
    }
}
