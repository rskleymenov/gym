package com.persistance;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import com.entity.BillInformation;

public class BillInformationDAO {
	private Session currentSession;
	private Transaction currentTransaction;

	private Session openCurrentSession() {
		this.currentSession = HibernateUtil.getSessionFactory().openSession();
		return currentSession;
	}

	private Session openCurrentSessionwithTransaction() {
		this.currentSession = HibernateUtil.getSessionFactory().openSession();
		this.currentTransaction = currentSession.beginTransaction();
		return currentSession;
	}

	private void closeCurrentSession() {
		this.currentSession.close();
	}

	private void closeCurrentSessionwithTransaction() {
		this.currentTransaction.commit();
		this.currentSession.close();
	}

	public BillInformation getActualBillInformation() {
		openCurrentSession();
		BillInformation billInformation = (BillInformation) this.currentSession.createCriteria(BillInformation.class)
				.add(Restrictions.eq("isSelected", true)).uniqueResult();
		closeCurrentSession();
		return billInformation;
	}
}
