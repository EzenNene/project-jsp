package DAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.Board;
import DTO.Photographer;
import DTO.Reserv;

public class PhotoDAO {
	final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";

	public Connection open() {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "photo", "photo1234");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn; // 데이터 베이스의 연결 객체를 리턴
	}

	// 포토그래퍼 리스트 조회

	public ArrayList<Photographer> getList() throws Exception {
		Connection conn = open();
		ArrayList<Photographer> photographerList = new ArrayList<>();

		String sql = "SELECT p_id, p_name, p_img, p_intro, p_phone, p_email, p_loc FROM photographer";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		try (conn; pstmt; rs) {
			while (rs.next()) {
				Photographer p = new Photographer();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setP_img(rs.getString(3));
				p.setP_intro(rs.getString(4));
				p.setP_phone(rs.getString(5));
				p.setP_email(rs.getString(6));
				p.setP_loc(rs.getString(7));

				photographerList.add(p);
			}
			return photographerList;
		}

	}

	// 포토그래퍼 포트폴리오 조회

	public Photographer getPortfolio(int p_id) throws Exception {
		Connection conn = open();
		Photographer p = new Photographer();

		String sql = "SELECT p_id, p_name, p_img, p_intro, p_phone, p_email, p_loc FROM photographer where p_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql); // 쿼리문 등록
		pstmt.setInt(1, p_id); // 쿼리문에 값 넣어줌
		ResultSet rs = pstmt.executeQuery(); // 쿼리문 실행

		try (conn; pstmt; rs) {
			while (rs.next()) {
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setP_img(rs.getString(3));
				p.setP_intro(rs.getString(4));
				p.setP_phone(rs.getString(5));
				p.setP_email(rs.getString(6));
				p.setP_loc(rs.getString(7));

			}
			return p;
		}

	}
	
	// 예약페이지 적어내기 (실행)
		public void reservwritePage(Reserv r) throws Exception {
			Connection conn = open();

			String sql = "insert into reserv(reserv_id, m_name, concept) values(r_id_seq.nextval, ?, ?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);

			try (conn; pstmt) {
				pstmt.setInt(1, r.getReserv_id());
				pstmt.setString(2, r.getM_name());
				pstmt.setString(3, r.getConcept());
				pstmt.executeUpdate();
			}
		}
	

		// 예약목록(내용) 가져오기
		public ArrayList<Reserv> getReservList() throws Exception {
			Connection conn = open();
			ArrayList<Reserv> reservList = new ArrayList<>(); // Reserv 객체를 저장할 arraylist
			
			String sql = "select reserv_id, m_name, concept from reserv order by reserv_id";
			//String sql = "select reserv_id, m_name, concept from reserv where p_id=1 order by reserv_id";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			try (conn; pstmt; rs) {
				while (rs.next()) {
					Reserv r = new Reserv();
					r.setReserv_id(rs.getInt(1));
					r.setM_name(rs.getString(2));
					r.setConcept(rs.getString(3));
					
					reservList.add(r);
				}
				return reservList;
			}
		}
		
}
