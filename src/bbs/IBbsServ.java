package bbs;

import java.util.List;

public interface IBbsServ {

	public List<BbsDto> getBbsList(BbsDto dto, int cur_page);
}
