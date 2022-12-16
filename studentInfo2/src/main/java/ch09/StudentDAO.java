package ch09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentDAO {
	Connection conn = null; // Connection : 데이터베이스 연결담당.
	PreparedStatement pstmt; // 쿼리문의 실행을 담당한다.
	
	// jdbc: 자바하고 DB를 연결해주는 api -> ojbcd6.jar
	final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String JDBC_URL= "jdbc:oracle:thin:@localhost:1521:xe";
	
	// DB 연결 메소드
	public void open() {
		try {
			Class.forName(JDBC_DRIVER); // 드라이버 로드
			conn = DriverManager.getConnection(JDBC_URL, "test", "test1234"); // DB 연결
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// DB닫는 메소드
	public void close() {
		try {
			//★ pstmt, conn은 리소스(데이터를 읽고 쓰는 객체) 이므로 사용 후 반드시 닫아야 함.
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 학생 정보를 다 불러온다.
	public ArrayList<Student> getAll() {
		open(); // DB 오픈
		ArrayList<Student> students = new ArrayList<>(); // student 객체를 담을 List준비
		
		try {
			pstmt = conn.prepareStatement("select * from student"); // 실행할 쿼리문 입력
			ResultSet rs = pstmt.executeQuery(); // 쿼리문 실행 (select문 사용시 사용) 
			// ResultSet : DB 데이터 받는 역할
			
			while(rs.next()) { // 한 행씩 값이 있는지 없는지 판단.
				Student s = new Student();
				s.setId(rs.getInt("id"));
				s.setUsername(rs.getString("username")); // 이름
				s.setUniv(rs.getString("univ"));
				s.setBirth(rs.getDate("birth"));
				s.setEmail(rs.getString("email"));
				
				students.add(s);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return students;
		
	}
	
	// 학생 정보를 입력.
	public void insert(Student s) {
		open();
		// 물음표: 어떤 데이터가 들어올지 모른다.
		String sql = "insert into student values(id_seq.nextval, ?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql); // 실행할 쿼리문 입력
			// 오라클의 데이터 타입으로 변환
			pstmt.setString(1, s.getUsername()); // pstmt.setString (값을 넣어줄 위치, 넣어줄 데이터);
			pstmt.setString(2, s.getUniv());
			pstmt.setDate(3, s.getBirth());
			pstmt.setString(4, s.getEmail());
			
			pstmt.executeUpdate(); // insert, delete, update 실행 시
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	
	
	
	
	
	
	
	
}
