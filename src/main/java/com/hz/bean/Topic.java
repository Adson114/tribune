package com.hz.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Topic extends BaseDomain{
    private String title;
    private Date modifyTime;
    private Integer click;
    private  String userName;
    private  Date publishTime;
    private  Date delTopicTime;
    private User user;
    private String content;
    private Integer topUserId;
    private Tab tab;
    private Integer topicId;
    private Integer tabId;
    private Integer good;
    private Integer topicState;

    public Topic() {
    }

    public Date getDelTopicTime() {
        return delTopicTime;
    }

    public void setDelTopicTime(Date delTopicTime) {
        this.delTopicTime = delTopicTime;
    }

    public Integer getTopicState() {
        return topicState;
    }

    public void setTopicState(Integer topicState) {
        this.topicState = topicState;
    }

    public Integer getGood() {
        return good;
    }

    public void setGood(Integer good) {
        this.good = good;
    }

    public Integer getTabId() {
        return tabId;
    }

    public void setTabId(Integer tabId) {
        this.tabId = tabId;
    }

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public Tab getTab() {
        return tab;
    }

    public void setTab(Tab tab) {
        this.tab = tab;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getTopUserId() {
        return topUserId;
    }

    public void setTopUserId(Integer topUserId) {
        this.topUserId = topUserId;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String nickName) {
        this.userName = nickName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getModifyTime() {

        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public String getLocalPublishTime() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String date = df.format(publishTime);
        return date;
    }

    public String getLocalModifyTime() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String date = df.format(modifyTime);
        return date;
    }


}
