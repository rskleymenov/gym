package com.persistance.factory;

import com.persistance.BillInformationDAO;
import com.persistance.CostDAO;
import com.persistance.PaymentDAO;
import com.persistance.UserDAO;

public class DAOMySQLFactory {

	public UserDAO getUserDAO() {
		return new UserDAO();
	}
	
	public BillInformationDAO getBillInformationDAO() {
		return new BillInformationDAO();
	}
	
	public PaymentDAO getPaymentDAO() {
		return new PaymentDAO();
	}
	
	public CostDAO getCostDAO() {
		return new CostDAO();
	}
}
