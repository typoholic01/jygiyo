package bbs;

import java.util.List;

public class BbsServ implements IBbsServ {
	IBbsDao dao = BbsDao.getInstance();

	@Override
	public List<BbsDto> getBbsList(BbsDto dto, int cur_page) {
		return dao.getBbsList(dto, cur_page);
	}

	@Override
	public boolean insertBbs(BbsDto dto) {
		return dao.insertBbs(dto);
	}
	
	public boolean insertReply(BbsDto bbs) {
		return dao.insertReply(bbs);
	}

	@Override
	public boolean deleteReply(BbsDto bbs) {
		return dao.deleteReply(bbs);
	};

}
