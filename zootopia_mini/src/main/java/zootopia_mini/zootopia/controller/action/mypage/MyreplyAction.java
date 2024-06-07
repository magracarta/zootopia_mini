package zootopia_mini.zootopia.controller.action.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MypageDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;
import zootopia_mini.zootopia.controller.dto.MyReplyDTO;

public class MyreplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser"); // 세션에서 사용자 아이디를 가져옵니다.
		
		
		if (mvo == null) {
            response.sendRedirect("zootopia.do?command=loginform");
        } else {
            MypageDao mdao = MypageDao.getInstance();
            ArrayList<MyReplyDTO> myReplyList = mdao.getMyReplyList(mvo.getUserid());
          

            // 각 댓글에 해당하는 글의 제목을 가져오는 로직 추가
            for (MyReplyDTO reply : myReplyList) {
                String postSubject = null;
                // 댓글이 속한 테이블과 게시글 ID를 사용하여 제목 가져오기
                postSubject = mdao.getPostSubject(reply.getType(), reply.getPostId());
                // 가져온 제목을 DTO에 설정
                reply.setSubject(postSubject);
            }

            request.setAttribute("myReplyList", myReplyList);
            request.getRequestDispatcher("mypage/myreply.jsp").forward(request, response);
        }
		
		
	}

}
