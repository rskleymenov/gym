package com.persistance.factory;

import com.persistance.BillInformationDAO;
import com.persistance.UserDAO;

public class DAOMySQLFactory {

	public UserDAO getUserDAO() {
		return new UserDAO();
	}
	
	public BillInformationDAO getBillInformationDAO() {
		return new BillInformationDAO();
	}
}
