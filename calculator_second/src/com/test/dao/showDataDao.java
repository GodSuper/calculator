package com.test.dao;

public class showDataDao {
	private long id;//自增id号
	private String investmentType;//投资类型
	private String revenueType;//收益类型
	private String data;//计算结果

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getInvestmentType() {
		return investmentType;
	}
	public void setInvestmentType(String investmentType) {
		this.investmentType = investmentType;
	}
	public String getRevenueType() {
		return revenueType;
	}
	public void setRevenueType(String revenueType) {
		this.revenueType = revenueType;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	
}
