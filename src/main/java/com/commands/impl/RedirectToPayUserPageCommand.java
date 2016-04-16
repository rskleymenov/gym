package com.commands.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.commands.Command;
import com.entity.Payment;
import com.entity.User;
import com.manager.ConfigurationManager;
import com.persistance.PaymentDAO;
import com.persistance.UserDAO;
import com.persistance.factory.DAOFactory;

public class RedirectToPayUserPageCommand implements Command {
	private static final String selectedUser = "selectedUser";
	private UserDAO userDAO = DAOFactory.getMySQLFactory().getUserDAO();
	private PaymentDAO paymentDAO = DAOFactory.getMySQLFactory().getPaymentDAO();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter(selectedUser);
		HttpSession httpSession = request.getSession();
		User user = userDAO.findById(Integer.valueOf(userId));
		List<Payment> payments = paymentDAO.findPaymentsByUser(user.getId());
		httpSession.setAttribute("selectedUser", user);
		httpSession.setAttribute("paymentsOfUser", payments);
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.ADMIN_ADD_PAYMENT);
	}

}
