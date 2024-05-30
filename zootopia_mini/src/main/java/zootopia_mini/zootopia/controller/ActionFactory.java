package zootopia_mini.zootopia.controller;

import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.action.contest.ContestBoardAction;
import zootopia_mini.zootopia.controller.action.main.MainAction;
import zootopia_mini.zootopia.controller.action.member.LoginFormAction;
import zootopia_mini.zootopia.controller.action.mypage.ModifyAction;
import zootopia_mini.zootopia.controller.action.mypage.MypageAction;

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
		
		// mypage
		else if(command.equals("mypage")) ac = new MypageAction();
		else if(command.equals("modify")) ac = new ModifyAction();
		
		
		
		
		return ac;
	}


}
