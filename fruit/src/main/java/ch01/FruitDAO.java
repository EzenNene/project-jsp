package ch01;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class FruitDAO {
	Connection conn = null;
	PreparedStatement pstmt;
	
	final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String JDBC_URL= "jdbc:oracle:thin:@localhost:1521:xe";
}
