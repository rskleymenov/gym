package com.commands.impl;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;
import com.entity.Cost;
import com.entity.User;
import com.manager.ConfigurationManager;
import com.persistance.CostDAO;
import com.persistance.factory.DAOFactory;

public class AddCostCommand implements Command {
	private CostDAO costDAO = DAOFactory.getMySQLFactory().getCostDAO();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		User user = (User) request.getSession().getAttribute("user");
		Cost cost = new Cost(user, new Date(new java.util.Date().getTime()), name, Double.valueOf(price));
		costDAO.persist(cost);
		List<Cost> costs = costDAO.findAll();
		request.getSession().setAttribute("costs", costs);
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.ADMIN_ADD_COST);
	}

}
