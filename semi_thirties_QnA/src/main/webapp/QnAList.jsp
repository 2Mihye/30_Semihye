<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="semi.qna.QnADAO" %>
<%@ page import="semi.qna.QnA" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>가지가지 다 물어보는 QnA</title>
		<link rel="stylesheet" type="text/css" href="css/styles.css">
	</head>
	<body>
        <p id="login-join-link">로그인 회원가입</p>
        <header>
            <div id="logo">
                <p id="gajimarket">가지마켓</p>
            </div>
            <div id="mascot">
                <img src="img/gajidori.png" alt="gajidori" id="gajidori">
            </div>
        </header>
		<nav>
            <ul>
                <li><a>자유게시판</a></li>
                <li><a>리뷰게시판</a></li>
                <li><a>문의게시판</a></li>
                <li><a>마이페이지</a></li>
            </ul>
        </nav>
		<section>
			<form>
	
					<p><h3><strong>자주 묻는 질문 TOP10</strong></h3><br>
					<a>1. 비밀번호를 변경하고 싶어요.</a><br><br>
					<a>2. 비밀번호를 분실했어요.</a><br><br>
					<a>3. 아이디를 분실했어요.</a><br><br>
					<a>4. 탈퇴하고 싶어요.</a></li><br><br>
					<a>5. 상품을 등록하고 싶어요.</a><br><br>
					<a>6. 상품을 삭제하고 싶어요.</a><br><br>
					<a>7. 상품을 수정하고 싶어요.</a><br><br>
					<a>8. 내 정보를 수정하고 싶어요.</a><br><br>
					<a>9. 원하는 종류의 상품만 보고싶어요.</a><br><br>
					<a>10.가입 없이 게시판 이용하고 싶어요.</a></p>

	        </form>
			<table border="1">
				<tr>
					<th>게시글 번호</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>작성시간</th>
				</tr>
				<%
					QnADAO qnaDAO = new QnADAO();
					List<QnA> qnas = qnaDAO.getAllQnAs();
					
					for(QnA qna : qnas){
						
				%>
				<tr>
					<td><a href="QnADetail.jsp?qnaNo=<%=qna.getQnaNo()%>"> <%= qna.getQnaNo() %> </a></td>
					<td><a href="QnADetail.jsp?qnaNo=<%=qna.getQnaNo()%>"> <%= qna.getQnaTitle() %> </td>
					<td><a href="QnADetail.jsp?qnaNo=<%=qna.getQnaNo()%>"> <%= qna.getAccountID() %> </td>
					<td><%= qna.getQnaTime() %> </td>
				</tr>
				<%		
					}
				%>
				
			</table><br>
			<button id="postButton" onclick="location.href='QnAPost.jsp'">글쓰기</button>
		
		</section>
        
	</body>
</html>