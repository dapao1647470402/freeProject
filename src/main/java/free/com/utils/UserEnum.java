package free.com.utils;

public enum UserEnum {

	USER_PREFIX_U("U"),

	ADMIN("admin"),
	ME("me"),
	USER_ROLE_DEFAULT("0"),
	USER_AUTHORITY_DEFAULT("1"),
	MENU_GROUP_AUTHORITY_DEFAULT("09"),
	MENU_SUB_GROUP_AUTHORITY_DEFAULT("50"),
	MENU_SUB_MAX_AUTHORITY_DEFAULT("99");

	private String key;
	private String val;
	private UserEnum() {
	}

	private UserEnum(String val) {
		this.val = val;
	}
	private UserEnum(String key, String val) {
		this.key = key;
		this.val = val;
	}

	public String getVal() {
		return this.val;
	}

	public String getKey() {
		return this.key;
	}
}
