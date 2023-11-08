<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>게시글 작성</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
	</head>
	<body>
		<header>
			<p class="login-join-link">로그인 회원가입</p> <!-- 로그인 페이지, 회원가입 링크페이지 만들기-->
		            <p class="logo">가지마켓</p>
		            <p class="slogan">가지고 싶은 물건, 가지 가지 다 있다!</p>
		</header>

        <div>
            <p class="category">카테고리 게시판1 게시판2 게시판3 찜(장바구니) 마이페이지</p> <!-- 나중에 링크로 연결 : <a>태그로 줄바꿈 없이 -->
        </div>
		
		<section>
		<h1>게시글 작성</h1>
			<nav>
				<ul>
					<p><h2>자주 묻는 질문 TOP10</h2></p><br>
					<li><strong><a>1. 비밀번호 변경은 어떻게 하나요?</a></strong></li><br>
					<li><strong><a>2. 비밀번호를 분실했어요.</a></strong></li><br>
					<li><strong><a>3. 아이디를 분실했어요.</a></strong></li><br>
					<li><strong><a>4. 탈퇴하고 싶어요.</a></strong></li><br>
					<li><strong><a>5. 상품을 등록하고 싶어요.</a></strong></li><br>
					<li><strong><a>6. 상품을 삭제하고 싶어요.</a></strong></li><br>
					<li><strong><a>7. 상품을 수정하고 싶어요.</a></strong></li><br>
					<li><strong><a>8. 내 정보를 수정하고 싶어요.</a></strong></li><br>
					<li><strong><a>9. 원하는 종류의 상품만 보고싶어요.</a></strong></li><br>
					<li><strong><a>10.가입 없이 자유게시판 이용하고 싶어요.</a></strong></li>
				</ul>
	        </nav>
		
			<form action="QnAServlet" method="post">
				
				<input type="text" id="qna_title" name="qna_title" placeholder="제목" required><br>
				
				<input type="text" id="qna_text" name="qna_text" placeholder="내용" required><br>
				
				<input type="file" id="fileInput" accept="image/*">
				
				<input type="submit" value="작성">
				
				<button><a href = QnAList.jsp>취소</a></button>
			
			
			</form>
		</section>
	</body>
</html>