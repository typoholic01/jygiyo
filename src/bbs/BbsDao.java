package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;

public class BbsDao {
	private static BbsDao single = null;
	
	private BbsDao() {
		DBConnection.initConnect();
	}
	
	public static BbsDao getInstance() {
		if (single == null) {
			single = new BbsDao();
		}
		return single;
	}
	
	//게시물 갯수 가져오기
	private int getTotalArticle(int seqStore) {
		String columnSql = "COUNT(seq_bbs)";
		String sql = "SELECT "+columnSql+" FROM JUGIYO_BBS"
					+ " WHERE seq_store = ? "
					+ "	AND status = 'published' ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int total_article = 0;
				
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seqStore);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;
				total_article = rs.getInt(i++);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, psmt, rs);
		}
		
		return total_article;
	}

	public boolean insertBbs(BbsDto dto) {
		String columnSql = "SEQ_BBS, SEQ_STORE, COMMENT_ID, ID_CATEGORY, "
						+ "COMMENTS, COMMENTS_GROUP_NO, COMMENTS_REPLY, IMG_URL, "
						+ "CREATE_AT, UPDATE_AT, STATUS, STORE_RATING";
		String sql = "INSERT INTO JUGIYO_BBS("+columnSql+") "
					+ " VALUES("
					+ " SEQ_JUGIYO_BBS.NEXTVAL, ?, ?, ?, "
					+ " ?, SEQ_JUGIYO_BBS.CURRVAL, ?, ?, "
					+ " SYSDATE, SYSDATE, ?, ?) ";

		System.out.println(sql);
		System.out.println("BBSDao: "+dto.toString());
		
		List<Object> queryList = new ArrayList<>();
		
		queryList.add(dto.getSeq_store());
		queryList.add(dto.getComment_id());
		queryList.add(dto.getId_category());
		
		queryList.add(dto.getComments());
		queryList.add(dto.getComments_reply());
		queryList.add(dto.getImg_url());
		
		queryList.add(dto.getStatus());
		queryList.add(dto.getStore_rating());
		
		return DBConnection.executeUpdates(sql, queryList);
	}

	public boolean insertReply(BbsDto bbs) {
		String columnSql = "SEQ_BBS, SEQ_STORE, COMMENT_ID, ID_CATEGORY, "
				+ "COMMENTS, COMMENTS_GROUP_NO, COMMENTS_REPLY, IMG_URL, "
				+ "CREATE_AT, UPDATE_AT, STATUS, STORE_RATING";
		String sql = "INSERT INTO JUGIYO_BBS("+columnSql+") "
					+ " VALUES("
					+ " SEQ_JUGIYO_BBS.NEXTVAL, ?, ?, ?, "
					+ " ?, ?, ?, ?, "
					+ " SYSDATE, SYSDATE, ?, ?) ";
		
		System.out.println(sql);
		System.out.println("BBSDao: "+bbs.toString());
		
		List<Object> queryList = new ArrayList<>();
		
		queryList.add(bbs.getSeq_store());
		queryList.add(bbs.getComment_id());
		queryList.add(bbs.getId_category());
		
		queryList.add(bbs.getComments());
		queryList.add(bbs.getComments_group_no());
		queryList.add(bbs.getComments_reply());		
		queryList.add(bbs.getImg_url());
		
		queryList.add(bbs.getStatus());
		queryList.add(bbs.getStore_rating());
		
		return DBConnection.executeUpdates(sql, queryList);
	}	

	protected String calculateReply(BbsDto bbs, List<String> replyList) {
		String replyBase = bbs.getComments_reply();
		System.out.println("replyBase : "+replyBase);
		
		if (replyBase == null || replyBase.equals("-1")) {
			replyBase = "";
		}
		System.out.println("변경된 replyBase : "+replyBase);
		System.out.println("replyBase 길이: "+replyBase.length());
		char replyStep = 'A';
		String reply = "";
		
		System.out.println(replyBase);
		
		for (String string : replyList) {
			System.out.println("루프: "+string);
			
			if (string != null&&!string.equals("-1")&&(replyBase.length()+1)==string.length()) {
				System.out.println("길이: "+string.length());
				replyStep += 1;
				System.out.println("변경된 step: "+replyStep);
			}
		}
		reply = replyBase + replyStep;
		
		System.out.println(reply);
		return reply;
	}

	public List<BbsDto> getBbsList(BbsDto dto, int currPage) {
		//페이징 계산
		PaginationBeans paging = PaginationBeans.getInstance();
		int limit = paging.articleLimit;
		
		int startNum = limit*(currPage - 1);
		int endNum = limit*currPage;
		
		int startPage = currPage-(currPage-1)%paging.pageLimit;		
		int endPage = startPage+paging.pageLimit - 1;
		
		int endLimit = getTotalArticle(dto.getSeq_store());
		
		paging.setTotalArticle(endLimit);
		
		//end_page의 한계를 설정한다
		if (endPage*paging.articleLimit > endLimit) {
			// 1의 자리수를 빼고 더한다
			endPage = paging.getTotalArticle()/paging.articleLimit;				
			// 1의 자리수가 1이라도 있으면 페이지를 추가한다
			endPage += (paging.getTotalArticle()%paging.articleLimit > 0)?1:0;	
		}
		paging.setStartPage(startPage);
		System.out.println("endLimit: " + endLimit);
		System.out.println("EndPage: " + endPage);
		paging.setEndPage(endPage);
						
		String sql = " SELECT * FROM"
				+ " ("
				+ "		SELECT seq_bbs,seq_store,comment_id,id_category,comments,comments_group_no,"
				+ "				comments_reply,img_url,create_at,update_at,status,store_rating,"
				+ "				ROW_NUMBER() OVER (ORDER BY comments_group_no desc,comments_reply asc) R"
				+ "		FROM JUGIYO_BBS "
				+ "		WHERE status = 'published' "
				+ "		AND seq_store = ? "
				+ " )	"
				+ " WHERE R BETWEEN ? and ? ";
		
		System.out.println(sql);
		
		List<BbsDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
				
		try {
			conn = DBConnection.getConnection();
			System.out.println("2/6 getBbsList Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 getBbsList Success");
			
			psmt.setInt(1, dto.getSeq_store());
			psmt.setInt(2, startNum);
			psmt.setInt(3, endNum);
			
			rs = psmt.executeQuery();
			System.out.println("4/6 getBbsList Success");
			
			while(rs.next())
			{
				int i = 1;		
				BbsDto bbs = new BbsDto(
								rs.getInt(i++),			//	seq_bbs, 
								rs.getInt(i++),			//	seq_store, 
								rs.getString(i++),		//	comment_id, 
								rs.getString(i++),		//	id_category, 
								rs.getString(i++),		//	comments, 
								rs.getInt(i++),			//	comments_group_no, 
								rs.getString(i++),		//	comments_reply, 
								rs.getString(i++),		//	img_url, 
								rs.getString(i++),		//	create_at, 
								rs.getString(i++),		//	update_at, 
								rs.getString(i++),		//	status, 
								rs.getInt(i++)			//	store_rating
						);
				list.add(bbs);
			}		
			System.out.println("5/6 getBbsList Success");
			
		} catch (SQLException e) {
			System.out.println("getBbsList fail");
		} finally{
			DBConnection.close(conn, psmt, rs);
			System.out.println("6/6 getBbsList Success");
		}
		
		return list;
	}	

	public boolean deleteComment(BbsDto dto) {
		String sql = "UPDATE JUGIYO_BBS SET "
				+ " STATUS = 'delete' "
				+ " WHERE SEQ_BBS = ? ";
		
		System.out.println("deleteReply: " + sql);
		
		List<Object> queryList = new ArrayList<>();
		
		queryList.add(dto.getSeq_bbs());
		
		return DBConnection.executeUpdates(sql, queryList);
	}
	

	public boolean modifyComment(BbsDto bbs) {
		String sql = "UPDATE JUGIYO_BBS SET "
				+ " comments = ? "
				+ " WHERE SEQ_BBS = ? ";
		
		System.out.println("deleteReply: " + sql);
		
		List<Object> queryList = new ArrayList<>();
		
		queryList.add(bbs.getComments());
		queryList.add(bbs.getSeq_bbs());
		
		return DBConnection.executeUpdates(sql, queryList);
	}
	
	//답글 순서 구하기용 Reply 함수
	protected List<String> countReply(BbsDto dto) {
		String sql = " SELECT comments_reply "
				+ " FROM JUGIYO_BBS "
				+ " WHERE comments_group_no = ("
				+ "	SELECT comments_group_no FROM JUGIYO_BBS WHERE seq_bbs = ?"
				+ " ) "
				+ " ORDER BY comments_reply asc";
		//객체 준비
		List<Object> queryList = new ArrayList<>();		
		List<Object> valueList = new ArrayList<>();
		List<String> replyList = new ArrayList<>();
		
		//쿼리 작성
		queryList.add(dto.getSeq_bbs());
		
		//결과값 리턴
		valueList = DBConnection.executeQuerys(sql, queryList);
		
		for (Object rowList : valueList) {
			List<Object> row = (List<Object>) rowList;
			for (Object column : row) {
				replyList.add((String) column);
			}
		}
		
		return replyList;
	}
	

	public boolean checkValue(String key, Object val) {	
		List<Object> valueList = new ArrayList<>();
		String sql = " SELECT " + key + " FROM JUGIYO_BBS "
				+ " WHERE " + key + " = ?";
		
		List<Object> queryList = new ArrayList<>();
		queryList.add(val);
		
		valueList = DBConnection.executeQuery(sql, queryList);
				
		if (valueList.isEmpty()) {
			return false;
		}
		
		return true;
	}
}
