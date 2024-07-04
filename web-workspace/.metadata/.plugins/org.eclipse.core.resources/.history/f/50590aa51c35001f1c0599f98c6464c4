package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.vo.Post;
import oracle.jdbc.datasource.impl.OracleDataSource;

public class PostDao {
//=========================저장===========================================================================================
	public boolean save(Post newPost) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn
					.prepareStatement("INSERT INTO POSTS VALUES(POST_SEQ.NEXTVAL,?,?,?,?,?,?,?,?)");

			stmt.setString(1, newPost.getCategory());
			stmt.setString(2, newPost.getTitle());
			stmt.setString(3, newPost.getBody());
			stmt.setString(4, newPost.getWriterId());
			stmt.setDate(5, newPost.getWritedAt());
			stmt.setInt(6, newPost.getViewCount());
			stmt.setInt(7, newPost.getLikes());
			stmt.setInt(8, newPost.getDislikes());

			int r = stmt.executeUpdate();
			return r == 1 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
//========================삭제================================================================================================

	public boolean deleteByNo(int no) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("DELETE FROM POSTS WHERE NO=?");
			stmt.setInt(1, no);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	// =====================찾기===============================================================================================
	public Post findByNo(int no) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM POSTS WHERE NO=?");
			stmt.setInt(1, no);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				return new Post(rs.getInt("no"), rs.getString("category"), rs.getString("title"), rs.getString("body"),
						rs.getString("writer_id"), rs.getDate("writed_at"), rs.getInt("view_count"), rs.getInt("likes"),
						rs.getInt("dislikes"));
			} else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

//====================================전부찾기============================================================
	public List<Post> findAll() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM POSTS ORDER BY WRITED_AT DESC");

			ResultSet rs = stmt.executeQuery();
			List<Post> posts = new ArrayList<>();
			while (rs.next()) {
				// rs.getString("writer_id");
				Post one = new Post(rs.getInt("no"), rs.getString("category"), rs.getString("title"),
						rs.getString("body"), rs.getString("writer_id"), rs.getDate("writed_at"),
						rs.getInt("view_count"), rs.getInt("likes"), rs.getInt("dislikes"));
				posts.add(one);
			}

			return posts;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

//=====================카테고리============================================	
	public List<Post> findByCategroyPosts(String category) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM POSTS WHERE CATEGORY=? ORDER BY WRITED_AT DESC");

			stmt.setString(1, category);

			ResultSet rs = stmt.executeQuery();
			List<Post> posts = new ArrayList<>();
			while (rs.next()) {
				// rs.getString("writer_id");
				Post one = new Post(rs.getInt("no"), rs.getString("category"), rs.getString("title"),
						rs.getString("body"), rs.getString("writer_id"), rs.getDate("writed_at"),
						rs.getInt("view_count"), rs.getInt("likes"), rs.getInt("dislikes"));
				posts.add(one);
			}

			return posts;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

//======================SEARCH=================================================
	public List<Post> findByTitleLikeOrBodysLike(String pattern) throws SQLException {

		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn
					.prepareStatement("SELECT * FROM POSTS WHERE TITLE LIKE ? OR BODY LIKE ? ORDER BY WRITED_AT ASC");
			stmt.setString(1, "%" + pattern + "%");
			stmt.setString(2, "%" + pattern + "%");
			ResultSet rs = stmt.executeQuery();
			List<Post> posts = new ArrayList<>();
			while (rs.next()) {
				// rs.getString("writer_id");
				Post one = new Post(rs.getInt("no"), rs.getString("category"), rs.getString("title"),
						rs.getString("body"), rs.getString("writer_id"), rs.getDate("writed_at"),
						rs.getInt("view_count"), rs.getInt("likes"), rs.getInt("dislikes"));
				posts.add(one);
			}

			return posts;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

//===============================게시글세기======================================================================================	
	public int countAll() throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM POSTS");
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt("count(*)");
				return cnt;
			} else {
				return -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public boolean update(Post post) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("UPDATE POSTS SET TITLE=?, BODY=? WHERE NO=?");
			stmt.setString(1, post.getTitle());
			stmt.setString(2, post.getBody());
			stmt.setInt(3, post.getNo());

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	public List<Post> findAll2(int start, int end) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement(
					"SELECT * FROM (SELECT ROWNUM RN, P.* FROM (SELECT * FROM POSTS ORDER BY WRITED_AT DESC) P) WHERE RN BETWEEN ? AND ?");
			stmt.setInt(1, start);
			stmt.setInt(2, end);

			ResultSet rs = stmt.executeQuery();
			List<Post> posts = new ArrayList<Post>();
			while (rs.next()) {
				Post one = new Post();

				one.setNo(rs.getInt("no"));
				one.setCategory(rs.getString("category"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setWriterId(rs.getString("writer_id"));
				one.setWritedAt(rs.getDate("writed_At"));
				one.setViewCount(rs.getInt("view_count"));
				one.setLikes(rs.getInt("likes"));
				one.setDislikes(rs.getInt("dislikes"));
				posts.add(one);

			}

			return posts;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Post> findAll3(int start, int end) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement(
					"SELECT * FROM (SELECT ROWNUM RN, P.* FROM (SELECT * FROM POSTS ORDER BY VIEW_COUNT DESC) P) WHERE RN BETWEEN ? AND ?");
			stmt.setInt(1, start);
			stmt.setInt(2, end);

			ResultSet rs = stmt.executeQuery();
			List<Post> posts = new ArrayList<Post>();
			while (rs.next()) {
				Post one = new Post();

				one.setNo(rs.getInt("no"));
				one.setCategory(rs.getString("category"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setWriterId(rs.getString("writer_id"));
				one.setWritedAt(rs.getDate("writed_At"));
				one.setViewCount(rs.getInt("view_count"));
				one.setLikes(rs.getInt("likes"));
				one.setDislikes(rs.getInt("dislikes"));
				posts.add(one);

			}

			return posts;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

//========================조회수======================================================================================================
	public boolean increaseViewCountByNo(int no) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("UPDATE POSTS SET VIEW_COUNT = VIEW_COUNT + 1 WHERE NO= ?");
			stmt.setInt(1, no);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
//==================좋아요===========================================================================================================

//=================좋아요 감소=============================================================================
}