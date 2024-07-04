package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import model.vo.User;
import oracle.jdbc.datasource.impl.OracleDataSource;

public class UserDao {
//===========================회원가입=================================================================
	public boolean save(User newUser) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("INSERT INTO USERS VALUES(?,?,?,?,?,?)");
			stmt.setString(1, newUser.getId());
			stmt.setString(2, newUser.getPassword());
			stmt.setDate(3, newUser.getRegisterAt());
			stmt.setString(4, newUser.getIp());
			stmt.setString(5, newUser.getCode());
			stmt.setString(6, newUser.getName());

			int r = stmt.executeUpdate();
			return r == 1 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	  }
//=====================유저찾기=================================================================================	
	public User findById(String id) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("community_inside");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM USERS WHERE ID=?");
			stmt.setString(1, id);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				User user = new User(rs.getString("ID"), rs.getString("PASSWORD"), rs.getDate("REGISTER_AT"),
						rs.getString("IP"), rs.getString("CODE"), rs.getString("NAME"));

				return user;
			} else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
