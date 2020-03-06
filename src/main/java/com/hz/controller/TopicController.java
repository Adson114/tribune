package com.hz.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hz.bean.Reply;
import com.hz.bean.Tab;
import com.hz.bean.Topic;
import com.hz.bean.User;
import com.hz.service.IReplyService;
import com.hz.service.ITabService;
import com.hz.service.ITopicService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

import static com.hz.util.IsNumber.isNumber;


@Controller
public class TopicController {

    private static Logger logger = Logger.getLogger(TopicController.class);

    @Autowired
    private ITopicService topicService;

    @Autowired
    private IReplyService replyService;

    @Autowired
    private ITabService tabService;


    //跳转到main页面
    @RequestMapping("/allView")
    public String list(@RequestParam(required = true, defaultValue = "1") Integer pn, Model model, Integer tabId) {



        //紧跟查询结果的分页情况（第几页， 每页多少记录）
        PageHelper.startPage(pn, 25);
        //查询出topic的数据
        List<Topic> list = topicService.queryContent();
        PageInfo<Topic> p = new PageInfo<Topic>(list, 25);
        model.addAttribute("page", p);
        //查询出所有的板块
        List<Tab> tabList = tabService.queryTab();
        //查询出加精帖子
        List<Topic> goodList = topicService.queryGood(1);
        model.addAttribute("goodList", goodList);
        model.addAttribute("tabList", tabList);
        model.addAttribute("list", list);
        logger.info("打印日志");
        return "main";
    }

    //跳转到main
    //根据不同的板块id在首页上展示与相对应板块帖子的信息
    @RequestMapping("/tab/{tabId}")
    public ModelAndView toTadSon(@RequestParam(required = true, defaultValue = "1") Integer pn, Model model, @PathVariable("tabId") Integer tabId) {
        PageHelper.startPage(pn, 25);
        ModelAndView mav = new ModelAndView("main");
        List<Topic> list = topicService.queryTabSon(tabId);
        List<Tab> tabList = tabService.queryTab();
        PageInfo<Topic> p = new PageInfo<Topic>(list, 25);
        List<Topic> goodList = topicService.queryGood(1);
        model.addAttribute("goodList", goodList);
        model.addAttribute("page", p);
        mav.addObject("list", list);
        mav.addObject("tabList", tabList);
        return mav;
    }

    //发帖
    //根据获取页面相关的信息，插入数据并且重定向到主页面
    @RequestMapping("/insertContain")
    public ModelAndView insertContain(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("userId");
        String name = (String) session.getAttribute("userInfo");
        Integer tabId = Integer.parseInt(request.getParameter("tab"));
        String content = request.getParameter("area");
        String title = request.getParameter("title");
        User user = new User();
        user.setUserName(name);
        Date data = new Date();
        Topic topic = new Topic();
        topic.setModifyTime(data);
        topic.setPublishTime(data);
        topic.setTopUserId(id);
        topic.setTitle(title);
        topic.setContent(content);
        topic.setTabId(tabId);
        topic.setUser(user);
        topicService.insertContain(topic);
        return new ModelAndView("redirect:/allView");
    }


    //获取所有的板块的信息，并且将信息返回到发送页面，从而在下拉框中获取发布的板块
    @RequestMapping("/send")
    public String send(Model model) {
        List<Tab> sendTabList = tabService.queryTab();
        model.addAttribute("sendTabList", sendTabList);
        return "send";
    }

    //跳转的帖子的详情
    @RequestMapping("/detail")
    public String detail() {
        return "detailedPost";
    }

    //根据获取点击获得的ID，从而查询出帖子有关的信息和其回复信息
    @RequestMapping("/t/{id}")
    public String detailTopic(@PathVariable("id") Integer id, HttpServletRequest request, Model model) {
        topicService.updateClick(id);
        List<Topic> list1 = topicService.detailContent(id);
        List<Reply> list2 = replyService.detailReply(id);
        int countReply = replyService.countReply(id);
        Integer topicId = list1.get(0).getTopicId();
        List<Topic> goodList = topicService.queryGood(1);
        model.addAttribute("goodList", goodList);
        request.setAttribute("topicId", topicId);
        model.addAttribute("list1", list1);
        model.addAttribute("list2", list2);
        model.addAttribute("count", countReply);
        return "detailedPost";
    }

    //跳转到changePerson
    //根据ajax传入帖子的ID值，删除其相对应的帖子和帖子下的回复
    @RequestMapping("/removeTopic")
    public String removeTopic(HttpServletRequest request) {
        Topic topic = new Topic();
        Date date = new Date();
        topic.setTopicId(isNumber(request,"id"));
        topic.setDelTopicTime(date);
        topicService.removeTopic(topic);
        return "changePerson";
    }

    //跳转到adminTopic
    //根据ajax传入帖子的ID值，删除其相对应的帖子和帖子下的回复
    @RequestMapping("/delTopic")
    public String delTopic(HttpServletRequest request) {
        Topic topic = new Topic();
        Date date = new Date();
        topic.setDelTopicTime(date);
        topic.setTopicId(isNumber(request,"id"));
        int num=topicService.removeTopic(topic);
        System.out.println(num);
        return "adminTopic";
    }

    //根据获得的帖子ID，为其设置为加精帖子
    @RequestMapping("/makeSure")
    public String makeSure(HttpServletRequest request) {
        Topic topic = new Topic();
        Date date = new Date();
        topic.setTopicId(isNumber(request,"id"));
        topic.setModifyTime(date);
        topicService.makeSure(topic);
        return "adminTopic";
    }

    //根据获得的帖子ID，为其设置取消加精帖子
    @RequestMapping("/canxel")
    public String canxel(HttpServletRequest request) {
        Topic topic = new Topic();
        Date date = new Date();
        topic.setTopicId(isNumber(request,"id"));
        topic.setModifyTime(date);
        topicService.canxel(topic);
        return "adminTopic";
    }

    //查询出加精帖子的信息
    @RequestMapping("/queryGood")
    public String queryGood(Model model) {
        List<Topic> goodList = topicService.queryGood(1);
        model.addAttribute("goodList", goodList);
        return "side";
    }


}
