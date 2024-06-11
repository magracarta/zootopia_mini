package zootopia_mini.zootopia.controller.action.mypage;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MemberDao;
import zootopia_mini.zootopia.controller.dao.MypageDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class ModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전송되는 파라미터로 회원정보를 수정해주세요
		
				HttpSession session = request.getSession();
				MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
				if(mvo == null) {
					response.sendRedirect("zootopia.do?command=loginform");
				}else {
					MemberDao mdao = MemberDao.getInstance();
					//회원 정보 조회
					MemberVO mvo1 = mdao.getMember(request.getParameter("userid"));
					
					//회원 정보 조회 후 세팅
					mvo1.setPwd(request.getParameter("pwd"));
					mvo1.setName(request.getParameter("name"));
					mvo1.setEmail(request.getParameter("email"));
					mvo1.setNickname(request.getParameter("nickname"));
					mvo1.setPhone(request.getParameter("phone"));
					mvo1.setPetname(request.getParameter("petname"));
					mvo1.setKind(request.getParameter("kind"));
					mvo1.setPetgender(request.getParameter("petgender"));
					
					
					 ServletContext context = session.getServletContext();
			         String uploadFilePath = context.getRealPath("images"); // 디렉토리명

			            File uploadDir = new File(uploadFilePath);
			            if (!uploadDir.exists()) uploadDir.mkdir();

			            String fileName = "";
			            String saveFilename = "";
			            for (Part p : request.getParts()) {
			                fileName = "";
			                for (String content : p.getHeader("content-disposition").split(";")) {
			                	if (content.trim().startsWith("filename")) {
			                        fileName = content.substring(content.indexOf("=") + 2, content.length() - 1);
			                        System.out.println("Extracted filename: " + fileName);
			                        if (!fileName.equals("")) {
			                            Calendar today = Calendar.getInstance();
			                            long dt = today.getTimeInMillis();
			                            String fn1 = fileName.substring(0, fileName.indexOf("."));
			                            String fn2 = fileName.substring(fileName.indexOf("."));
			                            saveFilename = fn1 + dt + fn2;
			                            p.write(uploadFilePath + File.separator + saveFilename); // 파일 저장
			                            System.out.println("Saved filename: " + saveFilename);
			                            
			                            //이전이미지 삭제
			                            File removeFile = new File(uploadFilePath+ File.separator + mvo1.getSaveimage());
			                            
			                            //이미지가 변경 되었을시에만 세팅 해야함! >-<
			                            mvo1.setImage(fileName);
			                            mvo1.setSaveimage(saveFilename);
			                        }
			                    }
			                }
			            }
					
				
			        // DAO를 통해 회원 정보를 업데이트
			        MypageDao mpdao = MypageDao.getInstance();
			        mpdao.updateMember(mvo1);

			        // 세션에 업데이트된 회원 정보를 설정
			        session.setAttribute("loginUser", mvo1);

			        // 마이페이지로 리디렉션
			        response.sendRedirect("zootopia.do?command=mycontest");
			        
				}
				
			}
		

}
