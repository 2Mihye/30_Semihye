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
		List<QnA> qnas = new ArrayList<>();
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
				qnas.add(qna);
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return qnas;
	}
	
	
	/*
	public QnA getQnaAccount(String accountsID) {
		QnA qna = null;
		// select해서 하나만 볼 수 있는 쿼리 작성하고 new Product 이용해서 값 가져오기
		String selectSql = "SELECT * FROM board_qna WHERE account_id = ?";
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, userName, password);
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
	}*/

	public QnA getQnaNo(int qnaNos) {
		QnA qna = null;
		String selectSql = "SELECT * FROM board_qna WHERE qna_no = ?";
	
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, userName, password);
			PreparedStatement ps = connection.prepareStatement(selectSql);
			ps.setInt(1, qnaNos);
			ResultSet resultSet = ps.executeQuery();
			
			if(resultSet.next()) {
				int qnaNo = resultSet.getInt("qna_NO");
				String accountID = resultSet.getString("account_ID");
				String qnaTitle = resultSet.getString("qna_Title");
				String qnaText = resultSet.getString("qna_Text");
				Date qnaTime = resultSet.getDate("qna_Time");
				
				qna = new QnA (qnaNo, accountID, qnaTitle, qnaText, qnaTime);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return qna;
	}
	
	
	
	public int update(QnA qna) {  // write와 비슷한 성격을 가지고 있음.
		int result = 0;
		Connection connection;
		String SQL = "UPDATE board_qna SET qna_title = ?, qna_text = ? WHERE qna_no = ?";
		try {
			connection = DriverManager.getConnection(jdbcURL, userName, password);
	        PreparedStatement ps = connection.prepareStatement(SQL);
	        ps.setString(1, qna.getQnaTitle());
	        ps.setString(2, qna.getQnaText());
	        ps.setInt(3, qna.getQnaNo());
	        result = ps.executeUpdate();	
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    return result;
	}
	
	
	
	
	public int delete(int qnaNo) {
		int result = 0;
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, userName, password);
			
			String sql = "DELETE FROM board_qna WHERE qna_no = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, qnaNo);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
