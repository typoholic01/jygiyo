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
		return dao.insertReply(bbs);
	}


	public boolean deleteComment(BbsDto bbs) {
		return dao.deleteComment(bbs);
	}


	public boolean modifyComment(BbsDto bbs) {
		return dao.modifyComment(bbs);
	}


	public int getTotalArticle(int seqBbs) {
		return dao.getTotalArticle(seqBbs);
	}


	public boolean checkSameImage(BbsDto bbs) {		
		return dao.checkValue("img_url", bbs.getImg_url());		
	};
	
	

}
