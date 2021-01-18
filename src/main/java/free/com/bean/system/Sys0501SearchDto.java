package free.com.bean.system;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Sys0501SearchDto implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public Sys0501SearchDto() {
	}

	private String userId;
	private String flg;
	private String accountName;
	private Date registerTime;
	private long registerTimeTimestamp;
	private String roleId;
	private List<Integer> authorityId = new ArrayList<Integer>();

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the flg
	 */
	public String getFlg() {
		return flg;
	}

	/**
	 * @param flg the flg to set
	 */
	public void setFlg(String flg) {
		this.flg = flg;
	}

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

	/**
	 * @return the authorityId
	 */
	public List<Integer> getAuthorityId() {
		return authorityId;
	}

	/**
	 * @param authorityId the authorityId to set
	 */
	public void setAuthorityId(List<Integer> authorityId) {
		this.authorityId = authorityId;
	}

	/**
	 * @return the registerTimeTimestamp
	 */
	public long getRegisterTimeTimestamp() {
		return registerTimeTimestamp;
	}

	/**
	 * @param registerTimeTimestamp the registerTimeTimestamp to set
	 */
	public void setRegisterTimeTimestamp(long registerTimeTimestamp) {
		this.registerTimeTimestamp = registerTimeTimestamp;
	}

}
