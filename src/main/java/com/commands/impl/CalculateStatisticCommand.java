package com.commands.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;
import com.manager.ConfigurationManager;
import com.persistance.PaymentDAO;
import com.persistance.factory.DAOFactory;
import com.persistance.support.ByMonth;
import com.persistance.support.ByType;
import com.persistance.support.ByYear;

public class CalculateStatisticCommand implements Command{
	private PaymentDAO paymentDAO = DAOFactory.getMySQLFactory().getPaymentDAO();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String year = request.getParameter("year");
		List<ByMonth> byMonths = paymentDAO.getStatisticByMonth(Integer.valueOf(year));
		request.setAttribute("byMonthList", byMonths);
		List<ByType> byTypes = paymentDAO.getStatisticByTypeOfMoney(Integer.valueOf(year));
		request.setAttribute("byTypeList", byTypes);
		List<ByYear> byYears = paymentDAO.getStatisticByYear();
		request.setAttribute("byYearList", byYears);
		return ConfigurationManager.getInstance().getProperty(ConfigurationManager.ADMIN_STATISTIC_PATH);
	}

}
