package struts2.dao;

import java.util.ArrayList;

import struts2.entity.CategoryMainEntity;
import struts2.entity.ProductEntity;
import struts2.util.DBConnection;

import java.sql.*;

public class ProductDao {
	private Connection conn;
	public ProductDao(){
		conn = new DBConnection().connection;
	}

	public ArrayList<ProductEntity> selectAllProduct() {
		// TODO Auto-generated method stub
		ArrayList<ProductEntity> list = new ArrayList<ProductEntity>();
		try{
			PreparedStatement ps = conn.prepareStatement("select * from tb_product");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ProductEntity product = new ProductEntity();
				product.setId(rs.getInt(1));
				product.setCategoryMainId(rs.getInt(2));
				product.setCategoryBranchId(rs.getInt(3));
				product.setName(rs.getString(4));
				product.setProducingArea(rs.getString(5));
				product.setDescription(rs.getString(6));
				product.setCreateTime(rs.getDate(7));
				product.setMarketPrice(rs.getFloat(8));
				product.setSellPrice(rs.getFloat(9));
				product.setProductAmount(rs.getFloat(10));
				product.setPicture(rs.getString(11));
				product.setDiscount(rs.getInt(12));
				list.add(product);
			}
		}catch(SQLException ex){
		}
		return list;
	}

	public void insertProduct(ProductEntity product) {
		// TODO Auto-generated method stub
		try{
			PreparedStatement ps = conn.prepareStatement("insert into tb_product(category_main_id,category_branch_id,name,producing_area,description,market_price,sell_price,picture) values(?,?,?,?,?,?,?,?)");
			ps.setInt(1, product.getCategoryMainId());
			ps.setInt(2, product.getCategoryBranchId());
			ps.setString(3, product.getName());
			ps.setString(4, product.getProducingArea());
			ps.setString(5, product.getDescription());
			ps.setFloat(6, product.getMarketPrice());
			ps.setFloat(7, product.getSellPrice());
			ps.setString(8, product.getPicture());
			ps.executeUpdate();
			ps.close();
			
		}catch(SQLException ex){
		}
	}

}
