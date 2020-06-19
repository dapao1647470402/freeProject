package free.com.basic;

import javax.annotation.PreDestroy;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import free.com.common.LoggerCommon;
import free.com.utils.SystemEnum;
@Service
public class StartServerListener implements ApplicationListener<ContextRefreshedEvent> {

	public void onApplicationEvent(ContextRefreshedEvent event) {
		try {
			// 在web项目中（spring mvc），系统会存在两个容器，一个是root application context
			// ,另一个就是我们自己的 projectName-servlet context（作为root application context的子容器）。
			// 这种情况下，就会造成onApplicationEvent方法被执行两次。为了避免这个问题，我们可以只在root
			// application context初始化完成后调用逻辑代码，其他的容器的初始化完成，则不做任何处理。
			if (event.getApplicationContext().getParent() == null) {

				// 需要实现的功能
				LoggerCommon.printLog("开始执行Bat任务", SystemEnum.LOG_LEVEL_DEBUG);
				execteBatTask();
				LoggerCommon.printLog("执行Bat任务完成", SystemEnum.LOG_LEVEL_DEBUG);
			}
		} catch (Exception e) {
			LoggerCommon.printLog("启动异常，原因:" + e.getMessage(), SystemEnum.LOG_LEVEL_ERROR);
		}
	}

	/**
	 * 关闭时执行特定代码(未找到测试办法)
	 */
	@PreDestroy
	public void applicationDestroy(){

		System.out.println("application start");

	}

	/**
	 * 执行Bat文件
	 */
	private void execteBatTask() {
		// TODO Auto-generated method stub

	}

}
