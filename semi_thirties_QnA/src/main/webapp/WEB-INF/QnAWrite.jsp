<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>�����ϱ�</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
		<header>
		</header>
		<h1>�����ϱ�</h1>
		<form action="QnAServlet" method="post">
			<input type="text" id="qna_title" name="qna_title" placeholder="��������" required><br>
			
			<input type="text" id="qna_text" name="qna_text" placeholder="���ǳ���" required><br>
			
			<input type="submit" value="�ۼ�">
			<button href="QnAlist"></button>
		</form>
	</body>
</html>