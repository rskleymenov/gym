package com.commands.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;
import com.manager.ConfigurationManager;
import com.persistance.UserDAO;
import com.persistance.factory.DAOFactory;

public class FindUserByIdNameSurnameCommand implements Command {
	private static final String userInf = "userInformation";
	private UserDAO userDAO = DAOFactory.getMySQLFactory().getUserDAO();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userInformation = (String) request.getAttribute(userInf);
		System.out.println(userInformation);
		/*List<User> users = userDAO.findUser(userInformation);
		for (User user : users) {
			System.out.println(user);
		}*/
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.ERROR_PAGE_PATH);
	}

}
