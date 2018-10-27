package free.com.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

@Entity(name = "t_menu")
@IdClass(MenuKey.class)
public class Menu implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Menu() {
	}

	@Id
	@Column(name = "menu_group_id")
	private String menuGroupId;

	@Column(name = "menu_group_name")
	private String menuGroupName;

	@Column(name = "menu_group_authority")
	private String menuGroupAuthority;

	@Id
	@Column(name = "menu_id")
	private String menuId;

	@Column(name = "menu_name")
	private String menuName;

	@Column(name = "menu_authority")
	private String menuAuthority;

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

	/**
	 * @return the menuGroupId
	 */
	public String getMenuGroupId() {
		return menuGroupId;
	}

	/**
	 * @param menuGroupId the menuGroupId to set
	 */
	public void setMenuGroupId(String menuGroupId) {
		this.menuGroupId = menuGroupId;
	}

	/**
	 * @return the menuGroupName
	 */
	public String getMenuGroupName() {
		return menuGroupName;
	}

	/**
	 * @param menuGroupName the menuGroupName to set
	 */
	public void setMenuGroupName(String menuGroupName) {
		this.menuGroupName = menuGroupName;
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
	 * @return the menuId
	 */
	public String getMenuId() {
		return menuId;
	}

	/**
	 * @param menuId the menuId to set
	 */
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	/**
	 * @return the menuName
	 */
	public String getMenuName() {
		return menuName;
	}

	/**
	 * @param menuName the menuName to set
	 */
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	/**
	 * @return the menuAuthority
	 */
	public String getMenuAuthority() {
		return menuAuthority;
	}

	/**
	 * @param menuAuthority the menuAuthority to set
	 */
	public void setMenuAuthority(String menuAuthority) {
		this.menuAuthority = menuAuthority;
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
