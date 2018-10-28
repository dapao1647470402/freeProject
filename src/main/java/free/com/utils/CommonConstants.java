package free.com.utils;

public class CommonConstants {
	/** Login Use Only */
	public static final String USER = "userId";

	public static final String LOGIN_TIME = "loginTime";

	public static final String STR_NULL = "null";
	
	/** Mark */
	public static final String SUCCESS = "1";

	public static final String FAILURE = "0";

	public static final String LOGIN_STATUS = "loginStatus";

	public static final String FOLDER_SYS = "system/";

	public static final int MAX_COUNT = 500;

	/** Menu Use Only */
	public static final String MH = "meun_header";
	public static final String MD = "meun_detail";
	public static final String MD_NO = "meun_detail_no";
	
	public static final String YYYY_MM_DD_HH_MM_SS = "yyyy/MM/dd HH:mm:ss";
	
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
