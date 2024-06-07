package zootopia_mini.zootopia.controller.action.admin;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.action.contest.ContestAdminEnum;
import zootopia_mini.zootopia.controller.dao.AdminContestDao;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.controller.dto.ContestPetDTO;

public class AdminContestFunctionAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String function = request.getParameter("function");
		String search = request.getParameter("search");
		String category = request.getParameter("category");
		String pagenum = request.getParameter("pagenum");
		String [] cseqvalues = request.getParameterValues("cseq");
		ContestAdminEnum contest = ContestAdminEnum.CONTEST;
		AdminContestDao acdao = AdminContestDao.getInstance();
		ContestDao cdao = ContestDao.getInstance();
		
		//경로
		String filePath = session.getServletContext().getRealPath("images");
		System.out.println(filePath);
		String alert = "코딩오류 개발자에게 문의해주세요.";
		for(String cseq : cseqvalues) {
			ContestDTO cdto = null;
			 cdto =cdao.getContest(Integer.parseInt(cseq));
			String sql = "";
			//삭제 
			if(function.equals("delete")) {
				deleteMethod(cdto , cdao , filePath );
				sql =contest.deleteSQL("cseq = "+ cdto.getCseq());
				alert = "삭제가 완료되었습니다.";
			};
			if(function.equals("permit")) {
				alert = "허락이 완료되었습니다.";
				Map<String, String> permitList = new HashMap<>();
				permitList.put("useyn", "Y");
				sql = contest.updateSQL(permitList, "where cseq = "+ cdto.getCseq());
			}
			if(function.equals("reject")) {
				alert = "거절이 완료되었습니다.";
				Map<String, String> rejectList = new HashMap<>();
				rejectList.put("useyn", "N");
				sql = contest.updateSQL(rejectList, "where cseq = "+ cdto.getCseq());
			}
			if(function.equals("waiting")) {
				alert = "대기가 완료되었습니다.";
				Map<String, String> waitingList = new HashMap<>();
				waitingList.put("useyn", "W");
				sql = contest.updateSQL(waitingList, "where cseq = "+ cdto.getCseq());
			}
				
			System.out.println(sql);
			acdao.updateDeleteFunction(sql);
		}
		
		request.setAttribute("category", category);
		request.setAttribute("pagenum", pagenum);
		request.setAttribute("alert", alert);
		request.getRequestDispatcher("admin/contest/functionafter.jsp").forward(request, response);

	}
	
	
	private void deleteMethod(ContestDTO cdto , ContestDao cdao , String filePath  ) {
		cdto.setCpdList(cdao.getCpdList(cdto.getCseq()));
		//이미지 삭제
		for(ContestPetDTO cpdto : cdto.getCpdList()) {
			File removeFile = new File(filePath + File.separator +cpdto.getSaveimage());
			removeFile.delete();
		}
	}

}
