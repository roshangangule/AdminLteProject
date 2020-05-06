package com.javabykiran.logger;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class LogginAspect {
	@Before("execution(* com.javabykiran.controller.LoginController.checkLogin(..))")
    public void logBeforecontrollerlogincheck(JoinPoint joinPoint) 
    {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm a");
		Date date = new Date();
		System.out.println("Started calling checkLogin of loginController at date :"+date);
    }
 
	@Before("execution(* com.javabykiran.service.LoginService.checkLogin(..))")
    public void logbeforeservicechecklogin(JoinPoint joinPoint) 
    {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm a");
		Date date = new Date();
		System.out.println("Started calling checkLogin of loginService at date :"+date);
    }
 
	@Before("execution(* com.javabykiran.dao.LoginDao.checkUser(..))")
    public void logBeforedaocheckuser(JoinPoint joinPoint) 
    {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm a");
		Date date = new Date();
		System.out.println("Started calling checkUser of loginDao at date :"+date);
    }
 
	
}

	
	
	

	
	
	
	
	
