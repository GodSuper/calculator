package com.test.serviceImpl;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.test.dao.showDataDao;
import com.test.service.showDataService;

public class showDataServiceImpl implements showDataService{

	/*private void init()
	{
		Configuration configuration=new Configuration().configure();
		SessionFactory factory=configuration.buildSessionFactory();
		Session session=factory.openSession();
		
	}*/
	public showDataDao fillAll() {
		Session session = init();
		session.beginTransaction();
		session.createCriteria("");
		return null;
	}

	public void add(showDataDao s) {
		Session session = init();
		session.save(s);
		session.close();
		
	}

	private Session init() {
		Configuration configuration=new Configuration().configure();
		SessionFactory factory=configuration.buildSessionFactory();
		Session session=factory.openSession();
		return session;
	}

}
