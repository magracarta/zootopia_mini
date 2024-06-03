package zootopia_mini.zootopia.controller.action.community;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.CommunityDao;
import zootopia_mini.zootopia.controller.dto.CommunityVO;

public class CommunityUpdateAction implements Action {
  
  @Override public void execute(HttpServletRequest request, HttpServletResponse
  response) throws ServletException, IOException {
  
  CommunityVO cvo = new CommunityVO();
  cvo.setGseq(Integer.parseInt(request.getParameter("gseq")));
  cvo.setKind(Integer.parseInt(request.getParameter("kind")));
  cvo.setNickname(request.getParameter("nickname"));
  cvo.setContent(request.getParameter("content"));
  cvo.setSubject(request.getParameter("subject"));
  cvo.setUserid(request.getParameter("userid"));
  
  CommunityDao cdao = CommunityDao.getInstance(); cdao.updateCommunity(cvo);
  response.sendRedirect("zootopia.do?command=communityDetail&gseq=" +
  cvo.getGseq()); } }
 