package semi.qna;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/QnAPostServlet")
public class QnAPostServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
		String userName = "thirties";
		String password = "3030";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, userName, password);

			//int QNA_NO = Integer.parseInt(request.getParameter("QNA_NO"));
			String ACCOUNT_ID = request.getParameter("ACCOUNT_ID");
			String QNA_TITLE = request.getParameter("QNA_TITLE");
			String QNA_TEXT = request.getParameter("QNA_TEXT");
			String QNA_TIME = request.getParameter("QNA_TIME");
			
			String sql = "INSERT INTO BOARD_QNA (QNA_NO, ACCOUNT_ID, QNA_TITLE, QNA_TEXT, QNA_TIME) VALUES (board_qna_seq.nextval, ?, ?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, ACCOUNT_ID);
			preparedStatement.setString(2, QNA_TITLE);
			preparedStatement.setString(3, QNA_TEXT);
			preparedStatement.setTimestamp(4, new Timestamp(new Date().getTime()));
			
			preparedStatement.executeUpdate();
			
			/*
			request.getSession().setAttribute("QNA_NO", qnaNo);
			request.getSession().setAttribute("ACCOUNT_ID", accountID);
			request.getSession().setAttribute("QNA_TITLE", qnaTitle);
			request.getSession().setAttribute("QNA_TEXT", qnaText);
			request.getSession().setAttribute("QNA_TIME", qnaTime);
			*/
			// 성공할 우 이동할 페이지 설정해주고 다시 전송
			response.sendRedirect("QnAList.jsp");
			
		} catch (SQLException e) {
			// 실패할 경우 이동할 페이지 설정
			response.sendRedirect("QnAList.jsp");
			e.printStackTrace();
		}
	}
	

}
