package model.vo;

import java.sql.Date;

public class Post {
	int no;
	String category;
	String title;
	String body;
	String writerId;
	Date writedAt;
	int viewCount;
	int likes;
	int dislikes;

	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Post(int no, String category, String title, String body, String writerId, Date writedAt, int viewCount,
			int likes, int dislikes) {
		this.no = no;
		this.category = category;
		this.title = title;
		this.body = body;
		this.writerId = writerId;
		this.writedAt = writedAt;
		this.viewCount = viewCount;
		this.likes = likes;
		this.dislikes = dislikes;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public Date getWritedAt() {
		return writedAt;
	}

	public void setWritedAt(Date writedAt) {
		this.writedAt = writedAt;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getDislikes() {
		return dislikes;
	}

	public void setDislikes(int dislikes) {
		this.dislikes = dislikes;
	}

	@Override
	public String toString() {
		return "Post [no=" + no + ", category=" + category + ", title=" + title + ", body=" + body + ", writerId="
				+ writerId + ", writedAt=" + writedAt + ", viewCount=" + viewCount + ", likes=" + likes + ", dislikes="
				+ dislikes + "]";
	}

}
