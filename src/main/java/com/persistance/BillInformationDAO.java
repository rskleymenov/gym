package com.persistance;

import java.util.List;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import com.entity.BillInformation;
import com.persistance.utils.HibernateUtil;

public class BillInformationDAO {
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

	public BillInformation getActualBillInformation() {
		openCurrentSessionwithTransaction();
		BillInformation billInformation = (BillInformation) this.currentSession.createCriteria(BillInformation.class)
				.add(Restrictions.eq("isSelected", true)).uniqueResult();
		closeCurrentSessionwithTransaction();
		return billInformation;
	}
	
	public void persist(BillInformation billInformation) {
		openCurrentSessionwithTransaction();
		this.currentSession.persist(billInformation);
		closeCurrentSessionwithTransaction();
	}
	
	public void update(BillInformation billInformation) {
		openCurrentSessionwithTransaction();
		this.currentSession.update(billInformation);
		closeCurrentSessionwithTransaction();
	}
	
	public BillInformation findById(int id) {
		openCurrentSessionwithTransaction();
		BillInformation billInformation = (BillInformation) currentSession.get(BillInformation.class, id);
		closeCurrentSessionwithTransaction();
		return billInformation;
	}
	
	public void delete(BillInformation billInformation) {
		openCurrentSessionwithTransaction();
		this.currentSession.delete(billInformation);
		closeCurrentSessionwithTransaction();
	}
	
	@SuppressWarnings("unchecked")
	public List<BillInformation> findAll() {
		openCurrentSessionwithTransaction();
		List<BillInformation> bills = this.currentSession.createQuery("from BillInformation").list();
		closeCurrentSessionwithTransaction();
		return bills;
	}
}
