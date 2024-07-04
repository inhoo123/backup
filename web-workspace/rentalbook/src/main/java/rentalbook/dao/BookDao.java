package rentalbook.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.datasource.impl.OracleDataSource;
import rentalbook.vo.Book;
import rentalbook.vo.Feed;



public class BookDao {
	
	public Book findByBookId(int bookId) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOOKS WHERE BOOK_ID = ?");
			stmt.setInt(1, bookId);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				// rs.getString("writer_id");
				return new Book(rs.getInt("BOOK_ID"), rs.getInt("CATEGORY_ID"), rs.getString("CATEGORY_NAME"), rs.getString("TITLE"),
						rs.getString("PUBLISHER"), rs.getString("DESCRIPTION"),rs.getInt("PAGES"),rs.getString("IMAGE_URL"),rs.getInt("RENTAL_CNT"));
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	
	public List<Book> findAll() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOOKS ORDER BY TITLE ASC");
			
			ResultSet rs = stmt.executeQuery();
			List<Book> books = new ArrayList<>();
			while (rs.next()) {
				Book one = new Book(rs.getInt("BOOK_ID"), rs.getInt("CATEGORY_ID"), rs.getString("CATEGORY_NAME"), rs.getString("TITLE"),
						rs.getString("PUBLISHER"), rs.getString("DESCRIPTION"),rs.getInt("PAGES"),rs.getString("IMAGE_URL"),rs.getInt("RENTAL_CNT"));
				books.add(one);
			} 
			
			return books;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}//가나다순
	
	public List<Book> findAllOrderByRentalCnt() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOOKS ORDER BY RentalCnt DESC");
			
			ResultSet rs = stmt.executeQuery();
			List<Book> books = new ArrayList<>();
			while (rs.next()) {
				
				Book one = new Book(rs.getInt("BOOK_ID"), rs.getInt("CATEGORY_ID"), rs.getString("CATEGORY_NAME"), rs.getString("TITLE"),
						rs.getString("PUBLISHER"), rs.getString("DESCRIPTION"),rs.getInt("PAGES"),rs.getString("IMAGE_URL"),rs.getInt("RENTAL_CNT"));
				books.add(one);
			} 
			
			return books;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}//대여회수순
	
	public List<Book> findAllOrderByBookId() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOOKS ORDER BY BOOK_ID DESC");
			
			ResultSet rs = stmt.executeQuery();
			List<Book> books = new ArrayList<>();
			while (rs.next()) {
				
				Book one = new Book(rs.getInt("BOOK_ID"), rs.getInt("CATEGORY_ID"), rs.getString("CATEGORY_NAME"), rs.getString("TITLE"),
						rs.getString("PUBLISHER"), rs.getString("DESCRIPTION"),rs.getInt("PAGES"),rs.getString("IMAGE_URL"),rs.getInt("RENTAL_CNT"));
				books.add(one);
			} 
			
			return books;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}//최신순
	
	public boolean increaseRentalCnt(int book_id) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("UPDATE BOOKS SET RENTAL_CNT = RENTAL_CNT + 1 WHERE BOOK_ID=?");
			stmt.setInt(1, book_id);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}
	public boolean decreaseRentalCntByBookId(int book_id) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("UPDATE BOOKS SET RENTAL_CNT = RENTAL_CNT - 1 WHERE BOOK_ID=?");
			stmt.setInt(1, book_id);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}
}
