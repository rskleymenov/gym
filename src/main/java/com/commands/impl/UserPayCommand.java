package com.commands.impl;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;
import com.entity.Payment;
import com.entity.User;
import com.entity.enums.PaymentType;
import com.manager.ConfigurationManager;
import com.persistance.BillInformationDAO;
import com.persistance.PaymentDAO;
import com.persistance.factory.DAOFactory;

public class UserPayCommand implements Command {
	private PaymentDAO paymentDAO = DAOFactory.getMySQLFactory().getPaymentDAO();
	private BillInformationDAO billInformationDAO = DAOFactory.getMySQLFactory().getBillInformationDAO();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] selectedMonths = request.getParameterValues("month");
		int year = Calendar.getInstance().get(Calendar.YEAR);
		User selectedUser = (User) request.getSession().getAttribute("user");
		String paymentCard = request.getParameter("cardNumber");
		Double expense = billInformationDAO.getActualBillInformation().getPrice();
		if (selectedMonths == null) {
			request.setAttribute("errorFlag", true);
		} else {
			request.setAttribute("errorFlag", false);
			for (String month : selectedMonths) {
				Payment payment = new Payment(selectedUser, expense, new Date(new java.util.Date().getTime()), month,
						year, PaymentType.BANK);
				payment.setPaymentCard(paymentCard);
				paymentDAO.persist(payment);
			}
			List<Payment> payments = paymentDAO.findPaymentsByUser(selectedUser.getId());
			request.getSession().setAttribute("paymentsOfUser", payments);
		}
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.USER_INFO_PATH);
	}

}
