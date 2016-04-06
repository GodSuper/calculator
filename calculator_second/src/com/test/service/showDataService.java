package com.test.service;

import com.test.dao.showDataDao;

public interface showDataService {
//查询表的全部数据
 public showDataDao fillAll();
 //添加记录到表
 public void add(showDataDao s);
 
}
