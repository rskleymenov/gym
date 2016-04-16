package com.persistance;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import com.entity.User;
import com.persistance.utils.HibernateUtil;

public class UserDAO {
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

	public User findById(int id) {
		openCurrentSessionwithTransaction();
		User user = (User) currentSession.get(User.class, id);
		closeCurrentSessionwithTransaction();
		return user;
	}

	public void delete(User user) {
		openCurrentSessionwithTransaction();
		this.currentSession.delete(user);
		closeCurrentSessionwithTransaction();
	}

	@SuppressWarnings("unchecked")
	public List<User> findAll() {
		openCurrentSessionwithTransaction();
		List<User> users = this.currentSession.createQuery("from User").list();
		closeCurrentSessionwithTransaction();
		return users;
	}

	public User findByLoginAndPassword(String email, String password) {
		openCurrentSessionwithTransaction();
		User user = (User) this.currentSession.createCriteria(User.class).add(Restrictions.eq("email", email))
				.add(Restrictions.eq("password", password)).uniqueResult();
		closeCurrentSessionwithTransaction();
		return user;
	}

	public User findByNameAndSurname(String name, String surname) {
		openCurrentSessionwithTransaction();
		User user = (User) this.currentSession.createCriteria(User.class).add(Restrictions.eq("name", name))
				.add(Restrictions.eq("surname", surname)).uniqueResult();
		closeCurrentSessionwithTransaction();
		return user;
	}

	@SuppressWarnings("unchecked")
	public List<User> findByNameOrSurname(String value, boolean isName) {
		openCurrentSessionwithTransaction();
		String nameOrSurname = null;
		if (isName) {
			nameOrSurname = "name";
		} else {
			nameOrSurname = "surname";
		}
		List<User> users = this.currentSession.createCriteria(User.class).add(Restrictions.eq(nameOrSurname, value))
				.list();
		closeCurrentSessionwithTransaction();
		return users;
	}

	public List<User> findUser(String value) {
		value = value.trim();
		String[] userInfo = value.split("\\s+");
		List<User> users = new ArrayList<>();
		if (userInfo.length == 1) {
			List<User> listOfUsers = findByNameOrSurname(userInfo[0], true);
			if (!listOfUsers.isEmpty()) {
				users.addAll(listOfUsers);
			}
			listOfUsers = findByNameOrSurname(userInfo[0], false);
			if (!listOfUsers.isEmpty()) {
				users.addAll(listOfUsers);
			}
			if (isInteger(value)) {
				User user = findById(Integer.parseInt(value));
				if (user != null) {
					users.add(user);
				}
			}
		} else {
			User user = findByNameAndSurname(userInfo[1], userInfo[0]);
			if (user == null) {
				user = findByNameAndSurname(userInfo[0], userInfo[1]);
			}
			users.add(user);
		}
		return users;
	}

	private static boolean isInteger(String str) {
		if (str == null) {
			return false;
		}
		int length = str.length();
		if (length == 0) {
			return false;
		}
		int i = 0;
		if (str.charAt(0) == '-') {
			if (length == 1) {
				return false;
			}
			i = 1;
		}
		for (; i < length; i++) {
			char c = str.charAt(i);
			if (c < '0' || c > '9') {
				return false;
			}
		}
		return true;
	}
}
