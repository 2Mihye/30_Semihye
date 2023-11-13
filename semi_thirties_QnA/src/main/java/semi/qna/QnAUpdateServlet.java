package semi.qna;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/QnAUpdateServlet")
public class QnAUpdateServlet extends HttpServlet {
	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
		String userName = "thirties";
		String password = "3030";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
	    String SQL = "UPDATE board_qna SET qna_title = ?, qna_text = ? WHERE qna_no = ?";
	    try {
	    	Connection connection = DriverManager.getConnection(jdbcURL, userName, password);
			String  qna_title = request.getParameter("qna_title");
			String qna_text = request.getParameter("qna_text");
			
			
	        PreparedStatement ps = connection.prepareStatement(SQL);
	        
	        ResultSet resultSet = ps.executeQuery();
	        int qnaNo = resultSet.getInt("qna_NO");
	        ps.setString(1, qna_title); 
	        ps.setString(2, qna_text); 
	        ps.setInt(3, qnaNo);	
	        ps.executeUpdate();	
	        
	        response.sendRedirect("QnAList.jsp");
	    }catch(Exception e) {e.printStackTrace();
	    
	    }
	}*/

}
