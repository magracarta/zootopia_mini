package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class CommunityBoardAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        ArrayList<CommunityVO> posts = CommunityDao.getInstance().getAllCommunity();
        request.setAttribute("posts", posts);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/community/community_board.jsp");
        dispatcher.forward(request, response);
    }
}