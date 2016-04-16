package runner;

import java.sql.Date;
import java.util.Calendar;

import com.entity.Payment;
import com.entity.User;
import com.entity.enums.PaymentType;
import com.persistance.factory.DAOFactory;

public class Runner {

	public static void main(String[] args) {
		User user = DAOFactory.getMySQLFactory().getUserDAO().findById(3);
		int year = Calendar.getInstance().get(Calendar.YEAR);
		Payment payment = new Payment(user, 30.0, new Date(new java.util.Date().getTime()), "month", year,
				PaymentType.CASH);
		DAOFactory.getMySQLFactory().getPaymentDAO().persist(payment);
	}
}