package com.commands.impl;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;
import com.manager.ConfigurationManager;

public class ChangeLocaleCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        Locale locale = null;
        String loc = request.getParameter("loc");
        if (loc.equals("ua_UA")) {
            locale = new Locale.Builder().setLanguage("ua").setRegion("UA").build();
        } else {
        	locale = new Locale.Builder().build();
        }
        

        request.getSession().setAttribute("myLocale", locale);
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.LOGIN_PAGE_PATH);
	}

}
