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
	
	public List<QnA> getAllProducts(){
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
	
	public QnA getQnaNo(int qnaNo) {
		QnA qna = null;
		// select�ؼ� �ϳ��� �� �� �ִ� ���� �ۼ��ϰ� new Product �̿��ؼ� �� ��������
		String selectSql = "SELECT qna_no, qna_title, account_id, qna_time FROM board_qna";
		return qna;
	}
}
