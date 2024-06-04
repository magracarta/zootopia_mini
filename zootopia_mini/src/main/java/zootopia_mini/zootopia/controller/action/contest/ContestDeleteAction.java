package zootopia_mini.zootopia.controller.action.contest;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.controller.dto.ContestPetDTO;

public class ContestDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		HttpSession session = request.getSession();
		
		
		ContestDao cdao = ContestDao.getInstance();
		
		
		
		
		//딜리트 모든 펫이미지 && 모든 펫 번호
		ContestDTO cdto = new ContestDTO();
		cdto.setCseq(cseq);
		cdto.setCpdList(cdao.getCpdList(cseq));
		
		//경로 가져오기
		String realPath =  session.getServletContext().getRealPath("images");
		
		System.out.println(cdto.getCpdList().size());
		for(ContestPetDTO cpdto : cdto.getCpdList()) {
			File removeFile = new File(realPath+File.separator+cpdto.getSaveimage());
			removeFile.delete();
		}
		

		int result = cdao.deleteContest(cseq);
		
		String url = "contest/contest_board.jsp";
		if(result == 0) url = "zootopia.do?command=contestDetail&delete=no&cseq="+cseq;
		
		
		
		request.getRequestDispatcher(url).forward(request, response);
		

	}

}
