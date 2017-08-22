package bbs;

import java.util.List;

public interface IBbsServ {

	public boolean insertBbs(BbsDto dto);
	
	public List<BbsDto> getBbsList(BbsDto dto, int cur_page);

	public boolean insertReply(BbsDto bbs);
}
