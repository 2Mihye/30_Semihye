<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "semi.qna.QnADAO" %>
<%@ page import="semi.qna.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 삭제</title>
		<link rel="stylesheet" type="text/css" href="css/styles.css">
	</head>
	<body>
		<%
			int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
			String qnaTitle = request.getParameter("qnaTitle");
			String qnaText = request.getParameter("qnaText");
			
			QnA qna = new QnA(qnaNo, qnaTitle, qnaText);
			QnADAO dao = new QnADAO();
			int result = dao.update(qna);
			
			if(result > 0) {
				System.out.println("Hello Can you read me?");
		%>
		<script type="text/javascript">
			alert("글 수정 성공 !")
			location.href="QnADetail.jsp?qnaNo=<%=qna.getQnaNo()%>";
		</script>
		<%
			} else {
		%>
			<script type="text/javascript">
				alert("글 수정이 실패하였습니다.")
				location.href="QnADetail.jsp?qnaNo=<%=qna.getQnaNo()%>";
			</script>
		<%
			}
		%>
	</body>
</html>