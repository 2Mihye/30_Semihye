package semi.qna;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QnADAO {
	private static final String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String userName = "thirties";
	private static final String password = "3030";
	
	public QnADAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public List<QnA> getAllQnAs(){
		List<QnA> qnAs = new ArrayList<>();
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, userName, password);
			String sql = "SELECT * FROM board_qna";
			PreparedStatement ps = connection.prepareStatement(sql);
			
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next()) {
				int qnaNo = resultSet.getInt("qna_no");
				String accountID = resultSet.getString("account_id");
				String qnaTitle = resultSet.getString("qna_title");
				String qnaText = resultSet.getString("qna_text");
				Date qnaTime = resultSet.getDate("qna_time");
				
				QnA qna = new QnA(qnaNo, accountID, qnaTitle, qnaText, qnaTime);
				qnAs.add(qna);
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return qnAs;
	}
	
	public QnA getQnaNo(String accountsID) {
		QnA qna = null;
		// select해서 하나만 볼 수 있는 쿼리 작성하고 new Product 이용해서 값 가져오기
		String selectSql = "SELECT * FROM board_qna WHERE account_id = ?";
		try {
			Connection connection = DriverManager.getConnection(selectSql, selectSql, selectSql);
			PreparedStatement ps = connection.prepareStatement(selectSql);
			
			ps.setString(1, accountsID);
			
			ResultSet resultSet = ps.executeQuery();
			
			if(resultSet.next()) {
				int qnaNo = resultSet.getInt("qnaNO");
				String accountID = resultSet.getString("accountID");
				String qnaTitle = resultSet.getString("qnaTitle");
				String qnaText = resultSet.getString("qnaText");
				Date qnaTime = resultSet.getDate("qnaTime");
				
				qna = new QnA (qnaNo, accountID, qnaTitle, qnaText, qnaTime);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return qna;
	}
}
