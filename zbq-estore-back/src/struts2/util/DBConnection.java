package struts2.util;
import java.sql.*;
public class DBConnection {
	 private String dbDriver = "com.mysql.jdbc.Driver"; //��������
	 private String url = "jdbc:mysql://localhost:3306/estoredb";//�������ݿ���ַ���
	 public Connection connection;//���ݿ����Ӷ���
	 public DBConnection(){
		 try {
				Class.forName(dbDriver).newInstance();//��������
				//�������ݿ⣬�û���root������root
				connection = DriverManager.getConnection(url, "root", "root");
		 }
		 catch(Exception ex){
			 ex.printStackTrace();
		 }
	 }
}
