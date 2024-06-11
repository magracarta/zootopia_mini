package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.AdminDao;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.AdminVO;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

import zootopia_mini.zootopia.util.Paging;

public class AdminCommunityListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
        AdminVO mvo = (AdminVO) session.getAttribute("adminUser");
        
        if (mvo == null) {
            response.sendRedirect("zootopia.do?command=admin");
        } else {
            AdminDao adao = AdminDao.getInstance();
            
            ArrayList<CommunityVO> list;
            Paging paging = new Paging();

        
            int page = 1;
            if (request.getParameter("pagenum") != null) {
                page = Integer.parseInt(request.getParameter("pagenum"));
                session.setAttribute("pagenum", page);
            } else if (session.getAttribute("pagenum") != null) {
                page = (Integer) session.getAttribute("pagenum");
            }

            String key="";
			if( request.getParameter("key") != null ) {
				key = request.getParameter("key");
				session.setAttribute("key", key);
			} else if( session.getAttribute("key") != null ) {
				key = (String)session.getAttribute("key");
			} else {
				key="";
				session.removeAttribute("key");
			}
			
            paging.setCurrentPage(page);
            paging.setPagecnt(10);
            paging.setRecordrow(10);

            // 전체 게시글 수 조회
            int count = adao.getAllCount("community", "subject", key);
            paging.setRecordAllcount(count);

            list = adao.selectCommunity(paging, key);
        

            request.setAttribute("paging", paging);
            request.setAttribute("commList", list);
            
            
            
            request.getRequestDispatcher("admin/community/communityList.jsp").forward(request, response);
        }
	}
}
