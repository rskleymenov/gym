package com.commands.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.commands.Command;
import com.entity.BillInformation;
import com.entity.Payment;
import com.entity.User;
import com.manager.ConfigurationManager;
import com.persistance.BillInformationDAO;
import com.persistance.PaymentDAO;
import com.persistance.UserDAO;
import com.persistance.factory.DAOFactory;

public class LoginCommand implements Command {
	private static final String PARAM_EMAIL = "email";
	private static final String PARAM_PASSWORD = "password";
	private UserDAO userDAO = DAOFactory.getMySQLFactory().getUserDAO();
	private BillInformationDAO billInformationDAO = DAOFactory.getMySQLFactory().getBillInformationDAO();
	private PaymentDAO paymentDAO = DAOFactory.getMySQLFactory().getPaymentDAO();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = null;

		String email = request.getParameter(PARAM_EMAIL);
		String password = request.getParameter(PARAM_PASSWORD);
		HttpSession httpSession = request.getSession();
		BillInformation billInformation = billInformationDAO.getActualBillInformation();
		User user = userDAO.findByLoginAndPassword(email, password);
		if (user != null) {
			switch (user.getRole()) {
			case ADMIN: {
				request.setAttribute("loginErrorFlag", false);
				httpSession.setAttribute("user", user);
				httpSession.setAttribute("billInformation", billInformation);
				page = ConfigurationManager.getInstance().getProperty(ConfigurationManager.ADMIN_INFO_PATH);
				break;
			}
			case USER: {
				request.setAttribute("loginErrorFlag", false);
				httpSession.setAttribute("user", user);
				httpSession.setAttribute("billInformation", billInformation);
				List<Payment> payments = paymentDAO.findPaymentsByUser(user.getId());
				request.getSession().setAttribute("paymentsOfUser", payments);
				page = ConfigurationManager.getInstance().getProperty(ConfigurationManager.USER_INFO_PATH);
				break;
			}
			}

		} else {
			request.setAttribute("loginErrorFlag", true);
			page = ConfigurationManager.getInstance().getProperty(ConfigurationManager.LOGIN_PAGE_PATH);
		}

		return page;
	}

}