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
import zootopia_mini.zootopia.util.Paging;

public class FindCommunityAction implements Action {

	@Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subject = request.getParameter("search");
        HttpSession session = request.getSession();
        int categorynum = 0;
		if(request.getParameter("kind") != null) {
			categorynum = Integer.parseInt(request.getParameter("kind"));
		}
        
        if(subject != null && !subject.isEmpty()) {
            CommunityDao cdao = CommunityDao.getInstance();

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
            
            int count = cdao.getAllCount(subject , categorynum);
            paging.setRecordAllcount(count);


            ArrayList<CommunityVO> list = cdao.findcontent(subject , paging , categorynum);

            ArrayList<CommunityVO> top3Posts = cdao.getTop3Posts();
            request.setAttribute("top3Posts", top3Posts);

            request.setAttribute("paging", paging);
            request.setAttribute("commList", list);
            
            
            String kindParam = request.getParameter("kind");
            int kind = -1;
            if (kindParam != null) {
                kind = Integer.parseInt(kindParam);
            }

            request.setAttribute("kind", categorynum);
            request.setAttribute("search", subject);
            request.setAttribute("subjectList", list);
        }
        request.getRequestDispatcher("community/community_board.jsp").forward(request, response);
    }
}
