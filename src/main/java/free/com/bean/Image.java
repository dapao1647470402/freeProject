package free.com.bean;

import java.util.Date;

import javax.persistence.Column;

public class Image {
	public Image() {
	}

	@Column(name = "img_location_pre")
	private String imgLocationPre;

	@Column(name = "img_location_aft")
	private String imgLocationAft;

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
}
