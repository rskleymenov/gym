package com.commands.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;
import com.entity.Cost;
import com.manager.ConfigurationManager;
import com.persistance.CostDAO;
import com.persistance.factory.DAOFactory;

public class RedirectToAddCostsCommand implements Command{
	private CostDAO costDAO = DAOFactory.getMySQLFactory().getCostDAO();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Cost> costs = costDAO.findAll();
		request.getSession().setAttribute("costs", costs);
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.ADMIN_ADD_COST);
	}

}
