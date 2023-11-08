package semi.qna;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/QnAServlet")
public class QnAServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// JDBC불러오기
		String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
		String jdbcUsername = "thirties";
		String jdbcPassword = "3030";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

			int qnaNo = Integer.parseInt(request.getParameter("QNA_NO"));
			String accountID = request.getParameter("ACCOUNT_ID");
			String qnaTitle = request.getParameter("QNA_TITLE");
			String qnaText = request.getParameter("QNA_TEXT");
			String qnaTime = request.getParameter("QNA_TIME");
			
			// 회원가입 insert
			String sql = "INSERT INTO BOARD_QNA (QNA_NO, ACCOUNT_ID, QNA_TITLE, QNA_TEXT, QNA_TIME) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, qnaNo);
			preparedStatement.setString(2, accountID);
			preparedStatement.setString(3, qnaTitle);
			preparedStatement.setString(4, qnaText);
			preparedStatement.setDate(5, Date.valueOf(qnaTime));
			
			preparedStatement.executeUpdate();

			request.getSession().setAttribute("QNA_NO", qnaNo);
			request.getSession().setAttribute("ACCOUNT_ID", accountID);
			request.getSession().setAttribute("QNA_TITLE", qnaTitle);
			request.getSession().setAttribute("QNA_TEXT", qnaText);
			request.getSession().setAttribute("QNA_TIME", qnaTime);
			
			// 성공할 경우 이동할 페이지 설정해주고 다시 전송
			response.sendRedirect("QnAList.jsp");
			
		} catch (SQLException e) {
			// 실패할 경우 이동할 페이지 설정
			response.sendRedirect("QnAList.jsp");
			e.printStackTrace();
		}
	}
}
