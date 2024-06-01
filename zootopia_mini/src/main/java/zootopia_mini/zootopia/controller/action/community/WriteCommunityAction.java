package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class WriteCommunityAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

				CommunityVO cvo = new CommunityVO();
				cvo.setUserid( request.getParameter("userid") );
				cvo.setSubject( request.getParameter("subject") );
				cvo.setContent( request.getParameter("content") );
				
				CommunityDao cdao = CommunityDao.getInstance();
				cdao.insertCommunity( cvo );
				
				response.sendRedirect("zootopia.do?command=communityBoard");
			}
		
	}

