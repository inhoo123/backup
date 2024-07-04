package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.vo.Like;
import oracle.jdbc.datasource.impl.OracleDataSource;

public class LikeDao {

	public List<Like> increaseLikeCountByNo(int no) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("UPDATE LIKES SET LIKES = LIKES + 1 WHERE NO= ?");
			stmt.setInt(1, no);
			ResultSet rs = stmt.executeQuery();
			List<Like> likes = new ArrayList<>();
			while (rs.next()) {
				Like one = new Like();

				one.setLikes(rs.getInt("NO"));
				one.setLikes(rs.getInt("ID"));
				one.setLikes(rs.getInt("LIKES"));
				likes.add(one);
			}
			return likes;
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;

	}
}
