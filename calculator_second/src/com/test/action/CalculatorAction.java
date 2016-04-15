package com.test.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;
import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.junit.Test;

import com.opensymphony.xwork2.ActionSupport;
import com.test.dao.showDataDao;
import com.test.model.showDataModel;
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
	private String keyValue;
	private String num;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getKeyValue() {
		return keyValue;
	}
	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}
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
	showDataModel s=new showDataModel();
	showDataService service=new showDataServiceImpl();
public void calculate() throws IOException 

{   
	System.out.println("3333333333333333333333333");
	
	System.out.println("6666666666666666666");
	if(a!=null&&a.equals("1"))
	{
	System.err.println(compoundAmount);
		principal= (Double.parseDouble(compoundAmount)/ (Math.pow((1 + Double.parseDouble(annualRate)), Double.parseDouble(year))))+"";
		System.out.println(principal);
		System.out.println("3333333333333333333333333");
		//JSONArray jsonArray =JSONArray.fromObject(principal);
		//String message =jsonArray.toString();
			PrintWriter writer = respond.getWriter();
			writer.write(principal+"");
			System.out.println(principal);
			s.setF1(principal);
			s.setF2(annualRate);
			s.setF3(year);
			s.setF4(compoundAmount);
			s.setInvestmentType("本金计算");
			s.setRevenueType("存入本金");
			s.setData(principal);
			service.add(s);
			
	}
		if(a!=null&&a.equals("2"))
		{
			compoundAmount= (Double.parseDouble(principal) * Math.pow((1 +Double.parseDouble(annualRate)), Double.parseDouble(year)))+"";
			
			PrintWriter writer = respond.getWriter();
			writer.write(compoundAmount+"");
			s.setF1(principal);
			s.setF2(annualRate);
			s.setF3(year);
			s.setF4(compoundAmount);
			s.setInvestmentType("复利计算");
			s.setRevenueType("复利终值");
			s.setData(compoundAmount);
			service.add(s);
		}
		if(a!=null&&a.equals("3"))
		{
			annualRate=(StrictMath.pow(Double.parseDouble(compoundAmount)/Double.parseDouble(principal),1.0/ Double.parseDouble(year))-1)+""; 
			s.setF1(principal);
			s.setF2(annualRate);
			s.setF3(year);
			s.setF4(compoundAmount);
			s.setInvestmentType("存款利率");
			s.setRevenueType("存入年利率");
			s.setData(annualRate);
			service.add(s);
			PrintWriter writer = respond.getWriter();
			writer.write(annualRate+"");
				
		}
		if(a!=null&&a.equals("4"))
		{	
		year=(Math.log(Double.parseDouble(compoundAmount)/Double.parseDouble(principal)))/(Math.log(1 + Double.parseDouble(annualRate)))+"";
		System.out.println(compoundAmount);
		System.out.println(principal);
			PrintWriter writer = respond.getWriter();
			writer.write(year+"");
			s.setF1(principal);
			s.setF2(annualRate);
			s.setF3(year);
			s.setF4(compoundAmount);
			s.setInvestmentType("存款年限");
			s.setRevenueType("存入年限");
			s.setData(year);
			service.add(s);
		}
		if(a!=null&&a.equals("5"))
		{
			compoundAmount= Double.parseDouble(principal)*(Double.parseDouble(annualRate)/12)*Math.pow((1+Double.parseDouble(annualRate)/12),Double.parseDouble(year)*2)/(Math.pow(1+Double.parseDouble(annualRate)/12,Double.parseDouble(year)/12-1))+"";
			PrintWriter writer = respond.getWriter();
			writer.write(compoundAmount+"");
			s.setF1(principal);
			s.setF2(annualRate);
			s.setF3(year);
			s.setF4(compoundAmount);
			s.setInvestmentType("分期还款");
			s.setRevenueType("等额本息");
			s.setData(compoundAmount);
			service.add(s);
		}
		
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
public void searchKeyWord() throws IOException{
	List<showDataModel> searchByLike = service.searchByLike(keyValue, num);
	System.out.println(searchByLike.size());
	JSONArray jsonArray= JSONArray.fromObject(service.searchByLike(keyValue, num));
	String dataString=jsonArray.toString();
	respond.setContentType("text/html;charset=UTF-8");   
	PrintWriter writer = respond.getWriter();
	writer.write(dataString);
	System.out.println(dataString);
	System.out.println("3432252352");
	
}

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
	
	public void search() throws IOException
	{
		//service.fillAll();
		//JSONArray jsonArray=new JSONArray();
		JSONArray jsonArray= JSONArray.fromObject(service.fillAll());
		String dataString=jsonArray.toString();
		respond.setContentType("text/html;charset=UTF-8");   
		PrintWriter writer = respond.getWriter();
		writer.write(dataString);
		System.out.println(service.fillAll());
		System.out.println("32562");
		System.out.println(dataString);
	}
}
