package com.test.dao;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.test.model.showDataModel;

public class showDataDao {
	public void save(showDataModel s)
	{
		   Configuration configuration=new Configuration().configure();//单例，管理配置文件
		    SessionFactory factory=configuration.buildSessionFactory();
		    Session session=factory.openSession();//session是客户端请求的服务   单例（暂时理解为connection）
		    //开启事务
		    Transaction transaction=session.beginTransaction();
		    session.save(s);
		    //提交事务
		    transaction.commit();
		    session.close();
	}
	public Session getSession()
	{
		Configuration configuration=new Configuration().configure();//单例，管理配置文件
	    SessionFactory factory=configuration.buildSessionFactory();
	    Session session=factory.openSession();//session是客户端请求的服务   单例（暂时理解为connection）
	    return session;
		
	}
	public List<showDataModel> searchByLike(String keyValue,String num)
	{
		String a = null;
		if(num.equals("1"))
			a="f_1";
		if(num.equals("2"))
			a="f_2";
		if(num.equals("3"))
			a="f_3";
		if(num.equals("4"))
			a="f_4";
		Session session = getSession();
//	String hql="form showDataModel where "+a+" like %"+keyValue+"%";
		String sql="select * form t_showdata where "+a+" like %"+keyValue+"%";
		SQLQuery query= session.createSQLQuery(sql);
		List<showDataModel> list = query.list();
		session.getTransaction().commit();
		session.close();
		return list;
		
	}
	
}
