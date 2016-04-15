package com.test.serviceImpl;



import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.test.dao.showDataDao;
import com.test.model.showDataModel;
import com.test.service.showDataService;

public class showDataServiceImpl implements showDataService{
	showDataDao dao=new showDataDao();

	/*private void init()
	{
		Configuration configuration=new Configuration().configure();
		SessionFactory factory=configuration.buildSessionFactory();
		Session session=factory.openSession();
		
	}*/
	public List<showDataModel> fillAll() {
		Session session=dao.getSession();
		Criteria criteria =session.createCriteria(showDataModel.class);
		List<showDataModel> list =criteria.list();
		return list;
	}

	public void add(showDataModel s) {
		
		dao.save(s);
		
	}

	public List<showDataModel> searchByLike(String keyValue,String num) {
		return dao.searchByLike(keyValue, num);
	}
	

//	private Session init() {
//		Configuration configuration=new Configuration().configure();
//		SessionFactory factory=configuration.buildSessionFactory();
//		Session session=factory.openSession();
//		return session;
//	}

}
