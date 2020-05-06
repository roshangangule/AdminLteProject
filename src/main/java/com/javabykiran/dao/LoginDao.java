package com.javabykiran.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javabykiran.model.User;



@Repository
public class LoginDao {

	@Autowired
	SessionFactory sessionFactory;

	public User checkUser(User user) {
		Session session = sessionFactory.openSession();


		Query q = session.createQuery("FROM User U WHERE U.email = :email and U.password = :password");

		q.setParameter("email", user.getEmail());

		q.setParameter("password", user.getPassword());

		List<User> list = q.list();
		return user;

	}


	public boolean saveUser(User user) {

		Session session=sessionFactory.openSession();
				
		Transaction tx = session.beginTransaction();
		int result = (Integer) session.save(user);
		
		tx.commit();
		if (result > 0)
					
			return true;
				

			return false;

		}
	}










