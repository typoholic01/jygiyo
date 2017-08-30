package bbs;

import java.util.List;

public class BbsCtrl {
	BbsServ bbsServ = new BbsServ();
	
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

	public boolean deleteComment(BbsDto bbs) {
		return bbsServ.deleteComment(bbs);
		
	}

	public boolean modifyComment(BbsDto bbs) {
		return bbsServ.modifyComment(bbs);
		
	}	

	public boolean checkSameImage(String fileName) {
		BbsDto bbs = new BbsDto();
		bbs.setImg_url(fileName);
		return bbsServ.checkSameImage(bbs);
	}
	public int getBbsCount(int seq_store){
		
		return bbsServ.getBbsCount(seq_store);
	}
	public int getBbsStarCount(int seq_store){
		
		return bbsServ.getBbsStarCount(seq_store);
	}
	
	public List<BbsDto> getmyreview(String id){
		BbsDto dto = new BbsDto();
		dto.setComment_id(id);
		return bbsServ.getmyreview(id);
	}

}
