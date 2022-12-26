package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VaccineDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sys1234");
		return con;
	}
	
	public String reserv(HttpServletRequest request, HttpServletResponse response) {
		
		String resv_no = request.getParameter("resv_no");
		String jumin = request.getParameter("jumin");
		String vcode = request.getParameter("vcode");
		String hospcode = request.getParameter("hospcode");
		String resvdate = request.getParameter("resvdate");
		String resvtime = request.getParameter("resvtime");
		
		int result = 0;
		
		try {
			conn = getConnection();
			
			String sql = "insert into tbl_vaccresv_202108 values(?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, resv_no);
			ps.setString(2, jumin);
			ps.setString(3, vcode);
			ps.setString(4, hospcode);
			ps.setString(5, resvdate);
			ps.setString(6, resvtime);
			
			result = ps.executeUpdate();
			
			conn.close();
			ps.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return "reserv.jsp";
		
	}
	
}
