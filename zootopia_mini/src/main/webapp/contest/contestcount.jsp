<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String cseq = request.getParameter("cseq");
	response.sendRedirect("zootopia.do?command=contestDetail&cseq="+cseq);
%>
