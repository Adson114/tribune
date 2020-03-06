package com.hz.controller;


import com.alibaba.fastjson.JSONObject;
import com.hz.bean.Reply;
import com.hz.bean.Tab;
import com.hz.bean.Topic;
import com.hz.bean.User;
import com.hz.service.IReplyService;
import com.hz.service.ITabService;
import com.hz.service.ITopicService;
import com.hz.service.IUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;


import static com.hz.util.ImageUtils.getUuidFileName;
import static com.hz.util.ImageUtils.subPath;
import static com.hz.util.IsNumber.isNumber;

@Controller
public class UserController {
    @Autowired(required = false)
    private IUserService userService;

    @Autowired
    private ITopicService topicService;

    @Autowired
    private IReplyService replyService;

    @Autowired
    private ITabService tabService;


    //跳转到注册页面
    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    //根据ajax传入的用户名判断是否在数据库已经存在，确保其唯一性
    @ResponseBody
    @RequestMapping(value = "/toRegister", produces = "text/html;charset=UTF-8")
    public String toRegister(String name, HttpServletRequest request) {
        String result = "";
        List<String> userList = userService.queryUserName();
        System.out.println(userList);
        if (name == null || name.equals("")) {
            return result;
        }
        for (String userName : userList) {
            System.out.println(userName);
            if (userName.equals(name)) {
                result = "exist";
                return result;
            } else {
                result = "ok";
            }
        }
        return result;
    }

    //获得传入的值，存入数据库，并将状态返回
//    @ResponseBody
    @RequestMapping("/reg2")
    public ModelAndView reg2(HttpServletRequest request, HttpServletResponse response, RedirectAttributes model,HttpSession session)  {
        String regUserName = request.getParameter("username");
        String regPhoneNumber = request.getParameter("phoneNumber");
        String regLoginPassword = request.getParameter("loginPassword");
        String sex = request.getParameter("sex");
        String regEmail = request.getParameter("email");
        String regTrueName = request.getParameter("trueName");
        String code=request.getParameter("captcha");
        if(!(code.equalsIgnoreCase(session.getAttribute("code").toString()))){
            model.addFlashAttribute("message", "验证码有误");
            return new ModelAndView("redirect:/register");
        }else {
            List<String>nameList=userService.queryUserName();
            for(String name:nameList){
                if(regUserName.equals(name)){
                    model.addFlashAttribute("message", "用户已存在");
                    return new ModelAndView("redirect:/register");
                }
            }
            Date date = new Date();
            User user = new User();
            user.setEmail(regEmail);
            user.setMobile(regPhoneNumber);
            user.setUserName(regUserName);
            user.setSex(sex);
            user.setTrueName(regTrueName);
            user.setPassword(regLoginPassword);
            user.setRegTime(date);
            int num = userService.intoRegister(user);
//            if (num > 0) {
                return new ModelAndView("redirect:/allView");
//            } else {
//                model.addFlashAttribute("message", "注册失败");
//                return new ModelAndView("redirect:/register");
//            }

        }
    }


    //跳转到登录页面
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    //跳转到管理员用户页面
    @RequestMapping("/toAdmin")
    public String toAdmin(Model model) {
        List<User> adminToUser = userService.adminQueryUser();
        model.addAttribute("adminToUser", adminToUser);
        return "adminUser";
    }

    //跳转到管理员帖子页面
    @RequestMapping("/toATopic")
    public String toATopic(Model model) {
        List<Topic> adminToTopic = topicService.adminToTopic();
        model.addAttribute("adminToTopic", adminToTopic);
        return "adminTopic";
    }

    //跳转到管理员回复页面
    @RequestMapping("/toAReply")
    public String toAReply(Model model) {
        List<Reply> adminToReply = replyService.adminToReply();
        model.addAttribute("adminToReply", adminToReply);
        return "adminReply";
    }

    //跳转到管理员板块页面
    @RequestMapping("/toATab")
    public String toATab(Model model) {
        List<Tab> adminToTab = tabService.queryTab();
        model.addAttribute("adminToTab", adminToTab);
        return "adminTab";
    }

