package zootopia_mini.zootopia.controller.action.mypage;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MypageDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class ModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전송되는 파라미터로 회원정보를 수정해주세요
		
				HttpSession session = request.getSession();
				MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
				if(mvo == null) {
					response.sendRedirect("zootopia.do?command=loginform");
				}else {
					MemberVO mvo1 = new MemberVO();
					mvo1.setUserid(request.getParameter("userid"));
					mvo1.setPwd(request.getParameter("pwd"));
					mvo1.setName(request.getParameter("name"));
					mvo1.setEmail(request.getParameter("email"));
					mvo1.setNickname(request.getParameter("nickname"));
					mvo1.setPhone(request.getParameter("phone"));
					mvo1.setPetname(request.getParameter("petname"));
					mvo1.setKind(request.getParameter("kind"));
					mvo1.setPetgender(request.getParameter("petgender"));
					mvo1.setImage(request.getParameter("image"));
					mvo1.setSaveimage(request.getParameter("saveimage"));
					
					MypageDao mpdao = MypageDao.getInstance();
					mpdao.updateMember(mvo1);
					
					session.setAttribute("loginUser", mvo1);
					
					response.sendRedirect("zootopia.do?command=mypage");
				}
				
			}
		
		

	

}
