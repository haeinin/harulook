package com.ksmart.harulook.hof.service;

public class HofDto {

	private int hofMonth;
	private String boardNo;
	private String hofDate;
	private int hofRank;
	private String pointPolicyNo;
	private String boardImg;

	public int getHofMonth() {
		return hofMonth;
	}
	public void setHofMonth(int hofMonth) {
		this.hofMonth = hofMonth;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getHofDate() {
		return hofDate;
	}
	public void setHofDate(String hofDate) {
		this.hofDate = hofDate;
	}
	public int getHofRank() {
		return hofRank;
	}
	public void setHofRank(int hofRank) {
		this.hofRank = hofRank;
	}
	public String getPointPolicyNo() {
		return pointPolicyNo;
	}
	public void setPointPolicyNo(String pointPolicyNo) {
		this.pointPolicyNo = pointPolicyNo;
	}
	public String getBoardImg() {
		return boardImg;
	}
	public void setBoardImg(String boardImg) {
		this.boardImg = boardImg;
	}
	@Override
	public String toString() {
		return "HofDto [hofMonth=" + hofMonth + ", boardNo=" + boardNo + ", hofDate=" + hofDate + ", hofRank=" + hofRank
				+ ", pointPolicyNo=" + pointPolicyNo + ", boardImg=" + boardImg + "]";
	}


}
