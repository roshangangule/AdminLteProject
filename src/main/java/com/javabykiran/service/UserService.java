package com.javabykiran.service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabykiran.dao.UserDao;
import com.javabykiran.model.StateMaster;
import com.javabykiran.model.User;
import com.javabykiran.model.Users;


@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public boolean register(User user)
	{
		Serializable id=userDao.register(user);
		if(id!=null)
			return true;
		else
			return false;
		
	}
	
	public Users addUser(Users users)
	{
		
		return userDao.addUser(users);
		
		
	}
	
	public void update(Users users) {
		userDao.update(users);
	}
	
	public List<StateMaster> getState()
	{
		
		return userDao.getState();
	}
	
	public List<Users> userList()
	{
		List<Users>list=userDao.userList();
		return list;
	}
	
	public Users getByID(int id) {
		return userDao.getUsers(id);
	}
	
	public void deleteUser(int id) {
		userDao.deleteUser(id);
	}

	public void deleteSelected(int[] ids) {
		userDao.deleteSelected(ids);
		
	}

	public StateMaster getStateByID(int sid) {
		return userDao.getStateByID(sid);
	}
	
	}
