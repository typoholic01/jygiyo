package bbs;

import java.util.List;

public class BbsServ  {
	BbsDao dao = BbsDao.getInstance();

	public List<BbsDto> getBbsList(BbsDto dto, int cur_page) {
		return dao.getBbsList(dto, cur_page);
	}

	public boolean insertBbs(BbsDto dto) {
		return dao.insertBbs(dto);
	}
	
	public boolean insertReply(BbsDto bbs) {
		List<String> replyList = dao.countReply(bbs);
		String reply = dao.calculateReply(bbs,replyList);
		bbs.setComments_reply(reply);
		
		return dao.insertReply(bbs);
	}

	public boolean deleteComment(BbsDto bbs) {
		return dao.deleteComment(bbs);
	}

	public boolean modifyComment(BbsDto bbs) {
		return dao.modifyComment(bbs);
	}

	public boolean checkSameImage(BbsDto bbs) {		
		return dao.checkValue("img_url", bbs.getImg_url());		
	};
	public int getBbsCount(int seq_store){
		
		return dao.getBbsCount(seq_store);
	}
	public int getBbsStarCount(int seq_store){
		
		return dao.getBbsStarCount(seq_store);
	}

	public List<BbsDto> getmyreview(String id){
		return dao.getmyreview(id);
	}

}
