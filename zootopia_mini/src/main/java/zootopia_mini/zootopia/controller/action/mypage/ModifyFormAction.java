package zootopia_mini.zootopia.controller.action.mypage;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MypageDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class ModifyFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		request.getRequestDispatcher("mypage/modify.jsp").forward(request, response);
	}
}
