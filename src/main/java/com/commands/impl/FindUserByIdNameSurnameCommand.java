package com.commands.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;
import com.entity.User;
import com.manager.ConfigurationManager;
import com.persistance.UserDAO;
import com.persistance.factory.DAOFactory;

public class FindUserByIdNameSurnameCommand implements Command {
	private static final String userInf = "userInformation";
	private UserDAO userDAO = DAOFactory.getMySQLFactory().getUserDAO();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userInformation = request.getParameter(userInf);
		List<User> users = userDAO.findUser(userInformation);
		request.setAttribute("users", users);
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.ADMIN_ADD_INFO_PATH);
	}

}