<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file ="../header.jsp" %>
<%@ include file="section/mypage_info.jsp" %>


	<form name="mypageMycontestForm">
		<div class="container">
			<div class="column">
			<h2>내가 등록한 콘테스트(${myContestCnt})</h2>
				<div class="contestlist">
					<c:choose>
            			<c:when test="${empty contestList}">
                			<p>내가 등록한 콘테스트가 없습니다.</p>
            			</c:when>
            			<c:otherwise>
            				<div class="scroll">
            					<c:forEach items ="${contestList}" var="list">
			                		<div class="contest">
										<a href="zootopia.do?command=contestDetail&cseq=${list.cseq}">
				                    		<h3>${list.subject}</h3>
				                    		<p>${list.content}</p>
		                    			</a>
	                				</div>
	                			</c:forEach>
			                </div>
            			</c:otherwise>
        			</c:choose>
				</div>
			</div>
			<div class="column">
			<h2>내가 참가한 콘테스트(${myJoinedContestCnt})</h2>
				<div class="contestlist">
					<c:choose>
						<c:when test="${empty contestmypetList}">
							 <p>참가중인 콘테스트가 없습니다.</p>
						</c:when>
					<c:otherwise>
		                	<div class="scroll">
            					<c:forEach items ="${contestmypetList}" var="list2">
			                		<div class="contest">
										<a href="zootopia.do?command=contestDetail&cseq=${list2.cseq}">
				                    		<h3>${list2.subject}</h3>
				                    		<p>${list2.content}</p>
		                    			</a>
	                				</div>
	                			</c:forEach>
			                </div>
            			</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</form>
		
<%@ include file="css/mypage_css.jsp" %>
<%@ include file="css/mycontest.jsp" %>
<%@ include file="../footer.jsp" %>

		                    