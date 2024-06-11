package zootopia_mini.zootopia.controller.action.member;

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
import zootopia_mini.zootopia.controller.dao.MemberDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberDao mdao = MemberDao.getInstance();
		MemberVO mvo = new MemberVO();
		
		mvo.setUserid(request.getParameter("userid"));
		mvo.setNickname(request.getParameter("nickname"));
		mvo.setPwd(request.getParameter("pwd"));
		mvo.setName(request.getParameter("name"));
		mvo.setPhone(request.getParameter("phone"));
		mvo.setEmail(request.getParameter("email"));
		mvo.setKind(request.getParameter("kind"));
		if(!request.getParameter("petname").equals("선택") )mvo.setPetname(request.getParameter("petname"));
		if(!request.getParameter("petgender").equals("선택") )mvo.setPetgender(request.getParameter("petgender"));
		
		
		HttpSession session = request.getSession();
		ServletContext context = session.getServletContext();
		String uploadFilePath = context.getRealPath("images");
		
		File uploadDir = new File(uploadFilePath);
		if(!uploadDir.exists()) uploadDir.mkdir();
		
		String fileName ="";
		
		for(Part p : request.getParts()) {
			fileName = "";
			for(String content : p.getHeader("content-disposition").split(";")) {
				if(content.trim().startsWith("filename")) {
					fileName = content.substring(content.indexOf("=")+2, content.length()-1);
				}
			}
			String saveFilename ="";
			if(!fileName.equals("")) {
				Calendar today = Calendar.getInstance();
				long dt = today.getTimeInMillis();
				String fn1 = fileName.substring(0, fileName.indexOf("."));
				String fn2 = fileName.substring(fileName.indexOf("."));
				saveFilename = fn1 + dt + fn2;
				p.write(uploadFilePath + File.separator + saveFilename); // 파일 저장
				mvo.setImage(fileName);
				mvo.setSaveimage(saveFilename);
			}
		}
		
		request.setAttribute("photoview", mvo);
		int result = mdao.insertMember(mvo);
		if(result == 1) session.setAttribute("message", "회원가입이 완료되었습니다. 로그인하세요");
		else session.setAttribute("message", "회원가입 실패 관리자에게 문의하세요");
		
		response.sendRedirect("zootopia.do?command=loginform");
		
	}

}
