package com.test.action;




public class CalculatorAction {
	private static final long serialVersionUID = 1L;
	private float principal;// 存入本金
	private float annualRate;// 年利率
	private int year;// 年限
	private float total;// 终值

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String calculate() {
		System.out.println(total);
		total = (float) (principal * Math.pow((1 + annualRate), year));
		System.out.println(total);
		return "success";

	}

	// 复利计算方式
	public float getPrincipal() {
		return principal;
	}

	public void setPrincipal(float principal) {
		this.principal = principal;
	}

	public float getAnnualRate() {
		return annualRate;
	}

	public void setAnnualRate(float annualRate) {
		this.annualRate = annualRate;
	}

}
