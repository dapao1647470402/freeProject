package free.com.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import free.com.utils.SystemEnum;

public class LoggerCommon {
	private static Logger log = LoggerFactory.getLogger(LoggerCommon.class);

	/**
	 * print Logger Information
	 *
	 * @param Loginfo
	 * @param extra
	 *            1.debug Level
	 */
	public static final void printLog(String logInfo, SystemEnum... extra) {
		if (extra != null && extra.length > 0) {
			if (SystemEnum.LOG_LEVEL_DEBUG == extra[0]) {
				log.debug(logInfo);
			}
		} else {
			log.info(logInfo);
		}
	}

}
