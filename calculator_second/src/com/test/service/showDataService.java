package com.test.service;

import java.util.List;

import com.test.dao.showDataDao;
import com.test.model.showDataModel;

public interface showDataService {
//��ѯ���ȫ������
 public List<showDataModel> fillAll();
 //��Ӽ�¼����
 public void add(showDataModel s);
 //like��ѯ
 public List<showDataModel> searchByLike(String keyValue,String num);
}
