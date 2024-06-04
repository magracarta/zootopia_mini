<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*" %>

<%
    String userid = request.getParameter("userid");
    boolean success = false;
    
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Context initContext = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        DataSource ds = (DataSource)envContext.lookup("jdbc/MyDB");
        conn = ds.getConnection();

        String sql = "DELETE FROM qna WHERE userid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(userid));
        int rowsAffected = pstmt.executeUpdate();

        success = rowsAffected > 0;
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }

    if (success) {
        response.sendRedirect("zootopia.do?command=qnaList");
    } else {
        response.sendRedirect("zootopia.do?command=qnaView&userid=" + userid + "&error=deleteFailed");
    }
%>