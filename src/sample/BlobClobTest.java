package sample;

import java.io.*;
import java.sql.*;
public class BlobClobTest {
	/**
	 * 存储图片，视频使用。
	 * 注意：blob只能存储不超过64K的文件。longblob能存储更大的数据文件。
	 * clob一般用于存储较长的文本文件。
	 */
	Connection con=null;
	public static void main(String[] args) {
		BlobClobTest bTest = new BlobClobTest();
		try{
			//注册驱动
			Class.forName("com.mysql.jdbc.Driver");
			bTest.con = DriverManager.getConnection("jdbc:mysql://localhost/testdb","root","1234");
			
		}catch(Exception e){
			System.out.println("打开数据库失败！");
			System.out.println("e:"+e);
		}
		//否则打开成功提交数据
		System.out.println("打开数据库成功！");
//		bTest.putBlob();
		bTest.getBlob();

	}
	
	public void putBlob(){
		//从文件读二进制数据，写到数据库
		try{
			String sql = "insert into blobTable(ID,Binaryfile) values(?,?)";
			PreparedStatement pstm = con.prepareStatement(sql);
			File f = new File("F:\\meps.jpg");	// 读入图片
			FileInputStream in = new FileInputStream(f);
			pstm.setInt(1, 1);
			pstm.setBinaryStream(2, in,(int)f.length());
			pstm.execute();
			pstm.close();
			in.close();
			System.out.println("写入成功！");
		}catch(Exception e){
			System.out.println("写入失败！");
			e.printStackTrace();
		}
	}
	
	public void getBlob(){
		try{
			File f = new File("F:\\newme.jpg");
			FileOutputStream out = new FileOutputStream(f);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select binaryfile from blobTable where id=1 ");
			rs.next();
			Blob blob = rs.getBlob("binaryfile");
			InputStream in = blob.getBinaryStream();
			int i = 0;
			while((i=in.read())!=-1)
				out.write(i);
		    in.close();
		    System.out.println("拿到内容！");
		}catch(Exception e){
			System.out.println("失败！");
			e.printStackTrace();
		}
	}

}
