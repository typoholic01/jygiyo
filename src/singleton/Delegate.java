package singleton;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import ctrl.CtrlUsers;
import view.UsersFrontController;

public class Delegate {
	private static final Logger logger = LogManager.getLogger(Delegate.class);
	private static Delegate single = null;
	
	//컨트롤러 변수
	public CtrlUsers ctrlUsers;
	
	private Delegate() {
		ctrlUsers = new CtrlUsers();
	}
	
	public static Delegate getInstance() {
		logger.info("진입");
		if (single == null) {
			single = new Delegate();
		}
		
		return single;
	}

}
