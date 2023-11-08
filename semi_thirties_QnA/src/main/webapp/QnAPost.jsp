<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>게시글 작성</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
		<h1>게시글 작성</h1>
		<div>
			<form action="QnAServlet" method="post">
				
				<input type="text" id="qna_title" name="qna_title" placeholder="제목" required><br>
				
				<input type="text" id="qna_text" name="qna_text" placeholder="내용" required><br>
				
				<input type="file" id="fileInput" accept="image/*">
				
				<input type="submit" value="작성">
				<button><a href= QnAlist.jsp>취소</a></button>
			
			</form>
		</div>
		
	</body>
</html>