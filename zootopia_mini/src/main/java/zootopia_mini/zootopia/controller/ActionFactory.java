package zootopia_mini.zootopia.controller;


import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.action.community.CommunityBoardAction;
import zootopia_mini.zootopia.controller.action.community.CommunityDetailAction;
import zootopia_mini.zootopia.controller.action.contest.ContestBoardAction;
import zootopia_mini.zootopia.controller.action.main.MainAction;
import zootopia_mini.zootopia.controller.action.member.LoginFormAction;

public class ActionFactory {
	
	private static ActionFactory itc = new ActionFactory();
	
	public static ActionFactory getInstance() {
		return itc;
	}
	public Action getAction(String command) {
		Action ac =null;
		
		if(command.equals("main")) ac = new MainAction();
		else if(command.equals("loginform")) ac = new LoginFormAction();
		else if(command.equals("contestBoard")) ac = new ContestBoardAction();
		else if(command.equals("communityBoard")) ac = new CommunityBoardAction();
		else if(command.equals("communityDetailAction ")) ac = new CommunityDetailAction();
		
		
		return ac;
	}


}
