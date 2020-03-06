package com.hz.Interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class Interceptor extends HandlerInterceptorAdapter {

    @Override
    public  boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws  Exception {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=Utf-8");
        request.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();

        if(url.contains("/login")||url.contains("/code")||url.contains("/register")||url.contains("/allView")||
                url.contains("/toRegister")||url.contains("/log2")||url.contains("/out")||url.contains("/reg2")||
                url.contains("/personPage")||url.startsWith("/p/")||url.startsWith("/tab")||
                url.startsWith("/t/")){
            return true;
        }
        HttpSession session=request.getSession();
        String userInfo=(String)session.getAttribute("userInfo");
        if(userInfo!=null){
            return true;
        }
        PrintWriter out = response.getWriter();
        out.println("您没有登录，请先登录！3秒后回到登录页面。");
        response.setHeader("refresh", "3;url=login");
        return false;
    }




}
