package food;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import jdbc.DBConn;


public class FoodDao implements IFoodDao {
	
	/*
	 CREATE TABLE JUGIYO_FOOD (
    SEQ_FOOD NUMBER(11) PRIMARY KEY,
    SEQ_STORE NUMBER(11) NOT NULL,
    FOOD_CATEGORY VARCHAR2(100),
    FOOD_NAME VARCHAR2(100) NOT NULL,
    FOOD_PRICE NUMBER(11) NOT NULL,
    FOOD_SIZE VARCHAR2(100),
    IMG_URL VARCHAR2(100),
    CONSTRAINT FK_SEQ_STORE3 FOREIGN KEY(SEQ_STORE)
    REFERENCES JUGIYO_FOOD_STORE(SEQ_STORE)    
)
	 */
	@Override
	public boolean insertFood(FoodDto dto) {
		String sql = " INSERT INTO JUGIYO_FOOD "
				+" (SEQ_FOOD, SEQ_STORE, FOOD_CATEGORY, FOOD_NAME, FOOD_PRICE, "
				+" FOOD_SIZE, IMG_URL, STATUS) "
				+" values(SEQ_JUGIYO_FOOD.nextval, ?, "
				+" ?, ?, ?, ?, ?, ?) ";
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	int count = 0;
	
	try {
		conn = DBConn.getConnection();
		System.out.println("2/6 S insertFood");
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, dto.getSeq_store());
		psmt.setString(2, dto.getFood_category());
		psmt.setString(3, dto.getFood_name());
		psmt.setInt(4, dto.getFood_price());
		psmt.setString(5, dto.getFood_size());
		psmt.setString(6, dto.getImg_url());
		psmt.setString(7, dto.getStatus());
		System.out.println("3/6 S insertFood");
		count = psmt.executeUpdate();
		System.out.println("4/6 S insertFood");
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally{
		DBConn.close(rs, psmt, conn);
		System.out.println("5/6 S insertFood");
	}
	return count>0?true:false;
	}

	@Override
	public FoodDto getFood(int seq_food) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FoodDto> getFoodList(int seq_store) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = " SELECT SEQ_FOOD, FOOD_CATEGORY, FOOD_NAME, FOOD_PRICE, FOOD_SIZE, "
				+" IMG_URL, STATUS "
				+" FROM JUGIYO_FOOD "
				+" WHERE SEQ_STORE = '"+seq_store+"' ";
		
		List<FoodDto> list = new ArrayList<>();
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S getFoodList");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 S getFoodList");
			rs = psmt.executeQuery();
			while(rs.next()){
				if(!rs.getString("STATUS").equals("1")){
				int i = 1;
				FoodDto dto = new FoodDto(
						rs.getInt(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getInt(i++), 
						rs.getString(i++), 
						rs.getString(i++)
						);
				list.add(dto);
				}
			}
			System.out.println("5/6 S getFoodList");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 S getFoodList");
		}
		return list;
	}

	@Override
	public boolean modifyFood(FoodDto dto) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		// SEQ_FOOD, SEQ_STORE, FOOD_CATEGORY, FOOD_NAME, FOOD_PRICE, "
		//+" FOOD_SIZE, IMG_URL
		
		String sql = " UPDATE JUGIYO_FOOD "
					+" SET SEQ_STORE = '"+dto.getSeq_store()+"' "
					+" , SET FOOD_CATEGORY = '"+dto.getFood_category()+"' "
					+" , SET FOOD_NAME = '"+dto.getFood_name()+"' "
					+" , SET FOOD_PRICE = '"+dto.getFood_price()+"' "
					+" , SET FOOD_SIZE = '"+dto.getFood_size()+"' "
					+" , SET IMG_URL = '"+dto.getImg_url()+"' "
					+" WHERE SEQ_FOOD = '"+dto.getSeq_food()+"' ";
		int count = 0;
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S modifyFood");
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 S modifyFood");
			rs = psmt.executeQuery();
			System.out.println("5/6 S modifyFood");
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 S modifyFood");
		}
		return count>0?true:false;
	}

	@Override
	public boolean deleteFood(int seq_food) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		// SEQ_FOOD, SEQ_STORE, FOOD_CATEGORY, FOOD_NAME, FOOD_PRICE, "
		//+" FOOD_SIZE, IMG_URL
		
		String sql = " UPDATE JUGIYO_FOOD "
					+" SET STATUS = '����' "
					+" WHERE SEQ_FOOD = '"+seq_food+"' ";
		int count = 0;
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S deleteFood");
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 S deleteFood");
			rs = psmt.executeQuery();
			System.out.println("5/6 S deleteFood");
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 S deleteFood");
		}
		return count>0?true:false;
	}

}
