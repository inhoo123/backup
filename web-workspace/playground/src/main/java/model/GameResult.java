package model;

public record GameResult(int[]guess, int strike, int ball) {

	public int[] guess() {
		return guess;
	}

	public int strike() {
		return strike;
	}

	public int ball() {
		return ball;
	}
	
    
}
