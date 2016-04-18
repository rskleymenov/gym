package com.commands.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;
import com.manager.ConfigurationManager;

public class RedirectToFindUserToUpdateCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.ADMIN_UPDATE_USER_PATH);
	}

}
