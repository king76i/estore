package struts2.util;
import java.sql.*;
public class DBConnection {
	 private String dbDriver = "com.mysql.jdbc.Driver"; //驱动类名
	 private String url = "jdbc:mysql://localhost:3306/estoredb";//连接数据库的字符串
	 public Connection connection;//数据库连接对象
	 public DBConnection(){
		 try {
				Class.forName(dbDriver).newInstance();//加载驱动
				//连接数据库，用户名root，密码root
				connection = DriverManager.getConnection(url, "root", "root");
		 }
		 catch(Exception ex){
			 ex.printStackTrace();
		 }
	 }
}
