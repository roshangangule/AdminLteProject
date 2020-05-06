package com.javabykiran.dao;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javabykiran.model.StateMaster;
import com.javabykiran.model.User;
import com.javabykiran.model.Users;

@Repository
public class UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	public Serializable register(User user) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Serializable id = session.save(user);
		transaction.commit();
		return id;
	}
	

	public Users addUser(Users users) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(users);
		transaction.commit();
		return users;
		
	}

	public void update(Users users) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(users);
		tx.commit();
	}

	public List<Users> userList() {
		Session session = sessionFactory.openSession();
		List<Users>list=session.createCriteria(Users.class).list();
		return list;
	}

	public Users getUsers(int id) {
		return (Users) sessionFactory.openSession().get(Users.class, id);

	}

	public void deleteUser(int id) {
		Session session = sessionFactory.openSession();
		Transaction tx  = session.beginTransaction();
		Users users = (Users) session.load(Users.class, id);
		if (null != users) {
			session.delete(users);
		}
		tx.commit();
	}

	public void deleteSelected(int[] ids) {
		Session session = sessionFactory.openSession();
		for(int i = 0;i<ids.length;i++) {
		Transaction tx  = session.beginTransaction();
		Users users = (Users) session.byId(Users.class).load(ids[i]);
		session.delete(users);
		tx.commit();
	}
	}

	public List<StateMaster> getState() {
		Session session = sessionFactory.openSession();
		   List<StateMaster> statesList=session.createCriteria(StateMaster.class).list();
		   return statesList;
		   }

	public StateMaster getStateByID(int sid) {
		return (StateMaster) sessionFactory.openSession().get(StateMaster.class,sid);
	}
	}
	


