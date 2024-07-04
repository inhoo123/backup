package model.vo;

import java.sql.Date;

public class Comment {
	int no;
	String body;
	Date writedAt;
	int likes;
	int dislikes;
	String writerId;
	String password;
	int postNo;
	
	
	
	public Comment(int no, String body, Date writedAt, int likes, int dislikes, String writerId, String password,
			int postNo) {
		this.no = no;
		this.body = body;
		this.writedAt = writedAt;
		this.likes = likes;
		this.dislikes = dislikes;
		this.writerId = writerId;
		this.password = password;
		this.postNo = postNo;
	}
	public Comment() {
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public Date getWritedAt() {
		return writedAt;
	}
	public void setWritedAt(Date writedAt) {
		this.writedAt = writedAt;
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
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
 

}
