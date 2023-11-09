<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>�������� �� ����� QnA</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
	</head>
	<body>
        <p id="login-join-link">�α��� ȸ������</p>
        <header>
            <div id="logo">
                <p id="gajimarket">��������</p>
            </div>
            <div id="mascot">
                <img src="img/gajidori.png" alt="gajidori" id="gajidori">
            </div>
        </header>
		<nav>
            <ul>
                <li><a>�����Խ���</a></li>
                <li><a>����Խ���</a></li>
                <li><a>���ǰԽ���</a></li>
                <li><a>����������</a></li>
            </ul>
        </nav>
		
		<section>
			<table action="QnAServlet" method="post">
				
				<input type="text" id="qna_title" name="qna_title" placeholder="����" required><br>
				
				<input type="text" id="qna_text" name="qna_text" placeholder="����" required><br>
				
				<input type="file" id="fileInput" accept="image/*">
				
				<input type="submit" id="submitButton" value="�ۼ�">
				
				<button><a href = QnAList.jsp>���</a></button>
			
			
			</table>
		</section>
	</body>
</html>