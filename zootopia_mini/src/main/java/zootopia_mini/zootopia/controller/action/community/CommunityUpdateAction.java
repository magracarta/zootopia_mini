package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class CommunityUpdateAction implements Action {
	  
	@Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gseq = Integer.parseInt(request.getParameter("gseq"));
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        int kind = Integer.parseInt(request.getParameter("kind")); 

        CommunityVO cvo = new CommunityVO();
        cvo.setGseq(gseq);
        cvo.setSubject(subject);
        cvo.setContent(content);
        cvo.setKind(kind);

        CommunityDao cdao = CommunityDao.getInstance();
        cdao.updateCommunity(cvo);

        response.sendRedirect("zootopia.do?command=communityDetail&gseq=" + cvo.getGseq());
    }
}