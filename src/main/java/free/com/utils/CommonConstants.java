package free.com.utils;

public class CommonConstants {
	/**  */
	public static final String USER = "userId";

	public static final String LOGIN_TIME = "loginTime";

	public static final String STR_NULL = "null";

	public static final String SUCCESS = "1";

	public static final String FAILURE = "0";

	public static final String LOGIN_STATUS = "loginStatus";

	public static final String FOLDER_SYS = "system/";

	public static final int MAX_COUNT = 500;

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
