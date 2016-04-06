package com.test.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.test.dao.showDataDao;
import com.test.service.showDataService;
import com.test.serviceImpl.showDataServiceImpl;




public class CalculatorAction extends ActionSupport implements ServletResponseAware,RequestAware,SessionAware,ApplicationAware{
	private static final long serialVersionUID = 1L;
	private String principal;// 存入本金
	private String annualRate;// 年利率
	private String year;// 年限
	private String  compoundAmount;//复利终值
	private String chose;
	private Map<String, Object> request;
	private HttpServletResponse respond;
	private String a;
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public void select() throws IOException{
		request.put("aaa", "123");
		PrintWriter writer = respond.getWriter();
		writer.write(chose);
		
	}
	public String getChose() {
		return chose;
	}

	public void setChose(String chose) {
		this.chose = chose;
	}

	public String getCompoundAmount() {
	
		return compoundAmount;
	}

	public void setCompoundAmount(String compoundAmount) {
		this.compoundAmount = compoundAmount;
	}


	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	
public void calculate() throws IOException 
{   showDataService showDataService=new showDataServiceImpl();
	showDataDao s=new showDataDao();
	if(a!=null&&a.equals("1"))
	{
		
		principal= (Double.parseDouble(compoundAmount)/ (Math.pow((1 + Double.parseDouble(annualRate)), Double.parseDouble(year))))+"";
		System.out.println(principal);
		System.out.println("3333333333333333333333333");
			PrintWriter writer = respond.getWriter();
			writer.write(principal+"");
			System.out.println(principal);
			s.setInvestmentType("本金计算");
			s.setRevenueType("存入本金");
			s.setData(principal);
			showDataService.add(s);
			
	}
//		if(a!=null&&a.equals("2"))
//		{
//			compoundAmount= (Double.parseDouble(principal) * Math.pow((1 +Double.parseDouble(annualRate)), Double.parseDouble(year)))+"";
//			s.setInvestmentType("复利计算");
//			s.setRevenueType("复利终值");
//			s.setData(compoundAmount);
//			showDataService.add(s);
//			PrintWriter writer = respond.getWriter();
//			writer.write(compoundAmount+"");
//		}
//		if(a!=null&&a.equals("3"))
//		{
//			annualRate=(StrictMath.pow(Double.parseDouble(compoundAmount)/Double.parseDouble(principal),1.0/ Double.parseDouble(year))-1)+""; 
//			s.setInvestmentType("存款利率");
//			s.setRevenueType("存入年利率");
//			s.setData(annualRate);
//			showDataService.add(s);
//			PrintWriter writer = respond.getWriter();
//			writer.write(annualRate+"");
//				
//		}
//		if(a!=null&&a.equals("4"))
//		{	
//		year=(Math.log(Double.parseDouble(compoundAmount)/Double.parseDouble(principal)))/(Math.log(1 + Double.parseDouble(annualRate)))+"";
//		System.out.println(compoundAmount);
//		System.out.println(principal);
//		s.setInvestmentType("存款年限");
//		s.setRevenueType("存入年限");
//		s.setData(year);
//		showDataService.add(s);
//			PrintWriter writer = respond.getWriter();
//			writer.write(year+"");
//		}
//		if(a!=null&&
//				a.equals("5"))
//		{
//			compoundAmount= Double.parseDouble(principal)*(Double.parseDouble(annualRate)/12)*Math.pow((1+Double.parseDouble(annualRate)/12),Double.parseDouble(year)*2)/(Math.pow(1+Double.parseDouble(annualRate)/12,Double.parseDouble(year)/12-1))+"";
//			s.setInvestmentType("分期还款");
//			s.setRevenueType("等额本息");
//			s.setData(compoundAmount);
//			showDataService.add(s);
//			PrintWriter writer = respond.getWriter();
//			writer.write(compoundAmount+"");
//		}
		
}
//	public void calculateBenjin() throws IOException {
//		
//			principal= (float) (total/ (Math.pow((1 + annualRate), year)));
//			System.out.println(principal);
//			PrintWriter writer =respond.getWriter();
//			writer.write(principal+"");
//			
//	}
//	public void calculateFuli() throws IOException {
//		System.out.println(44444);
//		compoundAmount= (float) (principal * Math.pow((1 + annualRate), year));
//		PrintWriter writer = respond.getWriter();
//		writer.write( compoundAmount+"");
//
//	}

	// 复利计算方式
	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}

	public String getAnnualRate() {
		return annualRate;
	}

	public void setAnnualRate(String annualRate) {
		this.annualRate = annualRate;
	}
	public void setApplication(Map<String, Object> arg0) {
		
	}
	public void setSession(Map<String, Object> arg0) {
		
	}
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}
	public void setServletResponse(HttpServletResponse arg0) {
		this.respond=arg0;
	}
		
	public void search()
	{
		
	}
}
