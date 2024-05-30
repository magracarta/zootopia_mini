package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class CommunityDetailAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        MemberVO cvo = (MemberVO) session.getAttribute("loginUser");

        if (cvo == null) {
            response.sendRedirect("zootopia.do?command=main");
        } else {
            // 게시글의 고유 번호(gseq) 가져오기
            int gseq = Integer.parseInt(request.getParameter("gseq"));

            // 해당 gseq에 해당하는 게시글 정보를 데이터베이스에서 가져오기
            CommunityDao cdao = CommunityDao.getInstance();
            CommunityVO community = cdao.selectCommunity(gseq);

            // 가져온 게시글 정보를 request에 설정하여 JSP로 전달
            request.setAttribute("community", community);

            // 게시글 내용을 보여주는 JSP로 포워딩
            request.getRequestDispatcher("community/community_detail.jsp").forward(request, response);
        }
    }
}