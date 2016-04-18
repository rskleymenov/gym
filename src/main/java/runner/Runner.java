package runner;

import com.persistance.factory.DAOFactory;
import com.persistance.support.ByMonth;
import com.persistance.support.ByType;
import com.persistance.support.ByYear;

public class Runner {

	public static void main(String[] args) {
		for(ByMonth byMonth : DAOFactory.getMySQLFactory().getPaymentDAO().getStatisticByMonth(2016)) {
			System.out.println(byMonth);
		}
		
		for(ByType byType : DAOFactory.getMySQLFactory().getPaymentDAO().getStatisticByTypeOfMoney(2016)) {
			System.out.println(byType);
		}
		
		for(ByYear byYear : DAOFactory.getMySQLFactory().getPaymentDAO().getStatisticByYear()) {
			System.out.println(byYear);
		}
	}
}