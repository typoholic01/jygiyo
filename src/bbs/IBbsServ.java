package bbs;

import java.util.List;

public interface IBbsServ {

	public boolean insertBbs(BbsDto dto);
	public boolean insertReply(BbsDto bbs);
	
	public List<BbsDto> getBbsList(BbsDto dto, int cur_page);

	public boolean modifyComment(BbsDto bbs);
	public boolean deleteComment(BbsDto bbs);
	
	public int getTotalArticle(int seqBbs);
	
	public boolean checkSameImage(BbsDto bbs);
}
