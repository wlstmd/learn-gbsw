package jdbcCon;

import java.sql.*;
import java.util.*;

public class Connect {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		return conn;
	}
}
