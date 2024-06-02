package zootopia_mini.zootopia.controller.action.contest;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dao.MemberDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.controller.dto.ContestPetDTO;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class InsertContestPetAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = request.getParameter("userid");
		String index = request.getParameter("index");
		String cseq = request.getParameter("cseq");
		MemberDao mdao = MemberDao.getInstance();
		MemberVO mvo = mdao.getMember(userid);
		
		ContestDao cdao = ContestDao.getInstance();
		
		ContestDTO cdto =cdao.getContest(Integer.parseInt(cseq));	
		cdto.setCpdList(cdao.getCpdList(Integer.parseInt(cseq)));
		int areadyexist = cdao.getCpdList(userid , cseq);
		request.setAttribute("cseq", cseq);
		request.setAttribute("index", index);
		
		if(areadyexist == 1) { //실패함
			request.setAttribute("areadyexist",  1);
			request.getRequestDispatcher("contest/contestDetail.jsp").forward(request, response);
		}else if( cdto.getPcnt() <= cdto.getCpdList().size() ) {
			request.setAttribute("areadyexist",  2);
			request.getRequestDispatcher("contest/contestDetail.jsp").forward(request, response);
		}else {//성공함
			
			String content = request.getParameter("content");
			ContestPetDTO cpdto = new ContestPetDTO();
			cpdto.setUserid(userid);
			cpdto.setCseq(Integer.parseInt(cseq));
			cpdto.setContent(content);
			
			
			String filepath = session.getServletContext().getRealPath("images");
			System.out.println(filepath);
			File file = new File(filepath);
			if(!file.exists()) file.mkdir();
			String fileName  = "";
			for(Part part : request.getParts()) {
				fileName  = "";
				for(String partcontent : part.getHeader("content-disposition").split(";")) {
					if(partcontent.trim().startsWith("filename")) {
						fileName = partcontent.substring(partcontent.indexOf("=")+2 , partcontent.length()-1);
					}
					if(! fileName.isBlank()) {
						String saveimage;
						Calendar cd = Calendar.getInstance();
						saveimage = fileName.substring(0,fileName.indexOf("."))+cd.getTimeInMillis()+fileName.substring(fileName.indexOf("."));
						part.write(filepath+File.separator+saveimage);
						cpdto.setImage(fileName);
						cpdto.setSaveimage(saveimage);
					}
				}
			}
			
			cdao.insertContestPet(cpdto);
			
			
			
			
			request.getRequestDispatcher("zootopia.do?command=contestDetail").forward(request, response);
		}

	}

}
