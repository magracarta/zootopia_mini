<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

	String cseq = request.getParameter("cseq");
	String index = request.getParameter("index");
	if(index != null){
	response.sendRedirect("zootopia.do?command=contestDetail&cseq="+cseq+"&index="+index);
		
	}else response.sendRedirect("zootopia.do?command=contestDetail&cseq="+cseq);
%>
