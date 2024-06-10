package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class AdminCommunityUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int gseq = Integer.parseInt(request.getParameter("gseq"));
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        int kind = Integer.parseInt(request.getParameter("kind")); // 수정된 카테고리 값 받아오기

        // 수정할 CommunityVO 객체 생성
        CommunityVO cvo = new CommunityVO();
        cvo.setGseq(gseq);
        cvo.setSubject(subject);
        cvo.setContent(content);
        cvo.setKind(kind);

        // DAO를 사용하여 DB 업데이트
        CommunityDao cdao = CommunityDao.getInstance();
        cdao.updateCommunity(cvo);

        // 수정된 게시물의 상세 페이지로 리다이렉트
        response.sendRedirect("zootopia.do?command=admincommunitydetail&gseq=" + cvo.getGseq());
		
	}

}
