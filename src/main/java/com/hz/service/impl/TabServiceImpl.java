package com.hz.service.impl;

import com.hz.bean.Tab;
import com.hz.dao.ITabDao;
import com.hz.service.ITabService;
import com.hz.service.ITopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TabServiceImpl implements ITabService {
    @Autowired
    private ITabDao tabDao;

    @Override
    public List<Tab> queryTab() {
        return tabDao.queryTab();
    }

    @Override
    public int addTab(Tab tab) {
        return tabDao.addTab(tab);
    }

    @Override
    public List<String> queryTabName() {
        return tabDao.queryTabName();
    }

    @Override
    public int delTab(Tab tab) {
        return tabDao.delTab(tab);
    }


}
