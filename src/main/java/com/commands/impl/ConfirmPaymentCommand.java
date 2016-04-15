package com.commands.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;
import com.manager.ConfigurationManager;

public class ConfirmPaymentCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] selectedMonths = request.getParameterValues("month");
/*		for (String month : selectedMonths) {
			System.out.println(month);
		}*/
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.ADMIN_ADD_PAYMENT);
	}

}
