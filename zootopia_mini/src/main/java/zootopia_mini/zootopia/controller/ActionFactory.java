package zootopia_mini.zootopia.controller;

import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.action.contest.ContestBoardAction;
import zootopia_mini.zootopia.controller.action.main.MainAction;
import zootopia_mini.zootopia.controller.action.member.JoinFormAction;
import zootopia_mini.zootopia.controller.action.member.LoginAction;
import zootopia_mini.zootopia.controller.action.member.LoginFormAction;
import zootopia_mini.zootopia.controller.action.member.LogoutAction;

public class ActionFactory {
	
	private static ActionFactory itc = new ActionFactory();
	
	public static ActionFactory getInstance() {
		return itc;
	}
	public Action getAction(String command) {
		Action ac =null;
		
		if(command.equals("main")) ac = new MainAction();
		else if(command.equals("loginform")) ac = new LoginFormAction();
		else if(command.equals("login")) ac = new LoginAction();
		else if(command.equals("logout")) ac = new LogoutAction();
		else if(command.equals("joinform")) ac = new JoinFormAction();
		
		else if(command.equals("contestBoard")) ac = new ContestBoardAction();
		else if(command.equals("contestForm")) ac = new ContestFormAction();
		
		
		return ac;
	}


}
