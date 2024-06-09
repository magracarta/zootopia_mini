package zootopia_mini.zootopia.controller.action.admin;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.AdminDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class AdminMemberUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberVO mvo = new MemberVO();
		mvo.setUserid(request.getParameter("userid"));
		mvo.setNickname(request.getParameter("nickname"));
		mvo.setPwd(request.getParameter("pwd"));
		mvo.setName(request.getParameter("name"));
		mvo.setPhone(request.getParameter("phone"));
		mvo.setEmail(request.getParameter("email"));
		mvo.setKind(request.getParameter("kind"));
		mvo.setPetname(request.getParameter("petname"));
		mvo.setPetgender(request.getParameter("petgender"));
				
		HttpSession session = request.getSession();
		ServletContext context = session.getServletContext();
		String uploadFilePath = context.getRealPath("product_images");
		
		File uploadDir = new File(uploadFilePath);
		if(!uploadDir.exists()) uploadDir.mkdir();

		String fileName="";
		String saveFilename = "";
		for( Part p: request.getParts() ) {
			fileName = "";
			for (String content : p.getHeader("content-disposition").split(";")) {
				if(content.trim().startsWith("filename")) { 
			    	  fileName = content.substring(content.indexOf("=")+2, content.length()-1);
			    	  System.out.println("filename : " + fileName);
			    	  if(!fileName.equals("") ) {
					  		Calendar today = Calendar.getInstance();
							long dt = today.getTimeInMillis();
							String fn1 = fileName.substring(0, fileName.indexOf(".")  );
							String fn2 = fileName.substring( fileName.indexOf(".") );
							saveFilename =  fn1 + dt + fn2;
							p.write(uploadFilePath + File.separator + saveFilename); // 파일 저장
							mvo.setImage(fileName);
							mvo.setSaveimage(saveFilename);
					 }else {
							mvo.setImage( request.getParameter("oldimage"));
							mvo.setSaveimage(request.getParameter("oldsavefilename"));
					 }
				}
			}
		}
		AdminDao adao = AdminDao.getInstance();
		adao.updateProduct(mvo);
		response.sendRedirect("zootopia.do?command=adminmemberlist&userid=" + mvo.getUserid());
		
	}

}
