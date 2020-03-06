package com.hz.service;

import com.hz.bean.Tab;

import java.util.List;

public interface ITabService {
    List<Tab> queryTab();

    int addTab(Tab tab);

    List<String>queryTabName();

    int delTab(Tab tab);
}
