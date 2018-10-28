package free.com.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "t_role")
public class Role {
	public Role() {
	}
	
	@Id
	@Column(name = "role_id")
	private int roleId;

	@Column(name = "role_name")
	private String roleName;

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
	 * @return the roleId
	 */
	public int getRoleId() {
		return roleId;
	}

	/**
	 * @param roleId the roleId to set
	 */
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * @param roleName the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
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
