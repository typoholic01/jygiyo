package bbs;

import java.util.List;

public interface IBbsDao {
	
	public boolean insertBbs(BbsDto dto);
	public boolean insertReply(BbsDto bbs);
	
	public BbsDto getBbs(int seq_bbs);
	public List<BbsDto> getBbsList(BbsDto dto, int cur_page);

	public boolean deleteComment(BbsDto bbs);
	public boolean modifyComment(BbsDto bbs);
	public int getTotalArticle(int seqBbs);

	
	

}
