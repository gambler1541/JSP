package kr.ac.mvc.model;

public class UserBean {
	
	private String userid;
	private String passwd;
	private String tel;
	
	private String dbUserid;
	private String dbPasswd;
	private String dbTel;
	
	public UserBean() {
		// 생성자
		// 인증에 사용할 기본값 설정.
		// 현재 저장하는 사용자와 암호인 경우 로그인 성공
		dbUserid = "mvc";
		dbPasswd = "model";
		dbTel = "01045191005";
	}

	public boolean getCheckUser() {
		if(userid.equals(dbUserid) && passwd.equals(dbPasswd) && tel.equals(dbTel))
			return true;
		else
			return false;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}