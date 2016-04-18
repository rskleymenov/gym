package com.commands.impl;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;
import com.entity.User;
import com.entity.enums.Role;
import com.entity.enums.Sex;
import com.manager.ConfigurationManager;
import com.persistance.UserDAO;
import com.persistance.factory.DAOFactory;

public class UpdateUserCommand implements Command{
	private UserDAO userDAO = DAOFactory.getMySQLFactory().getUserDAO();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String patronymic = request.getParameter("patronymic");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String dormitory = request.getParameter("dormitory");
		String room = request.getParameter("room");
		String role = request.getParameter("role");
		String sex = request.getParameter("sex");
		User user = new User();
		user.setId(Integer.valueOf(id));
		user.setName(name);
		user.setSurname(surname);
		user.setPatronymic(patronymic);
		user.setEmail(email);
		user.setPassword(password);
		user.setDormitoryNumber(Integer.valueOf(dormitory));
		user.setRoomNumber(Integer.valueOf(room));
		user.setRole(Role.valueOf(role));
		user.setSex(Sex.valueOf(sex));
		user.setRegistrationDate(new java.sql.Date(new Date().getTime()));
		userDAO.update(user);
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.ADMIN_UPDATE_USER_PATH);
	}

}
