<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>�Խñ� �ۼ�</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
	</head>
	<body>
		<header>
			<p class="login-join-link">�α��� ȸ������</p> <!-- �α��� ������, ȸ������ ��ũ������ �����-->
		            <p class="logo">��������</p>
		            <p class="slogan">������ ���� ����, ���� ���� �� �ִ�!</p>
		</header>

        <div>
            <p class="category">ī�װ� �Խ���1 �Խ���2 �Խ���3 ��(��ٱ���) ����������</p> <!-- ���߿� ��ũ�� ���� : <a>�±׷� �ٹٲ� ���� -->
        </div>
		
		<section>
		<h1>�Խñ� �ۼ�</h1>
			<nav>
				<ul>
					<p><h2>���� ���� ���� TOP10</h2></p><br>
					<li><strong><a>1. ��й�ȣ ������ ��� �ϳ���?</a></strong></li><br>
					<li><strong><a>2. ��й�ȣ�� �н��߾��.</a></strong></li><br>
					<li><strong><a>3. ���̵� �н��߾��.</a></strong></li><br>
					<li><strong><a>4. Ż���ϰ� �;��.</a></strong></li><br>
					<li><strong><a>5. ��ǰ�� ����ϰ� �;��.</a></strong></li><br>
					<li><strong><a>6. ��ǰ�� �����ϰ� �;��.</a></strong></li><br>
					<li><strong><a>7. ��ǰ�� �����ϰ� �;��.</a></strong></li><br>
					<li><strong><a>8. �� ������ �����ϰ� �;��.</a></strong></li><br>
					<li><strong><a>9. ���ϴ� ������ ��ǰ�� ����;��.</a></strong></li><br>
					<li><strong><a>10.���� ���� �����Խ��� �̿��ϰ� �;��.</a></strong></li>
				</ul>
	        </nav>
		
			<form action="QnAServlet" method="post">
				
				<input type="text" id="qna_title" name="qna_title" placeholder="����" required><br>
				
				<input type="text" id="qna_text" name="qna_text" placeholder="����" required><br>
				
				<input type="file" id="fileInput" accept="image/*">
				
				<input type="submit" value="�ۼ�">
				
				<button><a href = QnAList.jsp>���</a></button>
			
			
			</form>
		</section>
	</body>
</html>