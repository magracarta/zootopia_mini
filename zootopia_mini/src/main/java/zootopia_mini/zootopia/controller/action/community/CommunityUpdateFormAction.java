package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class CommunityUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int gseq = Integer.parseInt(request.getParameter("gseq"));
		CommunityDao cdao = CommunityDao.getInstance();
		CommunityVO cvo = cdao.getCommunity(gseq);
		request.setAttribute("communityVO", cvo);

		String[] kindList = { "자랑", "잡담", "고민" };
		request.setAttribute("kindList", kindList);

		// 해당 상품의 kind 값을 가져와서 선택 목록에 표시할 값의 인덱스를 찾습니다.
		int kindIndex = cvo.getKind() - 1; // kind 값은 1부터 시작하므로 인덱스로 변환합니다.
		request.setAttribute("kindIndex", kindIndex);

		request.getRequestDispatcher("community/community_update.jsp").forward(request, response);
		
	}

}
