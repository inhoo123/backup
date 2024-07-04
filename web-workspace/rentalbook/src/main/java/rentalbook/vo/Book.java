package rentalbook.vo;

public record Book(int book_id, int category_id, String category_name, String title, String publisher,
		String description, int pages, String image_url, int rental_cnt) {

}
