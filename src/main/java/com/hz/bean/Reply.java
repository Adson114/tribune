package com.hz.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Reply {
    private Integer replyId;
    private Date modifyTime;
    private Date publishTime;
    private Date delReplyTime;
    private Integer replyState;
    private  Integer topicId;
    private  Integer userId;
    private  String content;
    private Topic topic;
    private User user;


    public Date getDelReplyTime() {
        return delReplyTime;
    }

    public void setDelReplyTime(Date delReplyTime) {
        this.delReplyTime = delReplyTime;
    }

    public Integer getReplyState() {
        return replyState;
    }

    public void setReplyState(Integer replyState) {
        this.replyState = replyState;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLocalModifyTime() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String date = df.format(modifyTime);
        return date;
    }
}
