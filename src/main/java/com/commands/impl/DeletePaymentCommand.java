package com.commands.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;
import com.entity.Payment;
import com.entity.User;
import com.manager.ConfigurationManager;
import com.persistance.PaymentDAO;
import com.persistance.factory.DAOFactory;

public class DeletePaymentCommand implements Command {
	private PaymentDAO paymentDAO = DAOFactory.getMySQLFactory().getPaymentDAO();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User selectedUser = (User) request.getSession().getAttribute("selectedUser");
		String selectedPayment = request.getParameter("selectedPayment");
		Payment payment = paymentDAO.findById(Integer.valueOf(selectedPayment));
		paymentDAO.delete(payment);
		List<Payment> payments = paymentDAO.findPaymentsByUser(selectedUser.getId());
		request.getSession().setAttribute("paymentsOfUser", payments);
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.ADMIN_ADD_PAYMENT);
	}

}
