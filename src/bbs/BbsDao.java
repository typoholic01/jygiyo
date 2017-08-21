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
		String sql = "INSERT INTO BBS("+columnSql+") "
					+ " VALUES(SEQ_JUGIYO_BBS.NEXTVAL, ?, ?, ?, "
					+ " ?, SEQ_JUGIYO_BBS.CURVAL, ?, ?, "
					+ " SYSDATE, SYSDATE, ?, ?) ";

		System.out.println("BBSDao: "+dto.toString());
		
		List<Object> queryList = new ArrayList<>();
		
		queryList.add(dto.getSeq_store());
		queryList.add(dto.getComment_id());
		queryList.add(dto.getId_category());
		queryList.add(dto.getComments());
		queryList.add(dto.getComments_group_no());
		queryList.add(dto.getComments_reply());
		queryList.add(dto.getImg_url());
		queryList.add(dto.getStatus());
		queryList.add(dto.getStore_rating());
		
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
	public boolean modifyBbs(BbsDto dto) {
		String columnSql = "SEQ_BBS, SEQ_STORE, COMMENT_ID, ID_CATEGORY, "
				+ "COMMENTS, COMMENTS_GROUP_NO, COMMENTS_REPLY, IMG_URL, "
				+ "CREATE_AT, UPDATE_AT, STATUS, STORE_RATING";
		String sql = "UPDATE BBS SET "
					+ " COMMENTS = ?, "
					+ " IMG_URL = ?, "
					+ " STORE_RATING = ?, "
					+ " WHERE SEQ = ? ";
		
		List<Object> queryList = new ArrayList<>();
		
		queryList.add(dto.getComments());
		queryList.add(dto.getImg_url());
		queryList.add(dto.getStore_rating());
		queryList.add(dto.getSeq_bbs());
		
		return DBConnection.executeUpdates(sql, queryList);
	}

	@Override
	public boolean deleteBbs(int seq_bbs) {
		String columnSql = "SEQ_BBS, SEQ_STORE, COMMENT_ID, ID_CATEGORY, "
				+ "COMMENTS, COMMENTS_GROUP_NO, COMMENTS_REPLY, IMG_URL, "
				+ "CREATE_AT, UPDATE_AT, STATUS, STORE_RATING";
		String sql = "UPDATE BBS SET "
					+ " STATUS = 'delete', "
					+ " WHERE SEQ = ? ";
		
		List<Object> queryList = new ArrayList<>();
		
		queryList.add(seq_bbs);
		
		return DBConnection.executeUpdates(sql, queryList);
	}
	

}
