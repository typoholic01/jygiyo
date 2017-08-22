package bbs;

import java.util.List;

public class BbsCtrl {
	IBbsServ bbsServ = new BbsServ();
	
	public List<BbsDto> getBbsList(int seq_store, int cur_page) {
		//변수를 객체화한다
		BbsDto dto = new BbsDto();
		dto.setSeq_store(seq_store);
		
		return bbsServ.getBbsList(dto, cur_page);
	}	

	public boolean insertBbs(BbsDto dto) {
		return bbsServ.insertBbs(dto);
	}

	public boolean insertReply(BbsDto bbs) {
		return bbsServ.insertReply(bbs);
		
	}
		

}
