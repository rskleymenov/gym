package com.persistance;

import java.util.List;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import com.entity.User;

public class UserDAO {
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

	public void persist(User user) {
		openCurrentSessionwithTransaction();
		this.currentSession.persist(user);
		closeCurrentSessionwithTransaction();
	}

	public void update(User user) {
		openCurrentSessionwithTransaction();
		this.currentSession.update(user);
		closeCurrentSessionwithTransaction();
	}

	public User findById(long id) {
		openCurrentSession();
		User user = (User) currentSession.get(User.class, id);
		closeCurrentSession();
		return user;
	}

	public void delete(User user) {
		openCurrentSessionwithTransaction();
		this.currentSession.delete(user);
		closeCurrentSessionwithTransaction();
	}

	@SuppressWarnings("unchecked")
	public List<User> findAll() {
		openCurrentSession();
		List<User> users = this.currentSession.createQuery("from User").list();
		closeCurrentSession();
		return users;
	}

	public User findByLoginAndPassword(String email, String password) {
		openCurrentSession();
		User user = (User) currentSession.createCriteria(User.class).add(Restrictions.eq("email", email))
				.add(Restrictions.eq("password", password)).uniqueResult();
		closeCurrentSession();
		return user;
	}
}
