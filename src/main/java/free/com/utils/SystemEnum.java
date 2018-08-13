package free.com.utils;

public enum SystemEnum {

	LOG_LEVEL_INFO(0, "info"), LOG_LEVEL_DEBUG(1, "debug");

	private int id;
	private String content;

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

}
