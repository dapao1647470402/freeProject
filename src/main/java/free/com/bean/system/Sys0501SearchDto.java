package free.com.bean.system;

import java.io.Serializable;
import java.util.Date;

public class Sys0501SearchDto implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Sys0501SearchDto() {
	}

	private String accountName;
	private Date registerTime;
	private String roleId;

	/**
	 * @return the accountName
	 */
	public String getAccountName() {
		return accountName;
	}

	/**
	 * @param accountName the accountName to set
	 */
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	/**
	 * @return the registerTime
	 */
	public Date getRegisterTime() {
		return registerTime;
	}

	/**
	 * @param registerTime the registerTime to set
	 */
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	/**
	 * @return the roleId
	 */
	public String getRoleId() {
		return roleId;
	}

	/**
	 * @param roleId the roleId to set
	 */
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}


}
