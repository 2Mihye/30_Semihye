

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
		String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
		String jdbcUserName = "thirties";
		String jdbcPassword = "3030";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
			/*
				QNA_NO		NUMBER
				ACCOUNT_ID	VARCHAR2(60 BYTE)
				QNA_TITLE	VARCHAR2(60 BYTE)
				QNA_TEXT	VARCHAR2(3000 BYTE)
				QNA_TIME	DATE
			*/
			int qna_no = Integer.parseInt("qna_no");
			String account_id = request.getParameter("account_id");
			String qna_title = request.getParameter("qna_title");
			String qna_text = request.getParameter("qna_text");
			String qna_time = request.getParameter("qna_time");
			
			String sql = "INSERT INTO BOARD_QNA (qna_no, account_id, qna_title, qna_text, qna_time VALUES (?, ?, ?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, qna_no);
			preparedStatement.setString(2, account_id);
			preparedStatement.setString(3, qna_title);
			preparedStatement.setString(4, qna_text);
			preparedStatement.setDate(5, Date.valueOf(qna_time));
			
			preparedStatement.executeUpdate();
			
			request.getSession().setAttribute("qna_no", qna_no);
			request.getSession().setAttribute("account_id", account_id);
			request.getSession().setAttribute("qna_title", qna_title);
			request.getSession().setAttribute("qna_text", qna_text);
			request.getSession().setAttribute("qna_time", qna_time);
			
			response.sendRedirect("");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("");
			e.printStackTrace();
		}
	}

}
