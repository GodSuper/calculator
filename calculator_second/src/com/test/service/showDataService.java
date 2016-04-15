package com.test.service;

import java.util.List;

import com.test.dao.showDataDao;
import com.test.model.showDataModel;

public interface showDataService {
//查询表的全部数据
 public List<showDataModel> fillAll();
 //添加记录到表
 public void add(showDataModel s);
 //like查询
 public List<showDataModel> searchByLike(String keyValue,String num);
}
