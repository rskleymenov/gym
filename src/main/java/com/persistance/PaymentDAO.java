package com.persistance;

import java.util.List;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;

import com.entity.Payment;
import com.persistance.support.ByMonth;
import com.persistance.support.ByType;
import com.persistance.support.ByYear;
import com.persistance.utils.HibernateUtil;

public class PaymentDAO {
	private Session currentSession;
	private Transaction currentTransaction;

	private Session openCurrentSessionwithTransaction() {
		this.currentSession = HibernateUtil.getSessionFactory().openSession();
		this.currentTransaction = currentSession.beginTransaction();
		return currentSession;
	}

	private void closeCurrentSessionwithTransaction() {
		this.currentTransaction.commit();
		this.currentSession.close();
	}

	@SuppressWarnings("unchecked")
	public List<Payment> findPaymentsByUser(int id) {
		List<Payment> payments;
		openCurrentSessionwithTransaction();
		payments = this.currentSession.createCriteria(Payment.class).add(Restrictions.eq("user.id", id)).list();
		closeCurrentSessionwithTransaction();
		return payments;
	}

	public void persist(Payment payment) {
		openCurrentSessionwithTransaction();
		this.currentSession.persist(payment);
		closeCurrentSessionwithTransaction();
	}

	public Payment findById(int id) {
		Payment payment = null;
		openCurrentSessionwithTransaction();
		payment = (Payment) currentSession.get(Payment.class, id);
		closeCurrentSessionwithTransaction();
		return payment;
	}

	public void delete(Payment payment) {
		openCurrentSessionwithTransaction();
		this.currentSession.delete(payment);
		closeCurrentSessionwithTransaction();
	}

	@SuppressWarnings("unchecked")
	public List<ByMonth> getStatisticByMonth(int year) {
		openCurrentSessionwithTransaction();
		List<ByMonth> byMonths = this.currentSession.createCriteria(Payment.class)
				.add(Restrictions.eq("paymentYear", year))
				.setProjection(
						Projections.projectionList().add(Projections.groupProperty("paymentMonth"), "paymentMonth")
								.add(Projections.sum("expense"), "expense"))
				.setResultTransformer(Transformers.aliasToBean(ByMonth.class)).list();
		closeCurrentSessionwithTransaction();
		return byMonths;
	}

	@SuppressWarnings("unchecked")
	public List<ByType> getStatisticByTypeOfMoney(int year) {
		List<ByType> byTypes;
		openCurrentSessionwithTransaction();
		byTypes = this.currentSession.createCriteria(Payment.class).add(Restrictions.eq("paymentYear", year))
				.setProjection(Projections.projectionList().add(Projections.groupProperty("paymentType"), "paymentType")
						.add(Projections.sum("expense"), "expense"))
				.setResultTransformer(Transformers.aliasToBean(ByType.class)).list();
		closeCurrentSessionwithTransaction();
		return byTypes;
	}

	@SuppressWarnings("unchecked")
	public List<ByYear> getStatisticByYear(){
		List<ByYear> list;
		openCurrentSessionwithTransaction();
		list = this.currentSession.createCriteria(Payment.class)
				.setProjection(Projections.projectionList().add(Projections.groupProperty("paymentYear"), "paymentYear")
						.add(Projections.sum("expense"), "expense"))
				.setResultTransformer(Transformers.aliasToBean(ByYear.class)).list();
		closeCurrentSessionwithTransaction();
		return list;
	}
}
