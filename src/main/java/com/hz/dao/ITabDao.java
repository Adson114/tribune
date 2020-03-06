package com.hz.dao;

import com.hz.bean.Tab;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ITabDao {
    List<Tab> queryTab();

    int addTab(Tab tab);

    List<String>queryTabName();

    int delTab(Tab tab);
}
