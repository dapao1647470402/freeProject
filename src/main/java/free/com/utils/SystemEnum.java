package free.com.utils;

public enum SystemEnum {

	LOG_LEVEL_INFO(0, "info"), LOG_LEVEL_DEBUG(1, "debug"),
	LOG_LEVEL_ERROR(3, "error"),
	COMMON_PREFIX_I("I");
	private int id;
	private String content;
	private String val;

	private SystemEnum() {
	}

	/**
	 * @param id
	 * @param content
	 */
	private SystemEnum(int id, String content) {
		this.id = id;
		this.content = content;
	}

	/**
	 * @param content
	 */
	private SystemEnum(String val) {
		this.val = val;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content
	 *            the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the val
	 */
	public String getVal() {
		return val;
	}

	/**
	 * @param val the val to set
	 */
	public void setVal(String val) {
		this.val = val;
	}

}
