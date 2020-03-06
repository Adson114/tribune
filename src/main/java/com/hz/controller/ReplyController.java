package com.hz.controller;

import com.hz.bean.Reply;
import com.hz.bean.Topic;
import com.hz.bean.User;
import com.hz.service.IReplyService;
import com.hz.service.ITopicService;
import com.hz.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.hz.util.IsNumber.isNumber;

@Controller
public class ReplyController {

    @Autowired
    private ITopicService topicService;

    @Autowired
    private IReplyService replyService;

    @Autowired
    private IUserService userService;

    //跳转到personPage
    @RequestMapping("/personPage")
    public  String personPage(HttpServletRequest request, Model model){
        HttpSession session=request.getSession();
        Integer id=(Integer)session.getAttribute("userId");
        //根据登录用户的id查出用户所发帖子的标题、创建时间、内容和点击量
        List<Topic> list=topicService.queryTopicTitle(id);
        //根据登录用户的id查出用户所回复帖子的标题、帖子的作者，回复内容和回复时间
        List<Reply> list2=replyService.queryTopicReply(id);
        model.addAttribute("list",list);
        model.addAttribute("list2",list2);
        return  "personPage";
    }

    //跳转到personPage
    @RequestMapping("/p/{userName}")
    public  String personPage(@PathVariable("userName")String userName, Model model){
        List<User>userList=userService.queryUserInfo(userName);
        //根据传入的名字，获取用户的ID
        Integer id=userService.queryUserId(userName);
        //根据登录用户的id查出用户所发帖子的标题、创建时间、内容和点击量
        List<Topic> list=topicService.queryTopicTitle(id);
        //根据登录用户的id查出用户所回复帖子的标题、帖子的作者，回复内容和回复时间
        List<Reply> list2=replyService.queryTopicReply(id);
        model.addAttribute("userList",userList);
        model.addAttribute("list",list);
        model.addAttribute("list2",list2);
        return  "personPage";
    }

    //跳转到changePerson
    @RequestMapping("changePerson")
    public  String changePerson(HttpServletRequest request, Model model){
        HttpSession session=request.getSession();
        //获取登录用户的ID
        Integer id=(Integer)session.getAttribute("userId");
        //获取登录用户的名字
        String userName=(String)session.getAttribute("userInfo");
        //根据用户名查询出用户的信息
        List<User>changePersonList=userService.queryUserInfo(userName);
        //根据用户ID查询出用户所对应topic的信息
        List<Topic> list=topicService.queryTopicTitle(id);
        //根据用户ID查询出用户所对应reply和topic的信息
        List<Reply> list2=replyService.test(id);
        model.addAttribute("changePersonList",changePersonList);
        model.addAttribute("list",list);
        model.addAttribute("list2",list2);
        return  "changePerson";
    }

    //跳转到detailedPost
    @ResponseBody
    @RequestMapping("/insertReply")
    public String insertReply(HttpServletRequest request){
        HttpSession session=request.getSession();
        Integer id=(Integer)session.getAttribute("userId");
        //创建回帖对象
        Reply reply=new Reply();
        //创建时间对象
        Date date=new Date();
        //设值回帖
        reply.setModifyTime(date);
        reply.setPublishTime(date);
        reply.setUserId(id);
        reply.setTopicId(isNumber(request,"id"));
        reply.setContent(request.getParameter("area"));
        replyService.insertReply(reply);
        return "detailedPost";
    }

    //跳转adminReply
    @RequestMapping("/delReply")
    public String delReply(HttpServletRequest request){
        //删除回帖
        Reply reply=new Reply();
        Date date=new Date();
        reply.setDelReplyTime(date);
        reply.setReplyId(isNumber(request,"id"));
        int num=replyService.delReply(reply);
        System.out.println(num);
        return "adminReply";
    }

    //跳转changePerson
    @RequestMapping("/removeReply")
    public String removeReply(HttpServletRequest request){
        //删除回帖
        Reply reply=new Reply();
        Date date=new Date();
        reply.setDelReplyTime(date);
        reply.setReplyId(isNumber(request,"id"));
        replyService.removeReply(reply);
        return "changePerson";
    }

}
