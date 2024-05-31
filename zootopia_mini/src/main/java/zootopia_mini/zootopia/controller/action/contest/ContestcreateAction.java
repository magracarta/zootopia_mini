package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class ContestcreateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int lastdate = Integer.parseInt(request.getParameter("lastdate"));
		int length = Integer.parseInt(request.getParameter("length"));
		Date date = new Date();
		
		//날짜 변경
		Calendar cd = Calendar.getInstance();
		cd.setTime(date);
		cd.add(Calendar.DATE, lastdate);
		Timestamp timestamp = new Timestamp(cd.getTimeInMillis());
		
		
		ContestDao cdao = ContestDao.getInstance();
		//추가
		ContestDTO cdto = new ContestDTO( mvo.getUserid(), subject, content,
					length,timestamp);
		cdto.setNickname(mvo.getNickname());
		cdao.insertContest(cdto);
		
		
		response.sendRedirect("zootopia.do?command=contestBoard&search=");

	}

}
