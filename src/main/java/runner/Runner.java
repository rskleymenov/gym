package runner;

import com.persistance.factory.DAOFactory;

public class Runner {

	public static void main(String[] args) {
		
		
/*		for(User user : DAOFactory.getMySQLFactory().getUserDAO().findAll()) {
			System.out.println(user);
		}*/
		
		/*
		
		System.out.println(DAOFactory.getMySQLFactory().getUserDAO().findByLoginAndPassword("admin", "root"));*/
		System.out.println(DAOFactory.getMySQLFactory().getBillInformationDAO().getActualBillInformation());
	}

}
