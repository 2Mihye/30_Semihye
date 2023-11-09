package semi.qna;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/QnAServlet")
public class QnAServlet extends HttpServlet {
	// JDBC�ҷ�����
	String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	String userName = "thirties";
	String password = "3030";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, userName, password);

			int qnaNo = Integer.parseInt(request.getParameter("QNA_NO"));
			String accountID = request.getParameter("ACCOUNT_ID");
			String qnaTitle = request.getParameter("QNA_TITLE");
			String qnaText = request.getParameter("QNA_TEXT");
			String qnaTime = request.getParameter("QNA_TIME");
			
			// ȸ������ insert
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
			
			// ������ �� �̵��� ������ �������ְ� �ٽ� ����
			response.sendRedirect("QnAList.jsp");
			
		} catch (SQLException e) {
			// ������ ��� �̵��� ������ ����
			response.sendRedirect("QnAList.jsp");
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// �����ͺ��̽� ����
		Connection connection = null;
		try {
			Class.forName("oracle. jdbc.OracleDriver");// Class.forName("oracle.jdbc.driver.OracleDriver); ���� ���� ����ǳ� ������ ����� �����̶� �� ������ ���� �� �� ����.
			connection = DriverManager.getConnection(jdbcURL, userName, password);
			// SQL ����
			String sql = "SELECT * FROM board_qna";
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet resultSet =  ps.executeQuery();
			
			// ��ǰ ����� ������ ��ٱ��ϰ��� ArrayList ����
			ArrayList<QnA> productList = new ArrayList<>();
			
			while(resultSet.next()) {
				int qnaNo = resultSet.getInt("qna_no");
				String accountID = resultSet.getString("account_id");
				String qnaTitle = resultSet.getString("qna_title");
				String qnaText = resultSet.getString("qna_text");
				Date qnaTime = resultSet.getDate("qna_time");
				
				QnA qna = new QnA(qnaNo, accountID, qnaTitle, qnaText, qnaTime);
					// productList�� ��ǰ���� �ϳ��� add�ؼ� �־���
				productList.add(qna);			
			}
			
			// JSP ��ǰ��� �������� ��ǰ ����� �������� !
			request.setAttribute("productList", productList);
			request.getRequestDispatcher("/productList.jsp").forward(request, response);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
}
