package com.hz.controller;

import com.hz.bean.Tab;
import com.hz.service.ITabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

import static com.hz.util.IsNumber.isNumber;


@Controller
public class TabController {
    @Autowired
    private ITabService tabService;

    //根据ajax传入的值，增加板块并重定向到adminTab
    @RequestMapping("/addTab")
    public ModelAndView addTab(HttpServletRequest request){
        String tabName=request.getParameter("tabCh");
        String tabNameEn=request.getParameter("tabEn");
        Tab tab=new Tab();
        Date date=new Date();
        tab.setCreateTime(date);
        tab.setTabName(tabName);
        tab.setTabNameEn(tabNameEn);
        tabService.addTab(tab);
        return new ModelAndView("redirect:/toATab");
    }

    //根据ajax传入板块中文名，判断，数据库中是否存在相同字段
    @ResponseBody
    @RequestMapping(value = "/toCh", produces = "text/html;charset=UTF-8")
    public String toRegister(String tabCh, HttpServletRequest request) {
        String result = "";
        List<String> tabNameList = tabService.queryTabName();
        if(tabCh.equals("")||tabCh==null){
            return result;
        }
        for (String tabName : tabNameList) {
            System.out.println(tabName);
            if (tabName.equals(tabCh)) {
                result = "已存在";
                return result;
            } else {
                result = "ok";
            }
        }
        return result;
    }

    //删除板块
    @RequestMapping("/delTab")
    public String delTab(HttpServletRequest request){
        Tab tab=new Tab();
        Date date=new Date();
        tab.setDelTabTime(date);
        tab.setTabId(isNumber(request,"id"));
        tabService.delTab(tab);
        return "adminTab";
    }
}
