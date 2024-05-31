package zootopia_mini.zootopia.controller;


import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.action.community.CommunityBoardAction;
import zootopia_mini.zootopia.controller.action.contest.ContestBoardAction;
import zootopia_mini.zootopia.controller.action.main.MainAction;
import zootopia_mini.zootopia.controller.action.member.JoinFormAction;
import zootopia_mini.zootopia.controller.action.member.LoginAction;
import zootopia_mini.zootopia.controller.action.member.LoginFormAction;
import zootopia_mini.zootopia.controller.action.member.LogoutAction;
import zootopia_mini.zootopia.controller.action.mypage.ModifyAction;
import zootopia_mini.zootopia.controller.action.mypage.MypageAction;
import zootopia_mini.zootopia.controller.action.qna.QnaListAction;
import zootopia_mini.zootopia.controller.action.qna.QnaViewAction;
import zootopia_mini.zootopia.controller.action.qna.WriteQnaAction;
import zootopia_mini.zootopia.controller.action.qna.WriteQnaFormAction;

public class ActionFactory {
	
	private static ActionFactory itc = new ActionFactory();
	
	public static ActionFactory getInstance() {
		return itc;
	}
	public Action getAction(String command) {
		Action ac =null;
		
		if(command.equals("main")) ac = new MainAction();
		else if(command.equals("loginForm")) ac = new LoginFormAction();
		else if(command.equals("login")) ac = new LoginAction();
		else if(command.equals("logout")) ac = new LogoutAction();
		else if(command.equals("joinForm")) ac = new JoinFormAction();
		
		else if(command.equals("contestBoard")) ac = new ContestBoardAction();
		else if(command.equals("communityBoard")) ac = new CommunityBoardAction();
		
		// mypage
		else if(command.equals("mypage")) ac = new MypageAction();
		else if(command.equals("modify")) ac = new ModifyAction();
		
		//qna
		else if(command.equals("qnaList")) ac = new QnaListAction();
		else if(command.equals("qnaView")) ac = new QnaViewAction();
		else if(command.equals("writeQnaForm")) ac = new WriteQnaFormAction();
		else if(command.equals("writeQna")) ac = new WriteQnaAction();
		
		
		return ac;
	}


}
