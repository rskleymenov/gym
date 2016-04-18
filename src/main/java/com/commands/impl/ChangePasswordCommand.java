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

public class ChangePasswordCommand implements Command{
	private UserDAO userDAO = DAOFactory.getMySQLFactory().getUserDAO();
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		User user = (User)request.getSession().getAttribute("user");
		String realUserPassword = user.getPassword();
		if (realUserPassword.equals(currentPassword) && newPassword.equals(confirmPassword)) {
			user.setPassword(newPassword);
			userDAO.update(user);
			request.setAttribute("errorFlag", false);
			request.setAttribute("color", "color: red;");
		} else {
			request.setAttribute("errorFlag", true);
			request.setAttribute("color", "color: green;");
		}
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.USER_CHANGE_PASSWORD_PATH);
	}

}
