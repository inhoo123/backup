package model;

public class Rank {
	String ip;
	int turn;
	double elapsed;
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getTurn() {
		return turn;
	}
	public void setTurn(int turn) {
		this.turn = turn;
	}
	public double getElapsed() {
		return elapsed;
	}
	public void setElapsed(double elapsed) {
		this.elapsed = elapsed;
	}
	public Rank(String ip, int turn, double elapsed) {
		super();
		this.ip = ip;
		this.turn = turn;
		this.elapsed = elapsed;
	}
	
}