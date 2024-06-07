package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;
import zootopia_mini.zootopia.controller.dto.MemberVO;
import zootopia_mini.zootopia.util.Paging;

public class CommunityBoardAction implements Action {

	@Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
            CommunityDao cdao = CommunityDao.getInstance();
        
            ArrayList<CommunityVO> list;
            Paging paging = new Paging();

        
            int page = 1;
            if (request.getParameter("pagenum") != null) {
                page = Integer.parseInt(request.getParameter("pagenum"));
                session.setAttribute("pagenum", page);
            } else if (session.getAttribute("pagenum") != null) {
                page = (Integer) session.getAttribute("pagenum");
            }

            paging.setCurrentPage(page);
            paging.setPagecnt(10);
            paging.setRecordrow(10);

            // 전체 게시글 수 조회
            int count = cdao.getAllCount();
            paging.setRecordAllcount(count);

            list = cdao.selectCommunity(paging);
        

            ArrayList<CommunityVO> top3Posts = cdao.getTop3Posts();
            request.setAttribute("top3Posts", top3Posts);

            request.setAttribute("paging", paging);
            request.setAttribute("commList", list);
            
            
            // kind 파라미터 가져오기
            String kindParam = request.getParameter("kind");
            int kind = -1;
            if (kindParam != null) {
                kind = Integer.parseInt(kindParam);
            }
            request.setAttribute("kind", kind);

            request.getRequestDispatcher("community/community_board.jsp").forward(request, response);
        }
            
}