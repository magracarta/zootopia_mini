package zootopia_mini.zootopia.controller;


import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.action.community.CommunityBoardAction;
import zootopia_mini.zootopia.controller.action.community.CommunityDetailAction;
import zootopia_mini.zootopia.controller.action.contest.ContestBoardAction;
import zootopia_mini.zootopia.controller.action.contest.ContestDetailAction;
import zootopia_mini.zootopia.controller.action.contest.ContestFormAction;
import zootopia_mini.zootopia.controller.action.contest.ContestcountAction;
import zootopia_mini.zootopia.controller.action.contest.ContestcreateAction;
import zootopia_mini.zootopia.controller.action.main.MainAction;
import zootopia_mini.zootopia.controller.action.member.JoinFormAction;
import zootopia_mini.zootopia.controller.action.member.LoginAction;
import zootopia_mini.zootopia.controller.action.member.LoginFormAction;
import zootopia_mini.zootopia.controller.action.member.LogoutAction;
import zootopia_mini.zootopia.controller.action.mypage.ModifyAction;
import zootopia_mini.zootopia.controller.action.mypage.ModifyFormAction;
import zootopia_mini.zootopia.controller.action.mypage.MycontestAction;
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
		else if(command.equals("login")) ac = new LoginAction();
		else if(command.equals("logout")) ac = new LogoutAction();
		else if(command.equals("joinform")) ac = new JoinFormAction();
		
		else if(command.equals("contestBoard")) ac = new ContestBoardAction();
		
		//community
		else if(command.equals("communityBoard")) ac = new CommunityBoardAction();
		else if(command.equals("communityDetail")) ac = new CommunityDetailAction();
		
		// mypage
		else if(command.equals("mypage")) ac = new MypageAction();
		else if(command.equals("modify")) ac = new ModifyAction();
		else if(command.equals("modifyform")) ac = new ModifyFormAction();
		else if(command.equals("mycontest")) ac = new MycontestAction();
		
		
		else if(command.equals("contestForm")) ac = new ContestFormAction();
		else if(command.equals("contestcreateAction")) ac = new ContestcreateAction();
		else if(command.equals("contestcount")) ac = new ContestcountAction();
		else if(command.equals("contestDetail")) ac = new ContestDetailAction();
		
		
		return ac;
	}


}
