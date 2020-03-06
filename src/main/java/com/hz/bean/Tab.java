package com.hz.bean;

import java.util.Date;

public class Tab {
    private Integer tabId;
    private String tabName;
    private String tabNameEn;
    private Date createTime;
    private Date delTabTime;
    private Integer tabState;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getDelTabTime() {
        return delTabTime;
    }

    public void setDelTabTime(Date delTabTime) {
        this.delTabTime = delTabTime;
    }

    public Integer getTabState() {
        return tabState;
    }

    public void setTabState(Integer tabState) {
        this.tabState = tabState;
    }

    public Integer getTabId() {
        return tabId;
    }

    public void setTabId(Integer tabId) {
        this.tabId = tabId;
    }

    public String getTabName() {
        return tabName;
    }

    public void setTabName(String tabName) {
        this.tabName = tabName;
    }

    public String getTabNameEn() {
        return tabNameEn;
    }

    public void setTabNameEn(String tabNameEn) {
        this.tabNameEn = tabNameEn;
    }
}
