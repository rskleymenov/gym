package com.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.commands.Command;
import com.commands.impl.AddCardCommand;
import com.commands.impl.AddCostCommand;
import com.commands.impl.AddUserCommand;
import com.commands.impl.CalculateStatisticCommand;
import com.commands.impl.ChangeLocaleCommand;
import com.commands.impl.ChangePasswordCommand;
import com.commands.impl.ChooseCardCommand;
import com.commands.impl.ChooseUserForUpdate;
import com.commands.impl.ConfirmPaymentCommand;
import com.commands.impl.DeleteCardCommand;
import com.commands.impl.DeleteCostCommand;
import com.commands.impl.DeletePaymentCommand;
import com.commands.impl.FindUserByIdNameSurnameCommand;
import com.commands.impl.FindUserForUpdateCommand;
import com.commands.impl.LoginCommand;
import com.commands.impl.LogoutCommand;
import com.commands.impl.NoCommand;
import com.commands.impl.RedirectToAddCostsCommand;
import com.commands.impl.RedirectToAddUserCommand;
import com.commands.impl.RedirectToAdminPageCommand;
import com.commands.impl.RedirectToAnalyticCommand;
import com.commands.impl.RedirectToFindUserPageCommand;
import com.commands.impl.RedirectToFindUserToUpdateCommand;
import com.commands.impl.RedirectToPayUserPageCommand;
import com.commands.impl.RedirectToPaymentInfoCommand;
import com.commands.impl.RedirectToUserChangePasswordCommand;
import com.commands.impl.RedirectToUserPageCommand;
import com.commands.impl.UpdateUserCommand;
import com.commands.impl.UserPayCommand;

public class RequestHelper {
	private static RequestHelper instance;

	private Map<String, Command> commands = new HashMap<>();

	private RequestHelper() {
		commands.put("login", new LoginCommand());
		commands.put("logout", new LogoutCommand());
		commands.put("toAddPaymentById", new RedirectToFindUserPageCommand());
		commands.put("findUserByIdOrElse", new FindUserByIdNameSurnameCommand());
		commands.put("chooseUserToPay", new RedirectToPayUserPageCommand());
		commands.put("confirmPayment", new ConfirmPaymentCommand());
		commands.put("deletePayment", new DeletePaymentCommand());
		commands.put("toAddCosts", new RedirectToAddCostsCommand());
		commands.put("chooseCostToDelete", new DeleteCostCommand());
		commands.put("addCost", new AddCostCommand());
		commands.put("toPaymentInfo", new RedirectToPaymentInfoCommand());
		commands.put("chooseCard", new ChooseCardCommand());
		commands.put("addBillInformation", new AddCardCommand());
		commands.put("deleteCard", new DeleteCardCommand());
		commands.put("toAnalytic", new RedirectToAnalyticCommand());
		commands.put("getStatistic", new CalculateStatisticCommand());
		commands.put("toAddUser", new RedirectToAddUserCommand());
		commands.put("addUser", new AddUserCommand());
		commands.put("toUpdateUser", new RedirectToFindUserToUpdateCommand());
		commands.put("findUserForUpdate", new FindUserForUpdateCommand());
		commands.put("chooseUserToUpdate", new ChooseUserForUpdate());
		commands.put("updateUser", new UpdateUserCommand());
		commands.put("userPayCommand", new UserPayCommand());
		commands.put("toChangePassword", new RedirectToUserChangePasswordCommand());
		commands.put("changePassword", new ChangePasswordCommand());
		commands.put("toUserPage", new RedirectToUserPageCommand());
		commands.put("toAdminPage", new RedirectToAdminPageCommand());
		commands.put("changeLocale", new ChangeLocaleCommand());
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
