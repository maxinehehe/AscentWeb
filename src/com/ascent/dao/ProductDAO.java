package com.ascent.dao;

import java.sql.*;
import java.util.*;

import com.ascent.bean.Product;
import com.ascent.util.DataAccess;
/**
 * 对商品信息进行相关操作
 * @author hehe
 * 
 */
public class ProductDAO {
	/**
	 * 查询所有商品对象
	 * @return
	 */
	public List<Product> getAllProduct(){
		List<Product>list = new ArrayList<Product>();
		Connection con = DataAccess.getConnection();  //拿到数据库连接
//		System.out.println("ProductDAO:con:"+con);
		String sql = "select * from product p where delsoft='0' order by p.id";
		Statement stmt = null;
		ResultSet rs = null;
		try{
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				Product pu = new Product();
				pu.setId(rs.getInt("id"));
				pu.setProductnumber(rs.getString("productnumber"));
				pu.setProductname(rs.getString("productname"));
				
//				delsoft==1
//				System.out.println("药名："+rs.getString("productname")); 
				
				pu.setCategoryno(rs.getString("categoryno"));
				pu.setCategory(rs.getString("category"));
				pu.setImagepath(rs.getString("imagepath"));
				pu.setIsnewproduct(rs.getString("isnewproduct"));
				pu.setPrice1(rs.getFloat("price1"));
				pu.setPrice2(rs.getFloat("price2"));
				pu.setRealstock(rs.getString("realstock"));
				
				pu.setStock(rs.getString("stock"));
				
				pu.setCas(rs.getString("cas"));
				pu.setMdint(rs.getString("mdlint"));
				pu.setFormula(rs.getString("formula"));
				pu.setWeight(rs.getString("weight"));
				pu.setDelsoft(rs.getString("delsoft"));
				pu.setNote(rs.getString("note"));
				list.add(pu);
			}
		}catch (SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null){
					rs.close();
				}
				if(stmt!=null){
					stmt.close();
				}
				if(con!=null){
					con.close();
				}
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
//		System.out.println("list长度:\n"+list.size());
		return list;	
	}
	
	// 根据商品编号查询商品
	public List<Product> getByProductId(String productid){
		List<Product>list = new ArrayList<Product>();
		Connection con = DataAccess.getConnection();  //拿到数据库连接
//		System.out.println("根据商品编号查询商品！");
		String sql = "select * from product p where p.id="+productid+" order by p.id";
		Statement stmt = null;
		ResultSet rs = null;
		try{
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				Product pu = new Product();
				
				pu.setId(rs.getInt("id"));
				pu.setProductnumber(rs.getString("productnumber"));
				pu.setProductname(rs.getString("productname"));
				pu.setCategoryno(rs.getString("categoryno"));
				pu.setCategory(rs.getString("category"));
				pu.setImagepath(rs.getString("imagepath"));
				pu.setIsnewproduct(rs.getString("isnewproduct"));
				pu.setPrice1(rs.getFloat("price1"));
				pu.setPrice2(rs.getFloat("price2"));
				pu.setRealstock(rs.getString("realstock"));
				pu.setStock(rs.getString("stock"));
				pu.setCas(rs.getString("cas"));
				pu.setMdint(rs.getString("mdlint"));
				pu.setFormula(rs.getString("formula"));
				pu.setWeight(rs.getString("weight"));
				pu.setDelsoft(rs.getString("delsoft"));
				pu.setNote(rs.getString("note"));
				
				list.add(pu);
			}
		}catch (SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null){
					rs.close();
				}
				if(stmt!=null){
					stmt.close();
				}
				if(con!=null){
					con.close();
				}
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		
		return list;	
	}
	
	/**
	 * 通过产品号查询产品
	 * @param pid
	 * @return
	 */
	public Product getProductByPid(int pid){
		Connection con = DataAccess.getConnection();  //拿到数据库连接
//		System.out.println("根据商品编号查询商品！");
		String sql = "select * from product p where p.id="+pid+" order by p.id";
		Statement stmt = null;
		ResultSet rs = null;
		Product pu = new Product();
		try{
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				pu.setId(rs.getInt("id"));
				pu.setProductnumber(rs.getString("productnumber"));
				pu.setProductname(rs.getString("productname"));
				pu.setCategoryno(rs.getString("categoryno"));
				pu.setCategory(rs.getString("category"));
				pu.setImagepath(rs.getString("imagepath"));
				pu.setIsnewproduct(rs.getString("isnewproduct"));
				pu.setPrice1(rs.getFloat("price1"));
				pu.setPrice2(rs.getFloat("price2"));
				pu.setRealstock(rs.getString("realstock"));
				pu.setStock(rs.getString("stock"));
				pu.setCas(rs.getString("cas"));
				pu.setMdint(rs.getString("mdlint"));
				pu.setFormula(rs.getString("formula"));
				pu.setWeight(rs.getString("weight"));
				pu.setDelsoft(rs.getString("delsoft"));
				pu.setNote(rs.getString("note"));
			}
			rs.close();
			stmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return pu;
	}
	
	
	
	// 商品查询 通过商品店的属性名字查询商品 
	public List<Product> searchProduct(String searchName,String searchValue){
			Connection con = DataAccess.getConnection();
			// 筛选条件
			String sql = "select * from product p where p." + searchName + " like '%"+searchValue.trim()+"%' and p.delsoft='0' ";
			Statement stm = null;
			ResultSet rs = null;
			List<Product> list = new ArrayList<Product>();
			try{
				stm = con.createStatement(); // 由 con创建statement语句
				rs = stm.executeQuery(sql);   // 提交查询
				while(rs.next()){
					Product pu = new Product();
					pu.setId(rs.getInt("id"));
					pu.setProductnumber(rs.getString("productnumber"));
					pu.setProductname(rs.getString("productname"));
					pu.setCategoryno(rs.getString("categoryno"));
					pu.setCategory(rs.getString("category"));
					pu.setImagepath(rs.getString("imagepath"));
					pu.setIsnewproduct(rs.getString("isnewproduct"));
					pu.setPrice1(rs.getFloat("price1"));
					pu.setPrice2(rs.getFloat("price2"));
					pu.setRealstock(rs.getString("realstock"));
					pu.setStock(rs.getString("stock"));
					pu.setCas(rs.getString("cas"));
					pu.setMdint(rs.getString("mdlint"));
					pu.setFormula(rs.getString("formula"));
					pu.setWeight(rs.getString("weight"));
					pu.setDelsoft(rs.getString("delsoft"));
					pu.setNote(rs.getString("note"));
					list.add(pu);
				}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				try {
					if(rs!=null){
						rs.close();
					}
					if(stm!=null){
						stm.close();
					}
					if(con!=null){
						con.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				
			}
			return list;	
	}
	
	
	/**管理员
	 * 更新产品
	 * @param pdt
	 * @throws SQLException
	 */
	public void updateProduct(Product pdt) throws SQLException {
		Connection con = DataAccess.getConnection();
		StringBuffer sql = new StringBuffer("update product  set  productnumber=?,productname=?,categoryno=?,category=?,isnewproduct=?,price1=?,price2=?,realstock=?,stock=?,cas=?,mdlint=?,formula=?,weight=?,note=? ");
		if (pdt.getImagepath() != null && !pdt.getImagepath().equals("")) {
			sql.append(",imagepath='"+pdt.getImagepath()+"' ");
		}
		sql.append(" where id=?");
		PreparedStatement pst = null;
		try {
			System.out.println("开始执行！");
			pst = con.prepareStatement(sql.toString());
			pst.setString(1, pdt.getProductnumber());
			pst.setString(2, pdt.getProductname());
			pst.setString(3, pdt.getCategoryno());
			pst.setString(4, pdt.getCategory());
			pst.setString(5, pdt.getIsnewproduct());
			pst.setFloat(6, pdt.getPrice1());
			pst.setFloat(7, pdt.getPrice2() );
			pst.setString(8, pdt.getRealstock());
			pst.setString(9, pdt.getStock());
			pst.setString(10, pdt.getCas());
			pst.setString(11, pdt.getMdint());
			pst.setString(12, pdt.getFormula());
			pst.setString(13, pdt.getWeight());
			pst.setString(14, pdt.getNote());
			pst.setInt(15, pdt.getId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(pst!=null){
					pst.close();
				}
				if(con!=null){
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/** 管理员 
	 * 删除商品  通过 产品id
	 * @param pid
	 */
	public void delProductByPid(int pid) {
		Connection con = DataAccess.getConnection();
		String sql = "delete from product where id=?";
		PreparedStatement pst = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(pst!=null){
					pst.close();
				}
				if(con!=null){
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	
	
	
	/**管理员
	 * 保存商品
	 * @param pdt
	 * @throws SQLException
	 */
	public void saveProduct(Product pdt) throws SQLException {
		Connection con = DataAccess.getConnection();
		String sql = "insert into product (productnumber,productname,categoryno,category,imagepath,isnewproduct,price1,price2,realstock,stock,cas,mdlint,formula,weight,delsoft,note) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,'0',?)";
		PreparedStatement pst = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, pdt.getProductnumber());
			pst.setString(2, pdt.getProductname());
			pst.setString(3, pdt.getCategoryno());
			pst.setString(4, pdt.getCategory());
			pst.setString(5, pdt.getImagepath());
			pst.setString(6, pdt.getIsnewproduct());
			pst.setFloat(7, pdt.getPrice1());
			pst.setFloat(8, pdt.getPrice2() );
			pst.setString(9, pdt.getRealstock());
			pst.setString(10, pdt.getStock());
			pst.setString(11, pdt.getCas());
			pst.setString(12, pdt.getMdint());
			pst.setString(13, pdt.getFormula());
			pst.setString(14, pdt.getWeight());
			pst.setString(15, pdt.getNote());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(pst!=null){
					pst.close();
				}
				if(con!=null){
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	
}
