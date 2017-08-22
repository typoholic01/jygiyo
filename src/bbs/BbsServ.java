package bbs;

import java.util.List;

public class BbsServ implements IBbsServ {
	IBbsDao dao = BbsDao.getInstance();

	@Override
	public List<BbsDto> getBbsList(BbsDto dto, int cur_page) {
		return dao.getBbsList(dto, cur_page);
	}

}