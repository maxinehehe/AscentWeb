package sample;
/******************************************************************************
 * @Package:      [.MailInfo.java]  
 * @ClassName:    [MailInfo]   
 * @Description:  []   
 * @Author:       [kundian.huo]   
 * @CreateDate:   [2014-2-24 上午10:30:37]   
 * @UpdateUser:   [kundian.huo(如多次修改保留历史记录，增加修改记录)]   
 * @UpdateDate:   [2014-2-24 上午10:30:37，(如多次修改保留历史记录，增加修改记录)]   
 * @UpdateRemark: [说明本次修改内容,(如多次修改保留历史记录，增加修改记录)]  
 * @Version:      [v1.0] 
 */

public class MailInfo {
	
	private String host ;
	private String formName ;
	private String formPassword ;
	
	private String replayAddress ;
	private String toAddress ;
	
	private String subject ;
	private String content ;
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public String getFormPassword() {
		return formPassword;
	}
	public void setFormPassword(String formPassword) {
		this.formPassword = formPassword;
	}
	public String getReplayAddress() {
		return replayAddress;
	}
	public void setReplayAddress(String replayAddress) {
		this.replayAddress = replayAddress;
	}
	public String getToAddress() {
		return toAddress;
	}
	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
