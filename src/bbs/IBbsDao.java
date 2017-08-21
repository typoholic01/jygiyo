package bbs;

import java.util.List;

public interface IBbsDao {
	
	public boolean insertBbs(BbsDto dto);
	
	public BbsDto getBbs(int seq_bbs);
	public List<BbsDto> getBbsList(BbsDto dto, int cur_page);

	public boolean modifyBbs(BbsDto dto);
	public boolean deleteBbs(int seq_bbs);
	
	

}
