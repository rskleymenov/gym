package com.commands.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;
import com.entity.BillInformation;
import com.manager.ConfigurationManager;
import com.persistance.BillInformationDAO;
import com.persistance.factory.DAOFactory;

public class AddCardCommand implements Command {
	private BillInformationDAO billInformationDAO = DAOFactory.getMySQLFactory().getBillInformationDAO();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String card = request.getParameter("card");
		String price = request.getParameter("price");
		BillInformation billInformation = new BillInformation(card, Double.valueOf(price), false);
		billInformationDAO.persist(billInformation);
		List<BillInformation> bills = billInformationDAO.findAll();
		request.getSession().setAttribute("bills", bills);
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.ADMIN_PAYMENT_INFO);
	}

}
