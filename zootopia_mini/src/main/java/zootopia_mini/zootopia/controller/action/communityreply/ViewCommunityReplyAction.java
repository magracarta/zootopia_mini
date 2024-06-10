package zootopia_mini.zootopia.controller.action.communityreply;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dao.CommunityReplyDao;
import zootopia_mini.zootopia.controller.dto.CommunityReplyDTO;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class ViewCommunityReplyAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gseq = Integer.parseInt(request.getParameter("gseq"));
        CommunityDao cdao = CommunityDao.getInstance();
        CommunityVO cvo = cdao.getCommunity(gseq);

        CommunityReplyDao crdao = CommunityReplyDao.getInstance();
        ArrayList<CommunityReplyDTO> replies = crdao.getCommunityReplies(gseq);

        for (CommunityReplyDTO reply : replies) {
            reply.setSaveImage(crdao.crdaogetSaveImage(reply));
        }

        request.setAttribute("communityReplies", replies);
        request.setAttribute("communityVO", cvo);

        request.getRequestDispatcher("community/community_detail.jsp").forward(request, response);
    }
}