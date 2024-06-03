package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class WriteCommunityAction implements Action {
    
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	MemberVO mvo = (MemberVO) request.getSession().getAttribute("loginUser");
    	String userId = mvo.getUserid();
        // CommunityVO 객체 생성
        CommunityVO cvo = new CommunityVO();
        cvo.setUserid(userId); // 가져온 아이디를 CommunityVO 객체에 설정
        cvo.setSubject(request.getParameter("subject")); 
        cvo.setContent(request.getParameter("content")); 
        cvo.setKind(Integer.parseInt(request.getParameter("kind"))); 
        
		CommunityDao cdao = CommunityDao.getInstance();
        cdao.insertCommunity(cvo);
        
        // 글 작성 후에는 커뮤니티 게시판으로 redirect 합니다.
        response.sendRedirect("zootopia.do?command=communityBoard");
    }
}

