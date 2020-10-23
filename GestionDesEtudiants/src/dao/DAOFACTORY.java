package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAOFACTORY {

    private DAOFACTORY() {	
	
    }

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/grhprojet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String user = "root";
			String mdp = "123456";
			conn=DriverManager.getConnection(url,user,mdp);
		}
		catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
}
		return conn;
	}
}
