package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class CommunityRecommandsAction implements Action {

	 @Override
	    public void execute(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        int gseq = Integer.parseInt(request.getParameter("gseq"));

	        CommunityDao cdao = CommunityDao.getInstance();

	        cdao.updateRecommendations(gseq);

	        CommunityVO community = cdao.getCommunity(gseq);
	        int newRecommends = community.getRecommands();

	        response.setContentType("application/json; character-set='utf-8'");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write("{\"recommends\": " + newRecommends + "}");
	    }
}