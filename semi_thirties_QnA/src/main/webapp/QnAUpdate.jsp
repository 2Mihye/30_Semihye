<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.qna.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시물 수정</title>
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
			<%
				//String = id 값을 가지고 오겠다.
				String qnaNoValue = (String)request.getParameter("qnaNo");
				int qnaNo = Integer.parseInt(qnaNoValue);
				// DAO 작업
				QnADAO qnaDao = new QnADAO();
				QnA qna = qnaDao.getQnaNo(qnaNo);
				
			%>
			<form action="QnAUpdateAlert.jsp" method="post">
				<input type="hidden" name="qnaNo" value="<%=qna.getQnaNo()%>">
				<table border="1">
					<tr>
						<td>AccountID</td>
						<td><input type="text" name="AccountID" value="<%=qna.getAccountID() %>" disabled></td>
					</tr>
					<tr>
						<td>Title</td>
						<td><input type="text" name="Title" value="<%=qna.getQnaTitle() %>"></td>
					</tr>
					<tr>
						<td>Text</td>
						<td><textarea rows="20" cols="60" name="Text"><%=qna.getQnaText() %></textarea></td>
					<tr>
						<td colspan="2">
						<input type="file" id="fileInput" accept="image/*"><br>
						<input type="submit" id="update" value="수정">
							
				</table>
			</form>	
		</section>



	
	<%
	/*
	QnADAO dao = new QnADAO();
	QnA qna = new (int qnaNo, String accountID, String qnaTitle, String qnaText, Date qnaTime);
	dao.update(qna);
	PageContext.setAttribute("qna", qna);
	response.sendRedirect("QnAPost.jsp"); */
	%>
	
	

	</body>
</html>