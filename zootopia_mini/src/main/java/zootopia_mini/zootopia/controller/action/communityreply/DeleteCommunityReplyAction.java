package zootopia_mini.zootopia.controller.action.communityreply;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dao.CommunityReplyDao;

public class DeleteCommunityReplyAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int grseq = Integer.parseInt(request.getParameter("grseq"));

        CommunityReplyDao crdao = CommunityReplyDao.getInstance();

        crdao.deleteCommunityReply(grseq);

        String gseqParam = request.getParameter("gseq");
        int gseq = (gseqParam != null && !gseqParam.isEmpty()) ? Integer.parseInt(gseqParam) : 0;

        // 게시글 상세 페이지로 리다이렉트합니다.
        response.sendRedirect("zootopia.do?command=communityDetail&gseq=" + gseq);
    }
}