package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class WriteCommunityAction implements Action {
    
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // CommunityVO 객체 생성
        CommunityVO cvo = new CommunityVO();
        cvo.setUserid(request.getParameter("userid"));
        cvo.setSubject(request.getParameter("subject")); 
        cvo.setContent(request.getParameter("content")); 
        cvo.setKind(Integer.parseInt(request.getParameter("kind"))); 
        
		CommunityDao cdao = CommunityDao.getInstance();
        cdao.insertCommunity(cvo);
        
        // 글 작성 후에는 커뮤니티 게시판으로 redirect 합니다.
        response.sendRedirect("zootopia.do?command=communityBoard");
    }
}

