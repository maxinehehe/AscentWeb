package com.ascent.bean;

/**
 * 描述产品信息的类
 * @author hehe
 *
 */
@SuppressWarnings("Serial")
public class Product implements java.io.Serializable{
	private Integer id; //商品ID
	private String productnumber; //商品编号
	private String productname; //商品名称
	private String categoryno; //商品分类编号
	private String category; // 商品分类名称
	private String imagepath; //商品图片名称
	private String isnewproduct; //是否是新的商品 1-TRUE，0-false
	private float price1; //价格
	private float price2; //会员价格
	private String stock; //剩余量
	private String realstock; //库存量
	private String cas; //商品摘要
	
	private String mdint; // mdl编号
	private String formula; //化学方程式
	private String weight; //重量
	private String note; //备注
	private String delsoft; // 软删除标志 1 为软删除 0为正常
	public Product(){}
	// 自动生成构造函数
	public Product(Integer id, String productnumber, String productname,
			String categoryno, String category, String imagepath,
			String isnewproduct, float price1, float price2, String stock,
			String realstock, String cas, String mdint, String formula,
			String weight, String note, String delsoft) {
		super();
		this.id = id;
		this.productnumber = productnumber;
		this.productname = productname;
		this.categoryno = categoryno;
		this.category = category;
		this.imagepath = imagepath;
		this.isnewproduct = isnewproduct;
		this.price1 = price1;
		this.price2 = price2;
		this.stock = stock;
		this.realstock = realstock;
		this.cas = cas;
		this.mdint = mdint;
		this.formula = formula;
		this.weight = weight;
		this.note = note;
		this.delsoft = delsoft;
	}
	
	
	//Property accessors 生成get和set方法
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProductnumber() {
		return productnumber;
	}
	public void setProductnumber(String productnumber) {
		this.productnumber = productnumber;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getCategoryno() {
		return categoryno;
	}
	public void setCategoryno(String categoryno) {
		this.categoryno = categoryno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public String getIsnewproduct() {
		return isnewproduct;
	}
	public void setIsnewproduct(String isnewproduct) {
		this.isnewproduct = isnewproduct;
	}
	public float getPrice1() {
		return price1;
	}
	public void setPrice1(float price1) {
		this.price1 = price1;
	}
	public float getPrice2() {
		return price2;
	}
	public void setPrice2(float price2) {
		this.price2 = price2;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getRealstock() {
		return realstock;
	}
	public void setRealstock(String realstock) {
		this.realstock = realstock;
	}
	public String getCas() {
		return cas;
	}
	public void setCas(String cas) {
		this.cas = cas;
	}
	public String getMdint() {
		return mdint;
	}
	public void setMdint(String mdint) {
		this.mdint = mdint;
	}
	public String getFormula() {
		return formula;
	}
	public void setFormula(String formula) {
		this.formula = formula;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getDelsoft() {
		return delsoft;
	}
	public void setDelsoft(String delsoft) {
		this.delsoft = delsoft;
	}
	
}
