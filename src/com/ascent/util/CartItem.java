package com.ascent.util;

import com.ascent.bean.Product;

/**
 * 用来封装购物车里的一项商品
 * @author hehe
 *
 */
public class CartItem {
	
	private Product product;
	private int quantity;
	
	/**
	 * @param Product
	 */
	public CartItem(Product product){
		quantity = 1;
		this.product = product;
	}
	
	// 表示所购买商品数量加 1 
	public void incre(){
		quantity++;
	}
	
	/**
	 * @return the product
	 */
	
	public Product getProduct(){
		return product;
	}
	
	/**
	 * @param product
	 *    the product to set
	 */
	public void setProduct(Product product){
		this.product = product;
	}
	
	/**
	 * @return the quantity
	 */
	public int getQuantity(){
		return quantity;
	}
	
	/**
	 * @param Quantity 
	 *        the quantity to set
	 */
	
	public void setQuantity(int quantity){
		this.quantity = quantity;
	}
}
