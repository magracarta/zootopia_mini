package zootopia_mini.zootopia.controller.action.contest;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.AdminContestDao;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.ContestPetDTO;

public class AdminContestPetandReplyremoveDeleteAllAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cseq = request.getParameter("cseq");
		String category = request.getParameter("category");
		String pagenum = request.getParameter("pagenum");
		String beforePageNum = request.getParameter("beforePageNum");
		String [] seqs = null;
		String where = "cpseq = ";
		HttpSession session = request.getSession();
		String filePath = session.getServletContext().getRealPath("images");
		
		ContestAdminEnum table = ContestAdminEnum.CONTESTPET;
		ContestDao cdao = ContestDao.getInstance();
		AdminContestDao acdao = AdminContestDao.getInstance();
		
		if(request.getParameter("cpseq") != null) seqs = request.getParameterValues("cpseq");
		else {
			where = "crseq = ";
			seqs = request.getParameterValues("crseq");
			table = ContestAdminEnum.CONTESTREPLY;
		}
		
		
		for(String seq : seqs ) {
			if(where.equals("cpseq = ")) {
				ContestPetDTO cpdto = cdao.getContestPet(Integer.parseInt(seq));
				File removeFile = new File(filePath + File.separator +cpdto.getSaveimage());
				removeFile.delete();
			}
			String sql = table.deleteSQL(where+seq);
			acdao.updateDeleteFunction(sql);
		}
		
		request.setAttribute("cseq", cseq);
		response.sendRedirect("zootopia.do?command=adminContestDetial&cseq="+cseq+
				"&category="+category+"&beforePageNum="+beforePageNum+"&pagenum="+pagenum);

	}

}
