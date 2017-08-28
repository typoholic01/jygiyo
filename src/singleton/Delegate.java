package singleton;

import bbs.BbsCtrl;
import food.FoodCtrl;
import foodStore.FoodStoreCtrl;
import order.OrderCtrl;

public class Delegate {
	private static Delegate single = null;
	
	//컨트롤러 변수
	public BbsCtrl bbsCtrl;
	public OrderCtrl orderCtrl;
	public FoodStoreCtrl foodStoreCtrl;
	public FoodCtrl foodCtrl;
	
	private Delegate() {
		bbsCtrl = new BbsCtrl();	
		orderCtrl = new OrderCtrl();
		foodStoreCtrl = new FoodStoreCtrl();
		foodCtrl = new FoodCtrl();
	}
	
	public static Delegate getInstance() {
		if (single == null) {
			single = new Delegate();
		}
		
		return single;
	}

}
