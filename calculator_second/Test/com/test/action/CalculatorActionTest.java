package com.test.action;

import junit.framework.Assert;

import org.junit.Test;

public class CalculatorActionTest {
	
	@Test
	public void calculate(){
		String a="1";
		if(a!=null&&a.equals("1"))
		{
			
			double principal= 100/ (Math.pow(1 +0.5, 3));
				System.out.println(principal);
//				Assert.assertTrue(29.62962962962963==principal); //判断运行结果是否与预期的相同 
		}
			if(a!=null&&a.equals("2"))
			{
				double compoundAmount= 100 * Math.pow((1 +0.5), 4);
				System.out.println(compoundAmount);
			}
			if(a!=null&&a.equals("3"))
			{
				double annualRate=(StrictMath.pow(100/1000,1.0/ 5)-1); 
				System.out.println(annualRate);
					
			}
			if(a!=null&&a.equals("4"))
			{	
				double year=(Math.log(4000/5000))/(Math.log(1 +0.5));
				System.out.println(year);
			}
			if(a!=null&&
					a.equals("5"))
			{
				double compoundAmount= 4000*(0.5/12)*Math.pow((1+0.5/12),5*2)/(Math.pow(1+0.5/12,5/12-1));
				System.out.println(compoundAmount);
			}
//		fail("Not yet implemented");
	}

}
