<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>�Խñ� �ۼ�</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
		<h1>�Խñ� �ۼ�</h1>
		<div>
			<form action="QnAServlet" method="post">
				
				<input type="text" id="qna_title" name="qna_title" placeholder="����" required><br>
				
				<input type="text" id="qna_text" name="qna_text" placeholder="����" required><br>
				
				<input type="submit" value="�ۼ�">
			</form>
		</div>
		
	</body>
</html>