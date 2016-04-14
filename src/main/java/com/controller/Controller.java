package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commands.Command;

public class Controller extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private RequestHelper requestHelper = RequestHelper.getInstance();

	public Controller() {
		super();
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = null;
		try {
			// get some command from jsp
			Command command = requestHelper.getCommand(request);
			// execute command
			page = command.execute(request, response);
		} catch (ServletException e) {
			// print errors
			e.printStackTrace();
			// set error message
/*			request.setAttribute("errorMessage",
					MessageManager.getInstance().getProperty(MessageManager.SERVLET_EXCEPTION_ERROR_MESSAGE));
			page = ConfigurationManager.getInstance().getProperty(ConfigurationManager.ERROR_PAGE_PATH);*/
		} catch (IOException e) {
			e.printStackTrace();
			// set error message
/*			request.setAttribute("errorMessage",
					MessageManager.getInstance().getProperty(MessageManager.IO_EXCEPTION_ERROR_MESSAGE));
			page = ConfigurationManager.getInstance().getProperty(ConfigurationManager.ERROR_PAGE_PATH);*/
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
		// forward request and response
		dispatcher.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
}