    //根据登录页面传入的值，判断是否登录成功，如果成功将userName存入session，
    //根据userName查出userId，也存入session中，如果不成功，返回提示信息到登录页面
//    @ResponseBody
    @RequestMapping("/log2")
    public ModelAndView log2(HttpServletRequest request, RedirectAttributes model, HttpSession session) {
        String uName = request.getParameter("username");
        String pwd = request.getParameter("password");
        String code=request.getParameter("captcha");
        String  mm=session.getAttribute("code").toString();
        if(!(code.equalsIgnoreCase(mm))){
            model.addFlashAttribute("message", "验证码有误");
            return new ModelAndView("redirect:/login");
        }else {
        List<User> user = userService.doLogin(uName, pwd);
        List<User> admin = userService.doLoginAdmin(uName, pwd, 1);
        System.out.println(user);
        if (user.size() == 0) {
            model.addFlashAttribute("message", "登录失败");
            return new ModelAndView("redirect:/login");
        } else {
            Integer userId = userService.queryUserId(uName);
            String face = userService.queryUser(uName);
            request.getSession().setAttribute("userInfo", uName);
            request.getSession().setAttribute("userId", userId);
            request.getSession().setAttribute("face", face);
            if (admin.size() == 0) {
                return new ModelAndView("redirect:/allView");
            } else {
                request.getSession().setAttribute("type", 1);
                return new ModelAndView("redirect:/toAdmin");
            }
        }
        }
    }

    //退出，将session中的值全部清空
    @RequestMapping("/out")
    public String out(HttpSession session) {
        session.removeAttribute("userInfo");
        session.removeAttribute("userId");
        session.removeAttribute("face");
        session.removeAttribute("type");
        return "redirect:/allView";
    }

    //跳转到changeInfo界面
    //根据用户的id，查询出用户的信息，存入个人信息页面
    @RequestMapping("/toChangeInfo")
    public String toChangeInfo(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("userId");
        List<User> list = userService.toChangeInfo(id);
        List<Topic> goodList = topicService.queryGood(1);
        model.addAttribute("goodList", goodList);
        model.addAttribute("list", list);
        return "changeInfo";
    }

    //设置页面中侧边栏列表加精信息
    @RequestMapping("/toSetInfo")
    public String setInfo(Model model) {
        List<Topic> goodList = topicService.queryGood(1);
        model.addAttribute("goodList", goodList);
        return "setInfo";
    }

    //上传头像
    @RequestMapping("/upLoad")
    public ModelAndView upLoad(MultipartFile p, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("userInfo");
        Date date=new Date();
        User user = new User();
        if (p != null) {
            String path=subPath("Tribune",request)+"Tribune/src/main/webapp/static/img";
            String filename = p.getOriginalFilename();
            String newFileName=getUuidFileName(filename);
            File f = new File(path, newFileName);
            try {
                if (!f.getParentFile().exists()) {
                    f.getParentFile().mkdirs();
                }
                p.transferTo(new File(path + File.separator + newFileName));
                user.setFace(newFileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        user.setUpdateTime(date);
        user.setUserName(name);
        userService.upLoad(user);
        //将session中用户的头像清空并将刚存入的头像存入session中
        session.removeAttribute("face");
        String face = userService.queryUser(name);
        request.getSession().setAttribute("face", face);
        return new ModelAndView("redirect:/toChangeInfo");
    }

    //修改用户的个人信息
    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public ModelAndView updateUser(HttpServletRequest request, Integer uId) {
        User user = new User();
        user.setUserId(uId);
        Date date = new Date();
        user.setUpdateTime(date);
        user.setUserName(request.getParameter("uName"));
        user.setPassword(request.getParameter("uPassword"));
        user.setEmail(request.getParameter("uEmail"));
        user.setMobile(request.getParameter("uMobile"));
        user.setSex(request.getParameter("uSex"));
        user.setDeclaration(request.getParameter("decText"));
        userService.updateUser(user);
        return new ModelAndView("redirect:/toChangeInfo");
    }

    //修改个性签名
    @RequestMapping(value = "/updateDec", method = RequestMethod.POST)
    public ModelAndView updateDec(HttpServletRequest request, Integer uId) {
        User user = new User();
        user.setUserId(uId);
        Date date = new Date();
        user.setUpdateTime(date);
        user.setDeclaration(request.getParameter("decText"));
        int a = userService.updateDec(user);
        System.out.println(a);
        return new ModelAndView("redirect:/toChangeInfo");
    }

    //增加用户
    @RequestMapping("/addUser")
    public ModelAndView addUser(HttpServletRequest request) {
        String userName = request.getParameter("uName");
        String password = request.getParameter("pwd");
        String trueName = request.getParameter("tName");
        String sex = request.getParameter("sex");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        Date date = new Date();
        User user = new User();
        user.setSex(sex);
        user.setPassword(password);
        user.setMobile(mobile);
        user.setUserName(userName);
        user.setEmail(email);
        user.setRegTime(date);
        user.setTrueName(trueName);
        userService.intoRegister(user);
        return new ModelAndView("redirect:/toAdmin");
    }

    //删除用户
    @RequestMapping("/delUser")
    public String delUser(HttpServletRequest request) {
        User user = new User();
        Date date=new Date();
        user.setUserId(isNumber(request,"id"));
        user.setDelUserTime(date);
        userService.delUser(user);
        return "adminUser";
    }




}
