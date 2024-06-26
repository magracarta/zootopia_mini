package zootopia_mini.zootopia.controller;


import zootopia_mini.zootopia.controller.action.Action;

import zootopia_mini.zootopia.controller.action.admin.AdminAction;
import zootopia_mini.zootopia.controller.action.admin.AdminCommunityDeleteAction;
import zootopia_mini.zootopia.controller.action.admin.AdminCommunityDetailAction;
import zootopia_mini.zootopia.controller.action.admin.AdminCommunityListAction;
import zootopia_mini.zootopia.controller.action.admin.AdminCommunityReplyDeleteAction;
import zootopia_mini.zootopia.controller.action.admin.AdminCommunityUpdateAction;
import zootopia_mini.zootopia.controller.action.admin.AdminCommunityUpdateFormAction;
import zootopia_mini.zootopia.controller.action.admin.AdminContestDetialAction;
import zootopia_mini.zootopia.controller.action.admin.AdminContestFunctionAction;
import zootopia_mini.zootopia.controller.action.admin.AdminContestUpdateFormAllAction;
import zootopia_mini.zootopia.controller.action.admin.AdminLoginAction;
import zootopia_mini.zootopia.controller.action.admin.AdminLogout;
import zootopia_mini.zootopia.controller.action.admin.AdminMainAction;
import zootopia_mini.zootopia.controller.action.admin.AdminMemberDeleteAction;
import zootopia_mini.zootopia.controller.action.admin.AdminMemberDetailAction;
import zootopia_mini.zootopia.controller.action.admin.AdminMemberInsertAction;
import zootopia_mini.zootopia.controller.action.admin.AdminMemberInsertFormAction;
import zootopia_mini.zootopia.controller.action.admin.AdminMemberListAction;
import zootopia_mini.zootopia.controller.action.admin.AdminMemberUpdateAction;
import zootopia_mini.zootopia.controller.action.admin.AdminQnaDeleteAction;
import zootopia_mini.zootopia.controller.action.admin.AdminQnaDetailAction;
import zootopia_mini.zootopia.controller.action.admin.AdminQnaListAction;
import zootopia_mini.zootopia.controller.action.admin.AdminQnaReplyUpdateAction;
import zootopia_mini.zootopia.controller.action.admin.AdmincontestlistAction;
import zootopia_mini.zootopia.controller.action.community.CommunityBoardAction;
import zootopia_mini.zootopia.controller.action.community.CommunityDeleteAction;
import zootopia_mini.zootopia.controller.action.community.CommunityDetailAction;
import zootopia_mini.zootopia.controller.action.community.CommunityRecommandsAction;
import zootopia_mini.zootopia.controller.action.community.CommunityUpdateAction;
import zootopia_mini.zootopia.controller.action.community.CommunityUpdateFormAction;
import zootopia_mini.zootopia.controller.action.community.CommunityViewCountAction;
import zootopia_mini.zootopia.controller.action.community.FindCommunityAction;
import zootopia_mini.zootopia.controller.action.community.WriteCommunityAction;
import zootopia_mini.zootopia.controller.action.community.WriteCommunityFormAction;
import zootopia_mini.zootopia.controller.action.communityreply.DeleteCommunityReplyAction;
import zootopia_mini.zootopia.controller.action.communityreply.UpdateCommunityReplyAction;
import zootopia_mini.zootopia.controller.action.communityreply.ViewCommunityReplyAction;
import zootopia_mini.zootopia.controller.action.communityreply.WriteCommunityReplyAction;
import zootopia_mini.zootopia.controller.action.contest.AddReplyAction;
import zootopia_mini.zootopia.controller.action.contest.ContestBoardAction;
import zootopia_mini.zootopia.controller.action.contest.ContestDeleteAction;
import zootopia_mini.zootopia.controller.action.contest.ContestDetailAction;
import zootopia_mini.zootopia.controller.action.contest.ContestFormAction;
import zootopia_mini.zootopia.controller.action.contest.ContestReplyDeleteAction;
import zootopia_mini.zootopia.controller.action.contest.ContestUpdateFormAction;
import zootopia_mini.zootopia.controller.action.contest.ContestUpdateReplyAction;
import zootopia_mini.zootopia.controller.action.contest.ContestcountAction;
import zootopia_mini.zootopia.controller.action.contest.ContestcreateAction;
import zootopia_mini.zootopia.controller.action.contest.ContestpetDeleteAction;
import zootopia_mini.zootopia.controller.action.contest.ContestupdateAction;
import zootopia_mini.zootopia.controller.action.contest.InsertContestPetAction;
import zootopia_mini.zootopia.controller.action.contest.ReccomnadPetAction;
import zootopia_mini.zootopia.controller.action.contest.TestProcedureAction;
import zootopia_mini.zootopia.controller.action.contest.UpdateContestPetAction;
import zootopia_mini.zootopia.controller.action.contest.AddReplyAction;
import zootopia_mini.zootopia.controller.action.contest.AdminContestPetandReplyremoveDeleteAllAction;
import zootopia_mini.zootopia.controller.action.contest.AdminContestupdateAllAction;
import zootopia_mini.zootopia.controller.action.main.MainAction;
import zootopia_mini.zootopia.controller.action.member.IdCheckFormAction;
import zootopia_mini.zootopia.controller.action.member.JoinAction;
import zootopia_mini.zootopia.controller.action.member.JoinFormAction;
import zootopia_mini.zootopia.controller.action.member.LoginAction;
import zootopia_mini.zootopia.controller.action.member.LoginFormAction;
import zootopia_mini.zootopia.controller.action.member.LogoutAction;
import zootopia_mini.zootopia.controller.action.member.NicknameCheckFormAction;
import zootopia_mini.zootopia.controller.action.mypage.DeleteMemberAction;
import zootopia_mini.zootopia.controller.action.mypage.ModifyAction;
import zootopia_mini.zootopia.controller.action.mypage.ModifyFormAction;
import zootopia_mini.zootopia.controller.action.mypage.MyReplyAction;
import zootopia_mini.zootopia.controller.action.mypage.MycontestAction;
import zootopia_mini.zootopia.controller.action.mypage.MypageAction;
import zootopia_mini.zootopia.controller.action.mypage.MyqnaAction;
import zootopia_mini.zootopia.controller.action.mypage.MywriteAction;
import zootopia_mini.zootopia.controller.action.qna.QnaDeleteAction;
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
		
		//member
		else if(command.equals("loginform")) ac = new LoginFormAction();
		else if(command.equals("login")) ac = new LoginAction();
		else if(command.equals("logout")) ac = new LogoutAction();
		else if(command.equals("joinform")) ac = new JoinFormAction();
		else if(command.equals("join")) ac = new JoinAction();
		else if(command.equals("idcheckform")) ac = new IdCheckFormAction();
		else if(command.equals("nicknamecheckform")) ac = new NicknameCheckFormAction();
		else if(command.equals("deletemember")) ac = new DeleteMemberAction();
		
		//community
		else if(command.equals("communityBoard")) ac = new CommunityBoardAction();
		else if(command.equals("communityDetail")) ac = new CommunityDetailAction();
		else if( command.equals("writeCommunityForm") ) ac = new WriteCommunityFormAction();
		else if( command.equals("writeCommunity") ) ac = new WriteCommunityAction();
		else if( command.equals("communityUpdateForm") ) ac = new CommunityUpdateFormAction();
		else if( command.equals("communityUpdate") ) ac = new CommunityUpdateAction();
		else if( command.equals("communityDelete") ) ac = new CommunityDeleteAction();
		else if( command.equals("communityRecommands") ) ac = new CommunityRecommandsAction();
		else if( command.equals("communityViewCount") ) ac = new CommunityViewCountAction();
		else if( command.equals("findCommunity") ) ac = new FindCommunityAction();

		//community_reply
		else if( command.equals("writeCommunityReply") ) ac = new WriteCommunityReplyAction();
		else if( command.equals("viewCommunityReply") ) ac = new ViewCommunityReplyAction();
		else if( command.equals("deleteCommunityReply") ) ac = new DeleteCommunityReplyAction();
		else if( command.equals("updateCommunityReply") ) ac = new UpdateCommunityReplyAction();
		
		
		
		//mypage
		else if(command.equals("mypage")) ac = new MypageAction();
		else if(command.equals("modify")) ac = new ModifyAction();
		else if(command.equals("modifyform")) ac = new ModifyFormAction();
		else if(command.equals("mycontest")) ac = new MycontestAction();
		else if(command.equals("mywrite")) ac = new MywriteAction();
		else if(command.equals("myreply")) ac = new MyReplyAction();
		else if(command.equals("myqna")) ac = new MyqnaAction();
		

		//contest
		else if(command.equals("contestBoard")) ac = new ContestBoardAction();
		else if(command.equals("contestForm")) ac = new ContestFormAction();
		else if(command.equals("contestcreateAction")) ac = new ContestcreateAction();
		else if(command.equals("contestcount")) ac = new ContestcountAction();
		else if(command.equals("contestDetail")) ac = new ContestDetailAction();
		else if(command.equals("contestUpdateForm")) ac = new ContestUpdateFormAction();
		else if(command.equals("contestupdate")) ac = new ContestupdateAction();
		else if(command.equals("contestDelete")) ac = new ContestDeleteAction();
		else if(command.equals("insertContestPet")) ac = new InsertContestPetAction();
		else if(command.equals("reccomnadPet")) ac = new ReccomnadPetAction();
		else if(command.equals("updateContestPet")) ac = new UpdateContestPetAction();
		else if(command.equals("contestpetDelete")) ac = new ContestpetDeleteAction();
		else if(command.equals("addReply")) ac = new AddReplyAction();
		else if(command.equals("contestUpdateReply")) ac = new ContestUpdateReplyAction();
		else if(command.equals("contestReplyDelete")) ac = new ContestReplyDeleteAction();
		else if(command.equals("testProcedure")) ac = new TestProcedureAction();
		
		//qna
		else if(command.equals("qnaList")) ac = new QnaListAction();
		else if(command.equals("qnaView")) ac = new QnaViewAction();
		else if(command.equals("writeQnaForm")) ac = new WriteQnaFormAction();
		else if(command.equals("writeQna")) ac = new WriteQnaAction();
		else if( command.equals("deleteqna") ) ac = new QnaDeleteAction();
		
		//admin
		else if(command.equals("admin")) ac = new AdminAction();
		else if(command.equals("adminlogin")) ac = new AdminLoginAction();
		else if(command.equals("adminmain")) ac = new AdminMainAction();
		else if(command.equals("adminlogout")) ac = new AdminLogout();
		else if(command.equals("adminmemberlist")) ac = new AdminMemberListAction();
		else if(command.equals("adminmemberdetail")) ac = new AdminMemberDetailAction();
		else if(command.equals("adminmemberinsertform")) ac = new AdminMemberInsertFormAction();
		else if(command.equals("adminmemberinsert")) ac = new AdminMemberInsertAction();
		else if(command.equals("adminmemberupdate")) ac = new AdminMemberUpdateAction();
		else if(command.equals("adminmemberdelete")) ac = new AdminMemberDeleteAction();
		else if(command.equals("admincommunitylist")) ac = new AdminCommunityListAction();
		else if(command.equals("admincommunitydetail")) ac = new AdminCommunityDetailAction();
		else if(command.equals("admincommunityupdateform")) ac = new AdminCommunityUpdateFormAction();
		else if(command.equals("admincommunityupdate")) ac = new AdminCommunityUpdateAction();
		else if(command.equals("admincommunitydelete")) ac = new AdminCommunityDeleteAction();
		else if(command.equals("adminqnalist")) ac = new AdminQnaListAction();
		else if(command.equals("adminqnadetail")) ac = new AdminQnaDetailAction();
		else if(command.equals("adminqnareplyupdate")) ac = new AdminQnaReplyUpdateAction();
		else if(command.equals("adminqnadelete")) ac = new AdminQnaDeleteAction();
		else if(command.equals("admincommunityreplydelete")) ac = new AdminCommunityReplyDeleteAction();
		
		
		//admincontest
		else if(command.equals("admincontestlist")) ac = new AdmincontestlistAction();
		//콘테스트 삭제, 대기, 거절 , 수락 컨트롤
		else if(command.equals("functionAction")) ac = new AdminContestFunctionAction();
		else if(command.equals("adminContestDetial")) ac = new AdminContestDetialAction();
		else if(command.equals("adminContestPetandReplyremoveDeleteAll")) ac = new AdminContestPetandReplyremoveDeleteAllAction();
		else if(command.equals("adminContestUpdateForm")) ac = new AdminContestUpdateFormAllAction();
		else if(command.equals("adminContestupdate")) ac = new AdminContestupdateAllAction();
		 		
		return ac;
	}


}
