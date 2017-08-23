package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;

public class BbsDao implements IBbsDao {
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

	@Override
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
		queryList.add("0");
		
		queryList.add(dto.getStatus());
		queryList.add(dto.getStore_rating());
		
		return DBConnection.executeUpdates(sql, queryList);
	}

	@Override
	public boolean insertReply(BbsDto bbs) {
		//답글 순서를 구한다
		List<String> replyList = countReply(bbs);		
		
		/**
		 * 1. 원글 reply를 받아온다
		 * 2. 원글 ancestor replylist를 받아온다
		 * 3. replylist 단계를 비교한다
		 * 4. 단계를 추가한다
		 * 5. return일 경우 : 단계를 변경한다(A->B->C->)
		 * 
		 * */
		
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
		
		//스위칭 불리언
		boolean isDepthReply = false;
		
		for (String string : replyList) {
			System.out.println("루프: "+string);
			
			if (string != null&&!string.equals("-1")&&(replyBase.length()+1)==string.length()) {
				System.out.println("길이: "+string.length());
				isDepthReply = true;
				replyStep += 1;
				System.out.println("변경된 step: "+replyStep);
			}
		}
		reply = replyBase + replyStep;
		
		System.out.println(reply);
		
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
		queryList.add(reply);		
		queryList.add("0");
		
		queryList.add(bbs.getStatus());
		queryList.add(bbs.getStore_rating());
		
		return DBConnection.executeUpdates(sql, queryList);
	}	

	@Override
	public BbsDto getBbs(int seq_bbs) {
		BbsDto bbs = null;
		
		String sql = "SELECT * FROM BBS WHERE SEQ = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq_bbs);
			
			rs = psmt.executeQuery();
			
			rs.next();
			int i = 1;
			bbs = new BbsDto(
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
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, psmt, rs);
		}		
		return bbs;
	}

	@Override
	public List<BbsDto> getBbsList(BbsDto dto, int cur_page) {
		//페이징 계산
		PaginationBeans paging = PaginationBeans.getInstance();
		int limit = paging.article_limit;
		
		int startNum = limit*(cur_page - 1);
		int endNum = limit*cur_page;
						
		String columnSql = 
				"seq_bbs,"
				+ "seq_store,comment_id,id_category,"
				+ "comments,comments_group_no,comments_reply,"
				+ "img_url,create_at,update_at,status,"
				+ "store_rating";
		String sql = " SELECT "+columnSql+" FROM JUGIYO_BBS "
					+ "	WHERE seq_store = ?"
					+ "	AND status = 'published'"
					+ " ORDER BY comments_group_no desc,comments_reply asc ";
		
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

	@Override
	public boolean deleteReply(BbsDto dto) {
		String sql = "UPDATE JUGIYO_BBS SET "
				+ " STATUS = 'delete' "
				+ " WHERE SEQ_BBS = ? ";
		
		System.out.println("deleteReply: " + sql);
		
		List<Object> queryList = new ArrayList<>();
		
		queryList.add(dto.getSeq_bbs());
		
		return DBConnection.executeUpdates(sql, queryList);
	}
	
	//답글 순서 구하기용 Reply 함수
	private List<String> countReply(BbsDto dto) {
		String sql = " SELECT comments_reply "
				+ " FROM JUGIYO_BBS "
				+ " WHERE comments_group_no = ("
				+ "	SELECT comments_group_no FROM JUGIYO_BBS WHERE seq_bbs = ?"
				+ " ) "
				+ " ORDER BY comments_reply asc";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<String> replylist = new ArrayList<>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getSeq_bbs());
			rs = psmt.executeQuery();			
			
			while (rs.next()) {
				String reply = rs.getString(1);
				replylist.add(reply);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, psmt, rs);
		}
		
		System.out.println(replylist.toString());
		
		return replylist;
	}

	@Override
	public boolean modifyBbs(BbsDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

}
