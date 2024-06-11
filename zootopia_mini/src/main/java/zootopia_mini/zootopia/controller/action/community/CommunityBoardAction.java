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
			String search = request.getParameter("search");
			if(request.getParameter("search") == null) search = "";
			int categorynum = 0;
			
			if(request.getParameter("kind") != null ) {
				categorynum = Integer.parseInt(request.getParameter("kind"));
			}
            CommunityDao cdao = CommunityDao.getInstance();
        
            ArrayList<CommunityVO> list;
            Paging paging = new Paging();

        
            
            
            String kindParam = request.getParameter("kind");
            int kind = -1;
            if (kindParam != null) {
                kind = Integer.parseInt(kindParam);
            }
            int count = cdao.getAllCount(kind , search);
            
            
            int page = 1;
            int setpagerowcnt = 10;
            if (request.getParameter("pagenum") != null) {
                page = Integer.parseInt(request.getParameter("pagenum"));
                session.setAttribute("pagenum", page);
            } else if (session.getAttribute("pagenum") != null && count > setpagerowcnt ) {
                page = (Integer) session.getAttribute("pagenum");
            }
            
            paging.setCurrentPage(page);
            paging.setPagecnt(setpagerowcnt);
            paging.setRecordrow(setpagerowcnt);
            paging.setRecordAllcount(count);


            list = cdao.selectCommunity(paging , categorynum , search);
        

            ArrayList<CommunityVO> top3Posts = cdao.getTop3Posts();
            request.setAttribute("top3Posts", top3Posts);

            request.setAttribute("paging", paging);
            request.setAttribute("commList", list);
            
           request.setAttribute("search", search);
            request.setAttribute("kind", categorynum);

            request.getRequestDispatcher("community/community_board.jsp").forward(request, response);
        }
            
}