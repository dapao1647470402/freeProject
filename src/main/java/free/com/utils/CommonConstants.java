package free.com.utils;

public class CommonConstants {
	/** Login Use Only */
	public static final String USER = "user";

	public static final String USER_ID = "userId";

	public static final String ACCOUNT_NM = "accountNm";

	public static final String USER_AUTHOR = "userAuthor";

	public static final String LOGIN_TIME = "loginTime";

	public static final String LOGIN_TIME_HMS = "loginTime_HMS";

	public static final String STR_NULL = "null";

	/** Create User Of Prefix */
	public static final String CREATE_USER_PREFIX = "U";

	/** Mark */
	public static final String SUCCESS = "1";

	public static final String FAILURE = "0";

	/** On/Off */
	public static final String ON_STR = "1";

	public static final String OFF_STR = "0";

	public static final String LOGIN_STATUS = "loginStatus";

	public static final String FOLDER_SYS = "system/";
	public static final String FOLDER_STY = "studenty/";

	public static final int MAX_COUNT = 500;

	/** Menu Use Only */
	public static final String MENU_GROUP_NM = "menu_group_nm";
	public static final String MENU_NM = "menu_nm";
	public static final String MENU_ID = "menu_id";

	public static final String YYYY_MM_DD_HH_MM_SS = "yyyy/MM/dd HH:mm:ss";

	/** Solr Url */
	public static final String SORL_URL = "http://127.0.0.1:8983/solr/fp_datasource";

	private CommonConstants() {

	}

	public static final class loginStatus {
		private loginStatus() {
		}

		public static final String INIT = "init";
		public static final String LOGIN = "login";
		public static final String LOGOUT = "logout";
	}
}
