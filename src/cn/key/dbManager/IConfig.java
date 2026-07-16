//package cn.key.dbManager;
//
//public interface IConfig {
//	public static final String DRIVER = "com.mysql.jdbc.Driver";
//	public static final String URL = "jdbc:mysql://localhost:3306/";
//	//public static final String URL = "jdbc:mysql://localhost:3306/ygcbook?serverTimezone=Asia/Shanghai&useSSL=false&allowPublicKeyRetrieval=true";
//	public static final String DBNAME = "ygcBook";
//	//public static final String DBNAME = "";
//	public static final String USERNAME = "root";
//	public static final String PWD = "";
//	
//}

package cn.key.dbManager;

public interface IConfig {
    public static final String DRIVER = "com.mysql.jdbc.Driver";
    // 补全数据库名ygcbook + 时区+关闭SSL消除警告
    public static final String URL= "jdbc:mysql://localhost:3306/ygcBook?useSSL=false&useUnicode=true&characterEncoding=UTF-8";
    public static final String DBNAME = "";
    public static final String USERNAME = "root";
    // 改成你本机MySQL root密码，无密码填""，有密码写实际密码
    public static final String PWD = "";
}