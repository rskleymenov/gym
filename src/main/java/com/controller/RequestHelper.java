package com.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.commands.Command;
import com.commands.impl.LoginCommand;
import com.commands.impl.NoCommand;

public class RequestHelper {
	private static RequestHelper instance;

	private Map<String, Command> commands = new HashMap<>();
	
	private RequestHelper() {
		commands.put("login", new LoginCommand());
	}

	// return single instance
	public static RequestHelper getInstance() {
		if (instance == null) {
			instance = new RequestHelper();
		}
		return instance;
	}

	// get some command from map of commands
	public Command getCommand(HttpServletRequest request) {
		String action = request.getParameter("command");
		Command command = commands.get(action);
		if (command == null) {
			command = new NoCommand();
		}
		return command;
	}
}

