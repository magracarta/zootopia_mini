package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.AdminDao;
import zootopia_mini.zootopia.controller.dto.AdminVO;
import zootopia_mini.zootopia.controller.dto.MemberVO;
import zootopia_mini.zootopia.util.Paging;

public class AdminMemberListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		AdminVO avo = (AdminVO)session.getAttribute("adminUser");
		if(avo == null) {
			response.sendRedirect("zootopia.do?command=admin");
		}else {
			
			Paging paging = new Paging();
			int page = 1;
            if (request.getParameter("pagenum") != null) {
                page = Integer.parseInt(request.getParameter("pagenum"));
                session.setAttribute("pagenum", page);
            } else if (session.getAttribute("pagenum") != null) {
                page = (Integer) session.getAttribute("pagenum");
            }

			
			String key="";
			if(request.getParameter("key") != null) {
				key = request.getParameter("key");
				session.setAttribute("key", key);
			}else if(session.getAttribute("key") != null) {
				key = (String)session.getAttribute("key");
			}else {
				key="";
				session.removeAttribute("key");
			}
			
			paging.setCurrentPage(page);
            paging.setPagecnt(10);
            paging.setRecordrow(10);
            
			AdminDao adao = AdminDao.getInstance();
			
			int count = adao.getAllCount("member", "name", key);
			paging.setRecordAllcount(count);
			
			
			ArrayList<MemberVO> memberList = adao.adminMemberList(paging, key);
			
			
			
			request.setAttribute("paging", paging);
			request.setAttribute("memberList", memberList);
			request.setAttribute("key", key);
			request.getRequestDispatcher("admin/member/memberList.jsp").forward(request, response);
		}
		
		
		
	}

}
