package com.commands.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;
import com.entity.User;
import com.manager.ConfigurationManager;
import com.persistance.UserDAO;
import com.persistance.factory.DAOFactory;

public class RedirectToPayUserPage implements Command {
	private static final String selectedUser = "selectedUser";
	private UserDAO userDAO = DAOFactory.getMySQLFactory().getUserDAO();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter(selectedUser);
		User user = userDAO.findById(Integer.valueOf(userId));
		request.getSession().setAttribute("selectedUser", user);
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.ADMIN_ADD_PAYMENT);
	}

}
