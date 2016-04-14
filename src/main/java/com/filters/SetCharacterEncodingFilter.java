package com.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Created by Kleymenov on 20.12.2015.
 */
public class SetCharacterEncodingFilter implements Filter {
    //encoding for filter
    private String encoding;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //get standard encoding
        this.encoding = filterConfig.getInitParameter("requestEncoding");
        if (null == this.encoding) {
            //set encoding to UTF-8
            this.encoding = "UTF-8";
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //set encoding
        servletRequest.setCharacterEncoding(encoding);
        //set content type
        servletResponse.setContentType("text/html; charset=UTF-8");
        //set encoding
        servletResponse.setCharacterEncoding("UTF-8");
        //do filter
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        //nothing
    }
}
