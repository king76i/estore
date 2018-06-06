package struts2.dao;

import java.sql.*;
import java.util.ArrayList;

import struts2.entity.ManagerEntity;
import struts2.util.DBConnection;


public class ManagerDao {
	private Connection conn;
	public ManagerDao(){
		conn = new DBConnection().connection;
	}
	public ManagerEntity login(String name , String password){
		ManagerEntity manager = null;
		try{
			PreparedStatement ps = conn.prepareStatement("select * from tb_manager where name = ? and password = ?");
			ps.setString(1, name);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				manager = new ManagerEntity();
				manager.setId(rs.getInt(1));
				manager.setName(rs.getString(2));
				manager.setPassword(rs.getString(3));
				manager.setRealName(rs.getString(4));
				manager.setSign(rs.getInt(5));
			}
		}catch(SQLException ex){
	
		}
		return manager;
	}
	public ArrayList<ManagerEntity> selectManager(){
		ArrayList<ManagerEntity> list = new ArrayList<ManagerEntity>();
		try{
			PreparedStatement ps = conn.prepareStatement("select * from tb_manager order by id DESC");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ManagerEntity manager = new ManagerEntity();
				manager.setId(rs.getInt(1));
				manager.setName(rs.getString(2));
				manager.setPassword(rs.getString(3));
				manager.setRealName(rs.getString(4));
				manager.setSign(rs.getInt(5));
				list.add(manager);
			}
		}catch(SQLException ex){
			
		}
		return list;
	}
	public void deletetManager(int id){
		try{
			PreparedStatement ps = conn.prepareStatement("delete from tb_manager where id = ?");
			ps.setInt(1, id);
			ps.executeUpdate();
			ps.close();
		}catch(SQLException ex){
			
		}
	}
	public boolean insertManager(ManagerEntity manager){
		try{
			PreparedStatement ps = conn.prepareStatement("insert into tb_manager(name,password,real_name,sign) values(?,?,?,?)");
			ps.setString(1, manager.getName());
			ps.setString(2, manager.getPassword());
			ps.setString(3, manager.getRealName());
			ps.setInt(4, manager.getSign());
			ps.executeUpdate();
			ps.close();
		return true;
		}catch(SQLException ex){
		return false;
		}
	}
	public boolean checkManagerName(String name){
		try{
			PreparedStatement ps = conn.prepareStatement("select * from tb_manager where name = ?");
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				return true;
			}
		}catch(SQLException ex){	
		}
		return false;
	}
	public void updateManagerPassword(ManagerEntity manager){
		try{
			PreparedStatement ps = conn.prepareStatement("update tb_manager set password = ? where id = ?");
			ps.setString(1, manager.getPassword());
			ps.setInt(2, manager.getId());
			ps.executeUpdate();
			ps.close();
		}catch(SQLException ex){	
		}
	}
}
