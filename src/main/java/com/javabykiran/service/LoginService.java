package com.javabykiran.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabykiran.dao.LoginDao;
import com.javabykiran.model.User;

@Service // @Component//@Cpnfiguration
public class LoginService {

	@Autowired
	LoginDao loginDao;

	public boolean checkLogin(User user) {
		User user2 = loginDao.checkUser(user);
		if (user2 != null) {
			return true;
		} else {
			return false;
		}
	}


	public boolean registerUser(User user) {
		return false;
			
	

	}
	
	
}
