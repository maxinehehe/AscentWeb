package com.ascent.util;

import java.util.HashMap;
import com.ascent.bean.Product;

/**
 * 完成购物功能的类
 * @author hehe
 *
 */
public class ShopCart {
	private HashMap<String,CartItem>hashmap;   // 定义私有变量
	
	public ShopCart(){    // 构造函数
		hashmap = new HashMap<String,CartItem>();  // key 为商品 id,value为商品信息以及购买数量
	}
	
	
	/**
	 * 检查hashmap中是否有了该Pid对应的对象方法
	 * @param pid商品 id
	 * @return true:有false：无
	 */
	public boolean checkHashMapid(String pid){
		boolean b = false;
		if(hashmap.containsKey(pid)){  
			b = true;
		}
		return b;
	}
	
	/**
	 * 添加商品对象
	 * @param pid 商品 id
	 * @param product 商品对象
	 */
	public void addProduct(String pid,Product product){
		if(pid!=null){  // 如果该商品存在的话
			if(hashmap.containsKey(pid)){  // 找到对应的键
				CartItem item = (CartItem)hashmap.get(pid);
				item.incre();
			}else{
				CartItem item = new CartItem(product);  // 如果不存在 则添加该商品 
				hashmap.put(pid, item);
			}
		}
	}
	
	/**
	 * 根据 id删除 hashmap中的product
	 * @param pid 
	 */
	public void removeHashMap(String pid){  // 通过键值移除
		hashmap.remove(pid);
	}
	
	/**
	 * 修改hashmap中的pid对应product的数量
	 * @param pid 商品 id
	 * @param quantity 修改数量 
	 */
	public void updateProductNumber(String pid,int quantity){
		hashmap.get(pid).setQuantity(quantity);  // 通过键 来修改键的值
	}
	
	/**
	 * 清楚购物车
	 */
	public void emptyCart(){
		hashmap.clear();  // 说白了，就是清空hashmap中的所有键值对
	}
	
	// 拿到hashmap键值对
	public HashMap<String, CartItem>getHashmap(){
		return hashmap;  // 拿到this.hashmap 
	}
	
	// 重置hashmap
	public void setHashmap(HashMap<String, CartItem>hashmap){
		this.hashmap = hashmap;
	}
	
	
}
