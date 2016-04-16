package com.persistance;

import java.util.List;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import com.entity.Payment;
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
}
