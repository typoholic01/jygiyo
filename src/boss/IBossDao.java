package boss;

import bbs.BbsDto;
import customer.CustomerDto;

public interface IBossDao {
	
	public boolean sign(BossDto Dto);
	
	public BossDto getDetail(String id);
	public BossDto getBoss(int boss_id);
	public boolean IdCheck(String id);
	public BossDto checkLogin(BossDto dto);
	public boolean modifyInfomation(String boss_id, String password, String phone_number);
	public boolean deleteInfomation(String boss_id);
	public int userCheck(String boss_id, String password)throws Exception;
}
