<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp" %>
<%@ include file="section/mypage_info.jsp" %>


	<form name="mypageMycontestForm">
		<div class="container">
			<div class="column">
			<h2>내 콘테스트</h2>
				<div class="contestlist">
					<c:choose>
            			<c:when test="${empty contestList}">
                			<p>내가 등록한 콘테스트가 없습니다.</p>
            			</c:when>
            			<c:otherwise>
		                	<div class="contest">
		                		<a href="zootopia.do?command=contestDetail&cseq=${contestList[0].cseq}">
		                    		<h3>${contestList[0].subject}</h3>
		                    		<p>${contestList[0].content}</p>
	                    		</a>
                			</div>
			                <c:if test="${contestList.size() > 1}">
			                    <div class="contest">
			                        <a href="zootopia.do?command=contestDetail&cseq=${contestList[1].cseq}">
			                            <h3>${contestList[1].subject}</h3>
			                            <p>${contestList[1].content}</p>
			                        </a>
			                    </div>
			                </c:if>
            			</c:otherwise>
        			</c:choose>
				</div>
			</div>
			<div class="column">
			<h2>참가중인 콘테스트</h2>
				<div class="contestlist">
					<c:choose>
						<c:when test="${empty contestmypetList}">
							 <p>참가중인 콘테스트가 없습니다.</p>
						</c:when>
					<c:otherwise>
						<c:forEach items ="${contestmypetList}" var="list2">
							<div class="contest">
								<a href="zootopia.do?command=contestDetail&cseq=${list2.cseq}">
			                        <h3>${list2.subject}</h3>
			                        <p>${list2.content}</p>
			                    </a>
		                    </div>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="column">
			<h2>종료된 콘테스트</h2>
				<div class="contestlist">
					<c:choose>
						<c:when test="${empty contestClosedList}">
							 <p>종료된 콘테스트가 없습니다.</p>
						</c:when>
					<c:otherwise>
						<c:forEach items ="${contestClosedList}" var="list3">
							<div class="contest">
								<a href="zootopia.do?command=contestDetail&cseq=${list3.cseq}">
			                        <h3>${list3.subject}</h3>
			                        <p>${list3.content}</p>
			                    </a>
		                    </div>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
	</form>
		
<%@ include file="css/mypage_css.jsp" %>
<%@ include file="css/mycontest.jsp" %>
<%@ include file ="../footer.jsp" %>

