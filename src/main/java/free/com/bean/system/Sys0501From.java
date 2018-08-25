package free.com.bean.system;

import java.util.Date;
import java.util.List;

public class Sys0501From {

	public Sys0501From() {
	}

	private String userId;
	private String userAccount;
	private String roleName;
	private String authorityName;
	private Date userInsertDate;
	private String menuGroupName;
	private List<Sys0501ResultDto> multipleData;

	/**
	 * @return the menuGroupName
	 */
	public String getMenuGroupName() {
		return menuGroupName;
	}

	/**
	 * @param menuGroupName
	 *            the menuGroupName to set
	 */
	public void setMenuGroupName(String menuGroupName) {
		this.menuGroupName = menuGroupName;
	}

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the userAccount
	 */
	public String getUserAccount() {
		return userAccount;
	}

	/**
	 * @param userAccount
	 *            the userAccount to set
	 */
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * @param roleName
	 *            the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/**
	 * @return the authorityName
	 */
	public String getAuthorityName() {
		return authorityName;
	}

	/**
	 * @param authorityName
	 *            the authorityName to set
	 */
	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}

	/**
	 * @return the userInsertDate
	 */
	public Date getUserInsertDate() {
		return userInsertDate;
	}

	/**
	 * @param userInsertDate
	 *            the userInsertDate to set
	 */
	public void setUserInsertDate(Date userInsertDate) {
		this.userInsertDate = userInsertDate;
	}

	/**
	 * @return the multipleData
	 */
	public List<Sys0501ResultDto> getMultipleData() {
		return multipleData;
	}

	/**
	 * @param multipleData
	 *            the multipleData to set
	 */
	public void setMultipleData(List<Sys0501ResultDto> multipleData) {
		this.multipleData = multipleData;
	}

}
