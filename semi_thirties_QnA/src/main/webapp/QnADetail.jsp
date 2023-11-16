<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="semi.qna.QnADAO" %>
<%@ page import="semi.qna.QnAVO" %>
<%@ page import="semi.qna.QnADeleteServlet" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/QnADetailStyles.css">
	<title>가지고 싶은 물건, 가지가지 다~ 있다! 가지마켓</title>
	<script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
	</head>

	<body>
		<div class="wrap">
	        <div class="inner">
		        <div>
				<%
			        if (session.getAttribute("USER_NAME") != null) {
			    %>
			        
			    <%-- 세션에서 사용자 이름 가져오기 --%>
			    <% String user_name = (String)session.getAttribute("USER_NAME"); %>
			    
			    <p class="sessionState"><%= user_name %>님 환영합니다! &nbsp;&nbsp;<a href="logout.jsp">로그아웃</a></p>
			    <%
			        } else {
			    %>
				<p class="sessionState"><a href="login.jsp">로그인</a> &nbsp;&nbsp; <a href="register.jsp">회원가입</a></p>
			    <%
			        }
			    %>
	                <header>
	                    <div class="logo">
	                        <a href="mainpage.jsp" style="text-decoration: none;"><p class="gajimarket">가지마켓</p></a>
	                    </div>
	                    <div class="mascot">
	                        <a href="mainpage.jsp"><img src="./img/gajidori.png" alt="gajidori" class="gajidori"></a>
	                    </div>
	                </header>
	                <nav>
	                    <ul>
	                        <li><a>자유게시판</a></li>
	                        <li><a>리뷰게시판</a></li>
	                        <li><a href="QnAList.jsp">문의게시판</a></li>
	                        <li><a href="productRetrieve.jsp">마이페이지</a></li>
	                    </ul>
	                </nav>
		        </div>
		<%
			//String = id 값을 가지고 오겠다.
			String qnaNoValue = request.getParameter("qnaNo");
			int qnaNo = (qnaNoValue != null && !qnaNoValue.isEmpty())?Integer.parseInt(qnaNoValue):0;
			// DAO 작업
			QnADAO qnaDao = new QnADAO();
			QnAVO qna = qnaDao.getQnaNo(qnaNo);
		%>
		<table border="1" style="width:90%; border-collapse:collapse; vertical-align: middle; margin-top:20px; margin-left:50px; margin-bottom:20px;">
		<% if (qna != null) { %>
			<tr>
				<th>작성자</th><td style="width: 400px;"><%=qna.getAccountID() %></td>
				<th>작성 시간</th><td style="text-align:center;"><%=qna.getQnaTime() %></td>
			</tr>
			<tr>
				<th>제목</th><td colspan="3"><%=qna.getQnaTitle() %></td>
			</tr>
			<tr>
				<th style="height:400px;">내용</th><td colspan="3"><%=qna.getQnaText() %></td>
			</tr>
		</table>
		<% }else{ %>
		not post.
		<% } %>
		
		<form action="QnADelete.jsp?qnaNo=<%=qnaNo%>" method="post">
			<button type="submit" id="deleteButton" onclick="Location.href='QnADelete.jsp?qnaNo=<%=qnaNo%>'">삭제</button>
		</form>
		
		<button id="updateButton" onclick="location.href='QnAUpdate.jsp?qnaNo=<%=qnaNo%>'">수정</button>

	        <footer>
	        </footer>
	        </div>
	    </div>
	</body>
</html>