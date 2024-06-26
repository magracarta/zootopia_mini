package zootopia_mini.zootopia.controller.action.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MypageDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.controller.dto.ContestPetDTO;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class MycontestAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser"); // 세션에서 사용자 아이디를 가져옵니다.
        
        if (mvo	 == null) 
        {
        	response.sendRedirect("zootopia.do?command=loginform");
        } 
        else 
        {
            MypageDao mdao = MypageDao.getInstance();
            ArrayList<ContestDTO> contestList = mdao.getMyContestList(mvo.getUserid()); // 사용자 아이디를 매개변수로 전달합니다.
			
            ArrayList<ContestPetDTO> contestPetList = mdao.mypetList(mvo.getUserid()); 
            ArrayList<ContestDTO> contestmypetList = new ArrayList<ContestDTO>(); // 내가 참가중인 콘테스트
            
            ArrayList<ContestDTO> contestClosedList = mdao.getClosedContests(mvo.getUserid()); // 종료된 콘테스트
            
            //ArrayList<ContestDTO> contestActiveList = mdao.getActiveContests(mvo.getUserid()); // 종료되지 않은 콘테스트
            
            int myContestCount = mdao.getMyContestCount("contest" , mvo.getUserid());
            int myJoinedContestCount = mdao.getMyJoinedContestCount("contestpetiv_view" , mvo.getUserid());
            
            
            for(ContestPetDTO list :  contestPetList) {
            	contestmypetList.add(mdao.getMypetContest(list.getCseq()));
            }
            
            
           
            
			request.setAttribute("contestmypetList", contestmypetList);
			request.setAttribute("contestList", contestList); 
			request.setAttribute("contestClosedList", contestClosedList); // 종료된 콘테스트 전달
			request.setAttribute("myContestCnt", myContestCount);
			request.setAttribute("myJoinedContestCnt", myJoinedContestCount);
			
			request.getRequestDispatcher("mypage/mycontest.jsp").forward(request, response);
			
		}
	}

}
