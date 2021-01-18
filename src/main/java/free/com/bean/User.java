package free.com.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "t_user")
public class User implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "user_id")
	private String userId;

	@Column(name = "account_name")
	private String accountName;

	@Column(name = "account_id")
	private String accountId;

	@Column(name = "psd")
	private String password;

	@Column(name = "user_role")
	private String userRole;

	@Column(name = "user_authority")
	private String userAuthority;

	@Column(name = "menu_group_authority")
	private String menuGroupAuthority;

	@Column(name = "menu_sub_max_authority")
	private String menuSubMaxAuthority;

	@Column(name = "birthday")
	private String birthday;

	@Column(name = "ins_date")
	private Date insDate;

	@Column(name = "ins_user_id")
	private String insUserId;

	@Column(name = "ins_program")
	private String insProgram;

	@Column(name = "upd_date")
	private Date updDate;

	@Column(name = "upd_user_id")
	private String updUserId;

	@Column(name = "upd_program")
	private String updProgram;

	@Column(name = "lock_version")
	private String lockVersion;

	public User() {
	}

	/**
	 * @param userId
	 * @param accountName
	 * @param accountId
	 * @param password
	 * @param userRole
	 * @param userAuthority
	 * @param menuGroupAuthority
	 * @param menuSubMaxAuthority
	 * @param updatePsdTime
	 * @param insDate
	 * @param insUserId
	 * @param insProgram
	 * @param updDate
	 * @param updUserId
	 * @param updProgram
	 * @param lockVersion
	 */
	public User(String userId, String accountName, String accountId, String password, String userRole,
			String userAuthority, String menuGroupAuthority, String menuSubMaxAuthority, String birthday, Date insDate,
			String insUserId, String insProgram, Date updDate, String updUserId, String updProgram,
			String lockVersion) {
		this.userId = userId;
		this.accountName = accountName;
		this.accountId = accountId;
		this.password = password;
		this.userRole = userRole;
		this.userAuthority = userAuthority;
		this.menuGroupAuthority = menuGroupAuthority;
		this.menuSubMaxAuthority = menuSubMaxAuthority;
		this.birthday = birthday;
		this.insDate = insDate;
		this.insUserId = insUserId;
		this.insProgram = insProgram;
		this.updDate = updDate;
		this.updUserId = updUserId;
		this.updProgram = updProgram;
		this.lockVersion = lockVersion;
	}

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
	 * @return the accountId
	 */
	public String getAccountId() {
		return accountId;
	}

	/**
	 * @param accountId the accountId to set
	 */
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the userRole
	 */
	public String getUserRole() {
		return userRole;
	}

	/**
	 * @param userRole the userRole to set
	 */
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	/**
	 * @return the userAuthority
	 */
	public String getUserAuthority() {
		return userAuthority;
	}

	/**
	 * @param userAuthority the userAuthority to set
	 */
	public void setUserAuthority(String userAuthority) {
		this.userAuthority = userAuthority;
	}

	/**
	 * @return the menuGroupAuthority
	 */
	public String getMenuGroupAuthority() {
		return menuGroupAuthority;
	}

	/**
	 * @param menuGroupAuthority the menuGroupAuthority to set
	 */
	public void setMenuGroupAuthority(String menuGroupAuthority) {
		this.menuGroupAuthority = menuGroupAuthority;
	}

	/**
	 * @return the menuSubMaxAuthority
	 */
	public String getMenuSubMaxAuthority() {
		return menuSubMaxAuthority;
	}

	/**
	 * @param menuSubMaxAuthority the menuSubMaxAuthority to set
	 */
	public void setMenuSubMaxAuthority(String menuSubMaxAuthority) {
		this.menuSubMaxAuthority = menuSubMaxAuthority;
	}

	/**
	 * @return the birthday
	 */
	public String getBirthday() {
		return birthday;
	}

	/**
	 * @param birthday the birthday to set
	 */
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	/**
	 * @return the insDate
	 */
	public Date getInsDate() {
		return insDate;
	}

	/**
	 * @param insDate the insDate to set
	 */
	public void setInsDate(Date insDate) {
		this.insDate = insDate;
	}

	/**
	 * @return the insUserId
	 */
	public String getInsUserId() {
		return insUserId;
	}

	/**
	 * @param insUserId the insUserId to set
	 */
	public void setInsUserId(String insUserId) {
		this.insUserId = insUserId;
	}

	/**
	 * @return the insProgram
	 */
	public String getInsProgram() {
		return insProgram;
	}

	/**
	 * @param insProgram the insProgram to set
	 */
	public void setInsProgram(String insProgram) {
		this.insProgram = insProgram;
	}

	/**
	 * @return the updDate
	 */
	public Date getUpdDate() {
		return updDate;
	}

	/**
	 * @param updDate the updDate to set
	 */
	public void setUpdDate(Date updDate) {
		this.updDate = updDate;
	}

	/**
	 * @return the updUserId
	 */
	public String getUpdUserId() {
		return updUserId;
	}

	/**
	 * @param updUserId the updUserId to set
	 */
	public void setUpdUserId(String updUserId) {
		this.updUserId = updUserId;
	}

	/**
	 * @return the updProgram
	 */
	public String getUpdProgram() {
		return updProgram;
	}

	/**
	 * @param updProgram the updProgram to set
	 */
	public void setUpdProgram(String updProgram) {
		this.updProgram = updProgram;
	}

	/**
	 * @return the lockVersion
	 */
	public String getLockVersion() {
		return lockVersion;
	}

	/**
	 * @param lockVersion the lockVersion to set
	 */
	public void setLockVersion(String lockVersion) {
		this.lockVersion = lockVersion;
	}

}
