package struts2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import struts2.entity.CategoryBranchEntity;
import struts2.util.DBConnection;

public class CategoryBranchDao {
	private Connection conn;
	public CategoryBranchDao(){
		conn = new DBConnection().connection;
	}
	public ArrayList<CategoryBranchEntity> selectBranchCategoryByMainId(int mainId) {
		// TODO Auto-generated method stub
		ArrayList<CategoryBranchEntity> list = new ArrayList<CategoryBranchEntity>();
		try{
			PreparedStatement pStmt = conn.prepareStatement("SELECT * FROM tb_category_branch  WHERE  category_main_id =?");
			pStmt.setInt(1,mainId );
			ResultSet rs = pStmt.executeQuery();//执行查询，返回结果集rs
			while(rs.next()){
				CategoryBranchEntity  category = new CategoryBranchEntity();
				category.setId(rs.getInt(1));
				category.setName(rs.getString(3));
				list.add(category);
			}
		}catch(SQLException ex){
			
		}
		return list;
	}

}
