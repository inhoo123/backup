package model.vo;

public class Like {
	int postNo;
	String userId;
	int likes;

	public Like() {
		super();
		
	}

	public Like(int postNo, String userId, int likes) {
		this.postNo = postNo;
		this.userId = userId;
		this.likes = likes;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}
}
