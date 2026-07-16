package cn.key.dbManager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManager {
	private static Connection connection = null;

	private DBManager() {
	}
	public static synchronized	Connection  getConnection() throws ClassNotFoundException, SQLException {
		if(connection == null) {
			Class.forName(IConfig.DRIVER);
			connection = DriverManager.getConnection(IConfig.URL + IConfig.DBNAME, IConfig.USERNAME, IConfig.PWD);
		}
		return connection;
	}
}
