<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="semi.qna.QnADAO" %>
<%@ page import="semi.qna.QnA" %>
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
                <li>�����Խ���</li>
                <li>����Խ���</li>
                <li>���ǰԽ���</li>
                <li>����������</li>
            </ul>
        </nav>
		<section>
			<form>
	
					<p><h3><strong>���� ���� ���� TOP10</strong></h3><br>
					<a>1. ��й�ȣ�� �����ϰ� �;��.</a><br><br>
					<a>2. ��й�ȣ�� �н��߾��.</a><br><br>
					<a>3. ���̵� �н��߾��.</a><br><br>
					<a>4. Ż���ϰ� �;��.</a></li><br><br>
					<a>5. ��ǰ�� ����ϰ� �;��.</a><br><br>
					<a>6. ��ǰ�� �����ϰ� �;��.</a><br><br>
					<a>7. ��ǰ�� �����ϰ� �;��.</a><br><br>
					<a>8. �� ������ �����ϰ� �;��.</a><br><br>
					<a>9. ���ϴ� ������ ��ǰ�� ����;��.</a><br><br>
					<a>10.���� ���� �����Խ��� �̿��ϰ� �;��.</a></p>

	        </form>
			<table border="1">
				<tr>
					<th>�Խñ� ��ȣ</th>
					<th>�� ��</th>
					<th>�ۼ���</th>
					<th>�ۼ��ð�</th>
				</tr>
				<%
					QnADAO qnaDAO = new QnADAO();
					List<QnA> qnas = qnaDAO.getAllProducts();
					
					for(QnA qna : qnas){
						
				%>
				<tr>
					<td><a href="productDetail.jsp?productID=<%=qna.getQnaNo()%>"> <%= qna.getQnaNo() %> </a></td>
					<td> <%= qna.getQnaNo() %> </td>
					<td> <%= qna.getAccountID() %> </td>
					<td> <%= qna.getQnaTitle() %> </td>
					<td> <%= qna.getQnaTime() %> </td>
				</tr>
				<%		
					}
				%>
				
			</table>	
		
		</section>
        
	</body>
</html>