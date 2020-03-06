package com.hz.util;

import javax.servlet.http.HttpServletRequest;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IsNumber {

        public static Integer isNumber(HttpServletRequest request,String id){
            int num = 0;
            try {
                String str=request.getParameter(id);
                num=Integer.parseInt(str);
                
            }catch (NumberFormatException e){
                e.printStackTrace();
            }
            return num;
        }
}
