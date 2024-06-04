package zootopia_mini.zootopia.controller.action.main;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;
import zootopia_mini.zootopia.controller.dto.ContestDTO;

public class MainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ContestDao cdao = ContestDao.getInstance();
		ArrayList<ContestDTO> contestList = cdao.getContestThirdList();
		
		for(ContestDTO cdto : contestList) {
			cdto.setCpdList(cdao.getMainCpdList(cdto.getCseq()));
		}
		
		
		
		ArrayList<CommunityVO> communotyList  = cdao.getCommunityMainList();
		
		
		request.setAttribute("contestList", contestList);
		request.setAttribute("commList", communotyList);
		request.getRequestDispatcher("/main.jsp").forward(request, response);
	}

}
