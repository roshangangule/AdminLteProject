package com.javabykiran.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javabykiran.model.StateMaster;

@Controller
public class State_Controller {
	
	@Autowired
	private SessionFactory sf;
	
	@RequestMapping(value="/addState")
	public void addState()
	{
		StateMaster sm=new StateMaster();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		sm.setName("Maharshtra");
		session.save(sm);
		tx.commit();
		
		
	}

}
