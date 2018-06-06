package struts2.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import struts2.entity.CategoryMainEntity;
import struts2.util.DBConnection;

public class CategoryMainDao {
	private Connection conn;
	public CategoryMainDao(){
		conn = new DBConnection().connection;
	}
		public List<CategoryMainEntity> selectMainCategory(){
			List<CategoryMainEntity> CategoryMainList = new ArrayList<CategoryMainEntity>();
			try {
				PreparedStatement pStmt = conn.prepareStatement("select * from tb_category_main");
				ResultSet rs = pStmt.executeQuery();//执行查询，返回结果集rs
				//遍历结果集，将每一个商品的数据设置到一个ProductEntity对象上，并将该对象加入列表中	
				while(rs.next()){
					CategoryMainEntity e = new CategoryMainEntity();
					e.setId(rs.getInt(1));//取出当前行第一列的数据，即“id”列，将其值设置到ProductEntity对象的id属性上
					e.setName(rs.getString(2));//取出当前行的第二列数据，即“category_main_id”列
					e.setCreateTime(rs.getDate(3));//取出当前行的第三列数据，即“category_branch_id”列
					CategoryMainList.add(e);
				}
				rs.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return CategoryMainList;
			
	}
		public boolean insertManager(CategoryMainEntity category) {
			// TODO Auto-generated method stub
			try{
				PreparedStatement ps = conn.prepareStatement("insert into tb_category_main(name) values(?)");
				ps.setString(1, category.getName());
				ps.executeUpdate();
				ps.close();
			return true;
			}catch(SQLException ex){
			return false;
			}
		}
		public boolean checkCategoryName(String name) {
			// TODO Auto-generated method stub
			try{
				PreparedStatement ps = conn.prepareStatement("select * from tb_category_main where name = ?");
				ps.setString(1, name);
				
				ResultSet rs = ps.executeQuery();
				if(rs.next()){
					return true;
				}
			}catch(SQLException ex){	
			}
			return false;
		}
		public void updateMainCategory(CategoryMainEntity category) {
			// TODO Auto-generated method stub
			try{
				PreparedStatement ps = conn.prepareStatement("update tb_category_main set name = ? where id = ?");
				ps.setString(1, category.getName());
				ps.setInt(2, category.getId());
				ps.executeUpdate();
				ps.close();
			}catch(SQLException ex){	
			}
		}
		public boolean checkMainCategory(CategoryMainEntity category){//返回ture时 不能删除大类别
			try{
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM tb_category_branch WHERE category_main_id = ?");
				ps.setInt(1,category.getId());
				ResultSet rs = ps.executeQuery();
				//boolean a = (rs.next());
				//System.out.println(a);
				if(rs.next()){
					return true;
				}	
			}catch(SQLException ex){	
			}
			return false;
		}
		public void deletetMainCategory(int id){
			try{
				PreparedStatement ps = conn.prepareStatement("delete from tb_category_main where id = ?");
				ps.setInt(1, id);
				ps.executeUpdate();
				ps.close();
			}catch(SQLException ex){
			}
		}
		
		
	}

