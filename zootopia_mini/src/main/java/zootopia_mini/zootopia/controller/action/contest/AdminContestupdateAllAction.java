package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;

public class AdminContestupdateAllAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		String category = request.getParameter("category");
		String beforePageNum = request.getParameter("beforePageNum");
		ContestDao cdao = ContestDao.getInstance();
		ContestDTO cdto = cdao.getContest(cseq);
		
		cdto.setSubject(request.getParameter("subject"));
		cdto.setContent(request.getParameter("content"));
		//날짜 변경
			
		if(!request.getParameter("lastdate").equals("none")) {
			Calendar cd = Calendar.getInstance();
			Date date =new Date();
			cd.setTime(date);
			cd.add(Calendar.DATE, Integer.parseInt(request.getParameter("lastdate")));
			Timestamp timestamp = new Timestamp(cd.getTimeInMillis());
			cdto.setLastdate(timestamp);
		}
		if(!request.getParameter("length").equals("none")) cdto.setPcnt(Integer.parseInt(request.getParameter("length")));
		
		
		cdao.updateContest(cdto);
		
		response.sendRedirect("zootopia.do?command=adminContestDetial&cseq="+cseq+"&beforePageNum="+beforePageNum
					+"&category"+category);
	}

}
