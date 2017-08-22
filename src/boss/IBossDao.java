package boss;

public interface IBossDao {
	
	public boolean sign(BossDto Dto);
	
	public BossDto getBoss(int boss_id);

	public BossDto checkLogin(BossDto dto);
	public boolean modifyInfomation(int boss_id);
	public boolean deleteInfomation(int boss_id);
}
