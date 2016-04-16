package com.persistance;

import java.util.List;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import com.entity.Cost;
import com.persistance.utils.HibernateUtil;

public class CostDAO {
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
	
	public void persist(Cost cost) {
		openCurrentSessionwithTransaction();
		this.currentSession.persist(cost);
		closeCurrentSessionwithTransaction();
	}
	
	public void delete(Cost cost) {
		openCurrentSessionwithTransaction();
		this.currentSession.delete(cost);
		closeCurrentSessionwithTransaction();
	}
	
	public Cost findById(int id) {
		openCurrentSessionwithTransaction();
		Cost cost = (Cost) currentSession.get(Cost.class, id);
		closeCurrentSessionwithTransaction();
		return cost;
	}
	
	@SuppressWarnings("unchecked")
	public List<Cost> findAll() {
		openCurrentSessionwithTransaction();
		List<Cost> users = this.currentSession.createQuery("from Cost").list();
		closeCurrentSessionwithTransaction();
		return users;
	}
}
