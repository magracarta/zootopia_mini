package zootopia_mini.zootopia.controller.action.communityreply;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityReplyDao;

public class UpdateCommunityReplyAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        int grseq = Integer.parseInt(request.getParameter("grseq")); 
        int gseq = Integer.parseInt(request.getParameter("gseq")); 
        String content = request.getParameter("content"); 

        CommunityReplyDao crdao = CommunityReplyDao.getInstance();

        crdao.updateCommunityReply(grseq, content);

        response.sendRedirect("zootopia.do?command=communityDetail&gseq=" + gseq );
    }
}