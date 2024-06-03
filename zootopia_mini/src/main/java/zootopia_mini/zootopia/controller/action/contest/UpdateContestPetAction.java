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
import zootopia_mini.zootopia.controller.dto.ContestPetDTO;

public class UpdateContestPetAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		int cpseq = Integer.parseInt(request.getParameter("cpseq"));
		int index = Integer.parseInt(request.getParameter("index"));
		
		String content = request.getParameter("content");
		
		ContestDao cdao = ContestDao.getInstance();
		ContestPetDTO cpdto = cdao.getContestPet(cpseq);
		
		
		cpdto.setContent(content);
		
		HttpSession session = request.getSession();
		String fileLink = session.getServletContext().getRealPath("images");
		
		System.out.println(fileLink);
		
		File file = new File(fileLink);
		if(!file.exists()) file.mkdir();
		
		
		String imagename = "";
		for(Part part : request.getParts()) {
			for(String context : part.getHeader("content-disposition").split(";")) {
				imagename = "";
				if(context.trim().startsWith("filename")) {
					imagename = context.substring(context.indexOf("=")+2, context.length()-1);
				}
				String saveImage ="";
				if(!imagename.isBlank()) {

					File before = new File(fileLink+File.separator+cpdto.getSaveimage());
					before.delete();
					
					Calendar cd = Calendar.getInstance();
					saveImage = imagename.substring(0,imagename.indexOf("."))+cd.getTimeInMillis()+imagename.substring(imagename.indexOf("."));
					
					part.write(fileLink+File.separator+saveImage);
					
					cpdto.setImage(imagename);
					cpdto.setSaveimage(saveImage);
				}
			}
		}
		
		
		System.out.println(cpdto.getSaveimage());
		cdao.updateContestPet(cpdto);
		
		response.sendRedirect("zootopia.do?command=contestDetail&cseq="+cseq+"&index="+index);

	}

}
