<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>문의하기</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
		<header>
		</header>
		<h1>문의하기</h1>
		<form action="QnAServlet" method="post">
			<input type="text" id="qna_title" name="qna_title" placeholder="문의제목" required><br>
			
			<input type="text" id="qna_text" name="qna_text" placeholder="문의내용" required><br>
			
			<input type="submit" value="작성">
			<button href="QnAlist"></button>
		</form>
	</body>
</html>