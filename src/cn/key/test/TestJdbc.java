package cn.key.test;

import java.sql.SQLException;

import cn.key.dbManager.DBManager;

public class TestJdbc {
	public static void main(String[] args) {
		try {
			System.out.println(DBManager.getConnection());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
