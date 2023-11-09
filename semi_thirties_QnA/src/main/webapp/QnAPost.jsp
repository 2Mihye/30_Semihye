<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>가지가지 다 물어보는 QnA</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
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
			<table action="QnAServlet" method="post">
				
				<input type="text" id="qna_title" name="qna_title" placeholder="제목" required><br>
				
				<input type="text" id="qna_text" name="qna_text" placeholder="내용" required><br>
				
				<input type="file" id="fileInput" accept="image/*">
				
				<input type="submit" id="submitButton" value="작성">
				
				<button><a href = QnAList.jsp>취소</a></button>
			
			
			</table>
		</section>
	</body>
</html>