package rentalbook.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.datasource.impl.OracleDataSource;
import rentalbook.vo.User;

/*
 * Users table 에 관련된 DB 작업을 처리할 Data Access Object 
 */
public class UserDao {

	// PK로 조회를 해야되는 상황이 많을꺼임. 그작업을 메서드화
	// 리턴밸류가 닉네임 혹은, 패스워드 같은 단일 밸류면 그 타입을 설정하면 됨
	// 지금 만들고자하는 목적은 모든 컬럼의 정보가 조회되길 원함.
	// 전부 다 닮을 객체를 설계해서 리턴하는데, 그런 용도의 객체를 DTO (Transfer Object) 혹은 VO (Value Object)
	// 라고 부른다.
	public User findByUserId(String userId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM USERS WHERE USER_ID=?");
			stmt.setString(1, userId);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				return new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5));
			} else {
				return null;
			}

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	// DB TABLE 에 insert 하는 작업도 메서드 화
	public boolean save(User newUser) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("INSERT INTO USERS VALUES (?, ?, ?, ?, ?)");
			stmt.setString(1, newUser.userId());
			stmt.setString(2, newUser.password());
			stmt.setString(3, newUser.nickname());
			stmt.setString(4, newUser.gender());
			stmt.setDate(5, newUser.registerdAt());

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}
	/*
	 * USER 정보 업데이트가 필요할 때 작업을 처리할 메소드
	 *	"UPDATE USERS SET NICKNAME=?, PASSWORD=? WHERE USER_ID=?"
	 */
	public boolean updateNicknameAndPassword(User oldUser) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = 
					conn.prepareStatement("UPDATE USERS SET NICKNAME=?, PASSWORD=? WHERE USER_ID=?");
			stmt.setString(1, oldUser.nickname());
			stmt.setString(2, oldUser.password());
			stmt.setString(3, oldUser.userId());
		

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}
	public boolean updateNickname(User oldUser) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = 
					conn.prepareStatement("UPDATE USERS SET NICKNAME=? WHERE USER_ID=?");
			stmt.setString(1, oldUser.nickname());
			stmt.setString(2, oldUser.userId());
		

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}
	
	public boolean deleteByUserId(String userId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = 
					conn.prepareStatement("DELETE FROM USERS WHERE USER_ID=?");
			stmt.setString(1, userId);
		

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}
	
}
