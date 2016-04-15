package runner;

import com.entity.User;
import com.persistance.factory.DAOFactory;

public class Runner {

	public static void main(String[] args) {

		for (User user : DAOFactory.getMySQLFactory().getUserDAO().findUser("        4 ")) {
			System.out.println(user);
		}
	}
}