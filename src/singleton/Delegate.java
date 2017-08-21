package singleton;

import bbs.BbsCtrl;
import order.OrderCtrl;

public class Delegate {
	private static Delegate single = null;
	
	//컨트롤러 변수
	public BbsCtrl BbsCtrl;
	public OrderCtrl FoodCtrl;
	
	private Delegate() {
		BbsCtrl = new BbsCtrl();	
		FoodCtrl = new OrderCtrl();
	}
	
	public static Delegate getInstance() {
		if (single == null) {
			single = new Delegate();
		}
		
		return single;
	}

}
