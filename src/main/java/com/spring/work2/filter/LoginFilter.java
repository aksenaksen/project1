package com.spring.work2.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session =req.getSession();
        StringBuffer url = req.getRequestURL();
        String lurl = url.substring(url.length()-5);
        HttpServletResponse res=(HttpServletResponse) response;
        System.out.println(lurl);
        System.out.println(session.getAttribute("ID"));

        if (session.getAttribute("ID") == null) {
                res.sendRedirect("/login");
                return;
        }
        chain.doFilter(req,res);
    }

}
