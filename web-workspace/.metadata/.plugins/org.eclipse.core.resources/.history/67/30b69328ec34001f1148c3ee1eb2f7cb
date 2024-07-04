package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.vo.Comment;
import model.vo.Post;
import oracle.jdbc.datasource.impl.OracleDataSource;



public class CommentDao {
	// =========================저장===========================================================================================
	public boolean save(Comment newComment) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("INSERT INTO COMMENTS VALUES(COMMENTS_SEQ.NEXTVAL,?,?,?,?,?,?,?)");
			stmt.setString(1, newComment.getBody());
			stmt.setDate(2, newComment.getWritedAt());
			stmt.setInt(3, newComment.getLikes());
			stmt.setInt(4, newComment.getDislikes());
			stmt.setString(5, newComment.getWriterId());
			stmt.setString(6, newComment.getPassword());
			stmt.setInt(7, newComment.getPostNo());

			int r = stmt.executeUpdate();
			return r == 1 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	// =================================NO로찾기=========================================
	public List<Comment> findAllByPostNo(int no) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM COMMENTS WHERE POST_NO=?");
			stmt.setInt(1, no);
			ResultSet rs = stmt.executeQuery();
			List<Comment> comments = new ArrayList<>();
			while (rs.next()) {
				Comment one = new Comment(rs.getInt("NO"),rs.getString("BODY"),rs.getDate("WRITED_AT"),rs.getInt("LIKES"),rs.getInt("DISLIKES")
						,rs.getString("WRITER_ID"),rs.getString("PASSWORD"),rs.getInt("POST_NO"));
				comments.add(one);
			} 
			
			return comments;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}//가나다순
	
	public Comment findByNo(int no) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM COMMENTS WHERE NO=?");
			stmt.setInt(1, no);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				return new Comment(rs.getInt("NO"),rs.getString("BODY"),rs.getDate("WRITED_AT"),rs.getInt("LIKES"),rs.getInt("DISLIKES")
						,rs.getString("WRITER_ID"),rs.getString("PASSWORD"),rs.getInt("POST_NO"));
			} else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	

	// ========================삭제================================================================================================

	public boolean deleteByPassword(String password) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("DELETE FROM COMMENTS WHERE Password LIKE ?");
			stmt.setString(1, password);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	// ======================================================================
	
	public boolean deleteByNo(int no) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("DELETE FROM COMMENTS WHERE NO=?");
			stmt.setInt(1, no);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	
	
	
	
	
}
