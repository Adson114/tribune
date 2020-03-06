package com.hz.Interceptor;

import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@ControllerAdvice
public class InterceptResponse implements ResponseBodyAdvice <Object>{
    private static final String LOGIN_URI = "/register";
    @Override
    public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter returnType, MediaType selectedContentType, Class<? extends HttpMessageConverter<?>> selectedConverterType, ServerHttpRequest request, ServerHttpResponse response) {
//        ServletServerHttpResponse responseTemp=(ServletServerHttpResponse)response;
//        HttpServletResponse resp=responseTemp.getServletResponse();
//        ServletServerHttpRequest sshr=(ServletServerHttpRequest)request;
//        HttpServletRequest req=sshr.getServletRequest();
//        if(body instanceof
//        String requestPath=request.getURI().getPath();
//        if(requestPath.equals(LOGIN_URI)){
//            HttpServletRequest httpServletRequest=((ServletRequestAttributes) RequestContextHolder)
//        }
        return body;
    }
}
