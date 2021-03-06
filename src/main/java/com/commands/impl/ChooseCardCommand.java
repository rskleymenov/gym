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

public class ChooseCardCommand implements Command {
	private BillInformationDAO billInformationDAO = DAOFactory.getMySQLFactory().getBillInformationDAO();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String billId = request.getParameter("billId");
		BillInformation activeBill = billInformationDAO.getActualBillInformation();
		activeBill.setSelected(false);
		billInformationDAO.update(activeBill);
		activeBill = billInformationDAO.findById(Integer.valueOf(billId));
		activeBill.setSelected(true);
		billInformationDAO.update(activeBill);
		List<BillInformation> bills = billInformationDAO.findAll();
		request.getSession().setAttribute("bills", bills);
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.ADMIN_PAYMENT_INFO);
	}

}
