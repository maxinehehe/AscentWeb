package com.ascent.bean;
/**
 * 刘贺贺
 * @author hehe
 *
 */
@SuppressWarnings("serial")
public class Usr implements java.io.Serializable{
	//���л�
	//Fields
	private Integer id; //�û�ID
	private String username;//�û���
	private String password;//����
	private String fullname;//�û�ȫ��
	private String title;//ְ�Ƽ���
	private String companyname;//��˾���
	private String companyaddress;//��˾��ַ
	private String city;//����
	private String job;//����ְλ
	private String tel;//��ϵ�绰
	private String email;//�����ʼ�
	private String country;//���
	private String zip;//�������
	private String superuser;//�û���ɫȨ�� 3�߼�����Ա��2����Ա 1��ͨ�û�
	private String delsoft;//���ɾ���־ 1 ��ɾ�� 0 ��
	private String note;//��ע
	
	public Usr(){
	}
//	public Usr(String username,String password,String fullname,String title,String)

	public Usr(String username, String password, String fullname,
			String title, String companyname, String companyaddress,
			String city, String job, String tel, String email, String country,
			String zip, String superuser, String delsoft, String note) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.title = title;
		this.companyname = companyname;
		this.companyaddress = companyaddress;
		this.city = city;
		this.job = job;
		this.tel = tel;
		this.email = email;
		this.country = country;
		this.zip = zip;
		this.superuser = superuser;
		this.delsoft = delsoft;
		this.note = note;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getCompanyaddress() {
		return companyaddress;
	}

	public void setCompanyaddress(String companyaddress) {
		this.companyaddress = companyaddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getSuperuser() {
		return superuser;
	}

	public void setSuperuser(String superuser) {
		this.superuser = superuser;
	}

	public String getDelsoft() {
		return delsoft;
	}

	public void setDelsoft(String delsoft) {
		this.delsoft = delsoft;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	
	
}
