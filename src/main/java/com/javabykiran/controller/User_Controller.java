package com.javabykiran.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javabykiran.model.StateMaster;
import com.javabykiran.model.User;
import com.javabykiran.model.Users;
import com.javabykiran.service.LoginService;
import com.javabykiran.service.User_Service;

@Controller
public class User_Controller {

	@Autowired
	private User_Service user_Service;


	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("model") User user, Model model) {
		System.out.println(user.getEmail());
		boolean b = user_Service.register(user);
		if (b == true) {
			model.addAttribute("msg", "Added Successfully");
			return new ModelAndView("login");
		} else {
			model.addAttribute("msg", "Not Added ");
			return new ModelAndView("register");
		}

	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute Users users, BindingResult Result) {
		System.out.println(users);
		if (users.getId() == null) {

			StateMaster s = new StateMaster();
			String temp = (String) Result.getFieldValue("stateMaster");
			int sid = Integer.parseInt(temp);
			StateMaster stateDetails = user_Service.getStateByID(sid);
			s.setSid(Integer.parseInt(temp));
			s.setName(stateDetails.getName());
			users.setStateMaster(s);

			user_Service.addUser(users);

		} else {
			StateMaster s = new StateMaster();
			String temp = (String) Result.getFieldValue("stateMaster");
			int sid = Integer.parseInt(temp);
			StateMaster stateDetails = user_Service.getStateByID(sid);
			s.setSid(Integer.parseInt(temp));
			s.setName(stateDetails.getName());
			users.setStateMaster(s);

			user_Service.update(users);
		}
		return new ModelAndView("redirect:userList");
	}

	@RequestMapping(value = "/add_user_page")
	public ModelAndView newUser(HttpSession session, HttpServletResponse response) throws IOException {
		
		ModelAndView model = new ModelAndView();

		Users users = new Users();
		List<StateMaster> al = user_Service.getState();
		Map<String, String> hm = new HashMap<String, String>();
		for (Iterator iterator = al.iterator(); iterator.hasNext();) {
			StateMaster state = (StateMaster) iterator.next();
			String id = String.valueOf(state.getSid());
			hm.put(id, state.getName());
		}
		model.addObject("statesList", al);
		model.addObject("Users", users);
		model.setViewName("add_user");
		return model;
		}
	

	@RequestMapping(value = "/userList")
	public ModelAndView userList(Model model) {
		ModelAndView mv = new ModelAndView();
		List<Users> userList = user_Service.userList();
		System.out.println(userList);
		if (userList != null) {

			mv.setViewName("users");
			mv.addObject("userList", userList);
			return mv;
		} else {
			mv.addObject("userList", "Record Not Found");
			return new ModelAndView("dashboard");
		}
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request) {
		int Id = Integer.parseInt(request.getParameter("id"));
		Users users = user_Service.getByID(Id);

		StateMaster stateDetails = user_Service.getStateByID(users.getStateMaster().getSid());

		int selectedStateId = stateDetails.getSid();

		List<StateMaster> al = user_Service.getState();
		Map<String, String> hm = new HashMap<String, String>();
		for (Iterator iterator = al.iterator(); iterator.hasNext();) {
			StateMaster state = (StateMaster) iterator.next();
			String id = String.valueOf(state.getSid());
			hm.put(id, state.getName());
		}
		ModelAndView model = new ModelAndView("add_user");
		model.addObject("statesList", al);

		model.addObject("Users", users);

		return model;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteUser(@PathVariable("id") int id) {
		user_Service.deleteUser(id);
		List<Users> l = user_Service.userList();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users");
		mv.addObject("userList", l);
		return mv;

	}

	@RequestMapping(value = "/multipleDelete", method = RequestMethod.POST)
	public ModelAndView multipledelete(@RequestParam(value = "id[]", required = false) int[] ids) {
		if (ids != null) {
			System.out.println("checkbox checked " + ids.length);
			for (int i = 0; i < ids.length; i++) {
				System.out.println(ids[i] + "");
			}
			user_Service.deleteSelected(ids);
			System.out.println("Deleted");
		} else {
			System.out.println("not seletec any record");
		}
		return new ModelAndView("redirect:userList");

	}

}
