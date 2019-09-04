
instance DIA_DIEGONW_EXIT(C_INFO)
{
	npc = pc_thief_nw;
	nr = 999;
	condition = dia_diegonw_exit_condition;
	information = dia_diegonw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_diegonw_exit_condition()
{
	return TRUE;
};

func void dia_diegonw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DIEGONW_PERM(C_INFO)
{
	npc = pc_thief_nw;
	nr = 800;
	condition = dia_diegonw_perm_condition;
	information = dia_diegonw_perm_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_diegonw_perm_condition()
{
	if((Diego_IsOnBoard == FALSE) && (Kapitel > 3))
	{
		return TRUE;
	};
};

func void dia_diegonw_perm_info()
{
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//��� ����?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//�������. ������ ����� �� ������ ���, ��� ������� �� ��� ����� ��������� ���������?
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//������� �� ����. � ���� ���� ����� ������ �����.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//�� �� ����� ��� ��������� ��� �����. �� �� ���� ������ �� ���������� � �������� ���������.
};


instance DIA_DIEGONW_NEEDHELP(C_INFO)
{
	npc = pc_thief_nw;
	nr = 1;
	condition = dia_diegonw_needhelp_condition;
	information = dia_diegonw_needhelp_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_diegonw_needhelp_condition()
{
	if(DIEGO_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_diegonw_needhelp_info()
{
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//������, ��� �� �����. �� ������ ������ ���.
	Info_ClearChoices(dia_diegonw_needhelp);
	if(!Npc_KnowsInfo(other,DIA_DiegoOW_Hallo))
	{
		Info_AddChoice(DIA_DiegoNW_NeedHelp,"��� ��?",DIA_DiegoNW_NeedHelp_WhoAreYou);
	};
	Info_AddChoice(dia_diegonw_needhelp,"��� ��� �� ���� �� ������?",dia_diegonw_needhelp_clothes);
	Info_AddChoice(dia_diegonw_needhelp,"��� �� ������� �����?",dia_diegonw_needhelp_plan);
	Info_AddChoice(dia_diegonw_needhelp,"����� �����?",dia_diegonw_needhelp_problem);
};

func void dia_diegonw_needhelp_plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//�� ���� ������ ������. ��� ������ ������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//�� �����, ��� ��� ����� ����� ���������� �����.
};

func void dia_diegonw_needhelp_whoareyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//��� ��?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//����, ��� ���, ��������, ��-�� ������. � ������ ������ ��������� �� ������� �� ���� � �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//��� ������ � ����� ��� ������� � �������� �� �������. ������-��, �������, �� �������� ����? � �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//� ������ ������� � ���� ���� �����, ��� ���������� ��� ���������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//�� �� �� ��� ��� ��� ������ ��� ������.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//��... � ��� ������ ��������� ���?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//���� ������! �� ������������� ������ �� �������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//��������, � ���� ������������� ��� ������� ��������� ��� ���� ������. �������� ������ ����: �� ���� ��������� �������� ��������, � � �� ��� ������ ���� �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//� ������ ��� ����� ���� ������.
};

func void dia_diegonw_needhelp_clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//��� ��� �� ���� �� ������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//� ����� �� � �������� �� �������. ������ �� ������ ���������� ���� � �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//����� �� ����� ������ ��������, ������ � ������.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//��� ����� �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//� ���� ��� �����. �� ���� ���� � ���� ���� ������ �����, � ��� ����� ������� �������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//� � ���� ������� ����� ���������� ����� ������.
};

func void dia_diegonw_needhelp_problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//����� �����?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//����� ������ ������������ � ��� ���, ��� � ������� ���. ��� ���-�� ����� ����� ������ �� ����.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//� ��� ��������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//� ������ ������� � ������� �������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//�� � �� ��������� ����� ������, � � ���� ��� �����, ����� ��������� ������. ��� ����� ����� ��!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//�� ����, �� ������, ����� � ������� ���� ������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//����. � ���� ���� ������. � �� ������ ���� ����� ���� ������! ��, � ���������, ��� �� ��� ���.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//�� ������ ������� ��� ������ ���, ��� ��� ���������.
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"� ���� ��� ������� �� ���.",dia_diegonw_needhelp_problem_notime);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"��� ��� � ����� �����?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice(dia_diegonw_needhelp,"�����, � ������ ����.",dia_diegonw_needhelp_problem_willhelpyou);
};

func void dia_diegonw_needhelp_problem_notime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//� ���� ��� ������� �� ���.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//��, � ����� �� ������! ��� ���� �, �� �������, ������ ���� �������, ����� ���� ������� � �������.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//�� ���������������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//��?! � �� ��������� �� �������, ��� ����� �� ����, ���� �� � �� �������� ���� �����, ��� ����� ����� ���� � �������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//������ ������ ������� �� ���� �� �������, � �� �� ����� ������ ������� ���-������ � �����.
	MIS_HELPDIEGONW = LOG_FAILED;
	Info_ClearChoices(dia_diegonw_needhelp);
};

func void dia_diegonw_needhelp_problem_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//��� ��� � ����� �����?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//� �����-������ ��������� ����, ��� �� ��� ���� ������? �� �� ������, ����� ����� ������������?
};

func void dia_diegonw_needhelp_problem_willhelpyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//�����, � ������ ����.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01");	//���������. ������ �����������. ����� ������ ��� ��� �� �����, � ������� � ������ �������� ��������� ����.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02");	//��� ���� �������� �����, � ������� ����� � ������ ������, � ����� ��� �������.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03");	//� ������ ��� ����� ����� ��� ������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03");	//���� �������, �� ������ ����� � ������ �������� � ������� ��� ������.
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HELPDIEGONW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPDIEGONW,LOG_RUNNING);
	B_LogEntry(TOPIC_HelpDiegoNW,"������ ����� ��������� � ������ ��������. ��� ����� ���, ����� ������� � ������� ����� ������, � �� �������� ���� ����� ��� ������.");
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"��� �� ����������� ������ � ���� �������?",dia_diegonw_needhelp_problem_willhelpyou_yourplan);
	Info_AddChoice(dia_diegonw_needhelp,"������ � ���� ��� ������?",dia_diegonw_needhelp_problem_willhelpyou_howgold);
	Info_AddChoice(dia_diegonw_needhelp,"��� �������� ��� ������?",dia_diegonw_needhelp_problem_willhelpyou_wheregold);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"������ �� �� �������� ��� ���?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_Why);
};

func void dia_diegonw_needhelp_problem_willhelpyou_yourplan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//��� �� ����������� ������ � ���� �������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//� ���� ������ ����� � ����� �� ��������� � ������� ��������. � ����� ����� ����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//� ����� � ���� ����� ������ ����� �������!
};

func void dia_diegonw_needhelp_problem_willhelpyou_howgold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//������ � ���� ��� ������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//� ���, ������������ ��� ��, ��� ���������� ������ ��� ���� � ������ ��������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//������� ��������� ������ ������ ���� ����� �������. ������ �� ������, ���� ��� �����-������ ������� ��������� ������.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//��� ���� ��� ������������� �� ����, ��� �� ������ ����� �� ������� ��������...
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//��� �������� ��� ������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//����� �� �������� �������. ��� ����������� ������. ��� � ������� ��������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_02");	//� ��������� ����� � ������� ���, �� ���������� ����� ����� ����� ��������� ����� �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//�� �������, ����� ��� ��� ��� ����� �������, ����� �� ������ ���� ���������.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//��� � ������� ���?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//�� ����� ������. ������� �����!
	Info_AddChoice(dia_diegonw_needhelp,"� ��������� ����� ���� ������.",dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit);
	b_logentry(TOPIC_HELPDIEGONW,"������ ����� ��������� ���-�� �� ������ �������� �������, ���, ��� ������ �������������� � ������� �� �������� ������, ��� ����������� ������.");
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//� ��������� ����� ���� ������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//(����������) ������ ���. ����� ����� ���������� ��� ����.
	Info_ClearChoices(dia_diegonw_needhelp);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_Why()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_04");	//������ �� �� �������� ��� ���?
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_05");	//������ ��� ���, ��� ��� ��������, ��������� ����. �� ��� ������ ����� ��������� ��� ���� ������, ������ ���.
};


instance DIA_DIEGONW_HELPYOU(C_INFO)
{
	npc = pc_thief_nw;
	nr = 30;
	condition = dia_diegonw_helpyou_condition;
	information = dia_diegonw_helpyou_info;
	permanent = FALSE;
	description = "�����, � ��� �� ������ ����.";
};


func int dia_diegonw_helpyou_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (MIS_HELPDIEGONW == LOG_FAILED) && (DIEGO_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_helpyou_info()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//�����, � ��� �� ������ ����.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//� ���� ���.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//����� �������� ����� � ����.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//������. � ������� ������ � ������ ��������, � �� ������ ������� ��� ������ ��� ����.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_04");	//������ �� �� �������� ��� ���?
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_05");	//������ ��� ���, ��� ��� ��������, ��������� ����. �� ��� ������ ����� ��������� ��� ���� ������, ������ ���.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//� � ���� ����� ����� � ��� ���������� ��� ���������� ��������.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_Why();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"������ ����� ��������� � ������ ��������. ��� ����� ���, ����� ������� � ������� ����� ������, � �� �������� ���� ����� ��� ������.");
};


instance DIA_DIEGONW_HAVEYOURGOLD(C_INFO)
{
	npc = pc_thief_nw;
	nr = 31;
	condition = dia_diegonw_haveyourgold_condition;
	information = dia_diegonw_haveyourgold_info;
	permanent = TRUE;
	description = "� ����� ���� ������!";
};


func int dia_diegonw_haveyourgold_condition()
{
	if(((OpenedDiegosBag == TRUE) || Npc_HasItems(other,ItSe_DiegosTreasure_Mis)) && (MIS_HelpDiegoNW == LOG_Running) && (Diego_IsOnBoard != LOG_Success))
	{
		return TRUE;
	};
};

func void b_diegonw_diegosrevenge()
{
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//����� ������. ����� ��������� ������ ������ �� ������.
};


var int diegosrevenge;

func void dia_diegonw_haveyourgold_info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//� ����� ���� ������!
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//�������. ������.
	if(Npc_HasItems(other,ItSe_DiegosTreasure_Mis))
	{
		b_giveinvitems(other,self,itse_diegostreasure_mis,1);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	}
	else if(Npc_HasItems(other,itmi_gold) < DIEGOSTREASURE)
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//�� ����� �� ���! �� ���, �� ��������� ���? ��� ����� ��� �����.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//���� ��� ���� ���������, ������ ��������� ���������� � ��� ����.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//��� ���, ����������, ������� ��� �����. ��� ����� �����!
	}
	else
	{
		b_giveinvitems(other,self,itmi_gold,DIEGOSTREASURE);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	};
	if(!Npc_IsDead(Gerbrandt) && (DiegosRevenge == TRUE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//��������, � ��� ��� �� ����������� �� �������.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//� ����, ����� �� ����� ��� ������ ����������. ��� ���� �� ��������� � ������� ��������.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//������� ��� ������ �� ����. � ����� ���������� ����� ����� ����������.
		CreateInvItems(self,itwr_diegosletter_mis,1);
		b_giveinvitems(self,other,itwr_diegosletter_mis,1);
		b_startotherroutine(gerbrandt,"WaitForDiego");
		MIS_HELPDIEGONW = LOG_SUCCESS;
		MIS_DIEGOSRESIDENCE = LOG_RUNNING;
		b_giveplayerxp(XP_HELPDIEGONW);
		Log_CreateTopic(TOPIC_DIEGOSRESIDENCE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DIEGOSRESIDENCE,LOG_RUNNING);
		b_logentry(TOPIC_DIEGOSRESIDENCE,"����� ��� ��� ������ ��� �������� ����������.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_DIEGONW_DELIVEREDLETTER(C_INFO)
{
	npc = pc_thief_nw;
	nr = 30;
	condition = dia_diegonw_deliveredletter_condition;
	information = dia_diegonw_deliveredletter_info;
	permanent = FALSE;
	description = "� �������� ���� ������.";
};


func int dia_diegonw_deliveredletter_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (MIS_DIEGOSRESIDENCE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_deliveredletter_info()
{
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//� �������� ���� ������.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//����� ������. ��� ��������� ��������� ���?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//�� ��� � ���� � ����������� ����� ����-��.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//(��������������) � ��� � �����.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//�����, ������, ��� � ������ ������� ��� �������� �������� ����������� ����� ������ ����. ���� � ��������� �����, ���� � ���������� ������ �������.
	b_giveplayerxp(XP_DIEGOHASANEWHOME);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	B_StartOtherRoutine(Gerbrandt,"NEWLIFE");
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,"��� ���� ������� ���������� ���?",dia_diegonw_deliveredletter_yourtrick);
	Info_AddChoice(dia_diegonw_deliveredletter,"������, ��� ������ ���� ���?",dia_diegonw_deliveredletter_yourhouse);
};

func void dia_diegonw_deliveredletter_gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//��� ������ ����������?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//�� ����������� ����������� ������ ������� �����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//�� ��� �����, ������� � �������, ����� � ������� ��������� �� ������ �����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//������� �� ����, ���� �� ������ ������, �� �� ������ �� ��������� ��������� � �������� ����� - � ���������� �� ����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//���� �� ����� ���, �������� �������� � �������� ��������.
};

func void dia_diegonw_deliveredletter_yourhouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//������, ��� ������ ���� ���?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//��, �� ������� �� �������! �� ���� �������!
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//� ������� ��� ������ � ����������� �������� � ������ ������ � ���, ��� � ���� ����� � �������� ������� � ����������.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//� �����, �� �������, � ���� ���� ������������ ������ � �������� ��� ������� �����.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//��, �� ������ �� ��������.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//�����.
};

func void dia_diegonw_deliveredletter_yourtrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//��� ���� ������� ���������� ���?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//�� �������, ��������� ��������� ���� ��������� �� ������� �������?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//�������, �� ������� �� ����� ����, ����� �������� �� ������� ���. � ���� ��� ����� ��� ��������.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//� �� ���� ������� ����� ����� ���� ����. ���������, � ����� ������, ����� ���������� �� ����. ��������, �� ��������, ��� � ���� ������� �����.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//�� ������� �� ������� ��� �� ����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//� �� ������� � �� ���������.
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,DIALOG_BACK,dia_diegonw_deliveredletter_yourtrick_back);
	Info_AddChoice(dia_diegonw_deliveredletter,"��� ������ ���� ����?",dia_diegonw_deliveredletter_yourtrick_reward);
	Info_AddChoice(dia_diegonw_deliveredletter,"��� ������ ����������?",dia_diegonw_deliveredletter_gerbrandt);
};

func void dia_diegonw_deliveredletter_yourtrick_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//��� ������ ���� ����?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//������, �� ������ �� ����� �� ����, ���� � ���� ����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//�� �� ����, � ���� ������ �� �� ����� ��� ����� ������. ��� ���� ����.
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
};

func void dia_diegonw_deliveredletter_yourtrick_back()
{
	Info_ClearChoices(dia_diegonw_deliveredletter);
};


var int diego_teach;

instance DIA_DIEGONW_CANYOUTEACH(C_INFO)
{
	npc = pc_thief_nw;
	nr = 888;
	condition = dia_diegonw_canyouteach_condition;
	information = dia_diegonw_canyouteach_info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_diegonw_canyouteach_condition()
{
	if(Diego_Teach == FALSE)
	{
		return TRUE;
	};
};

func void dia_diegonw_canyouteach_info()
{
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//�� ������ ������� ���� ����-������?
	if(Npc_KnowsInfo(other,dia_diegonw_deliveredletter))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//��, �������. ��� ��� �����, ����� ������ �����.
		DIEGO_TEACH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOW_Teach_11_01");	//������ �� ����� ��� �����. � ���� ���� ���� ��������.
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//������� ��� ����� ������ ���� ��������.
	};
};


var int diegonw_merke_dex;
var int DiegoNW_Merke_STR;

instance DIA_DIEGONW_TEACH(C_INFO)
{
	npc = pc_thief_nw;
	nr = 888;
	condition = dia_diegonw_teach_condition;
	information = dia_diegonw_teach_info;
	permanent = TRUE;
	description = "����� ����.";
};


func int dia_diegonw_teach_condition()
{
	if(Diego_Teach == TRUE)
	{
		return TRUE;
	};
};

func void dia_diegonw_teach_info()
{
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//����� ����.
	AI_Output(self,other,"DIA_DiegoNW_Teach_11_01");	//� ���� ������� ����, ��� ����� ����� ������.
	AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_01");	//�������. ��� �� ������ �����?
	DIEGONW_MERKE_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};

func void dia_diegonw_teach_back()
{
	if(DIEGONW_MERKE_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//�� ��� ���� ����� ������. ��� �������!
	};
	Info_ClearChoices(dia_diegonw_teach);
};

func void dia_diegonw_teachdex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,100);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};

func void dia_diegonw_teachdex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,100);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};


instance DIA_DIEGONW_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_knowwhereenemy_condition;
	information = dia_diegonw_knowwhereenemy_info;
	permanent = TRUE;
	description = "� ��������� �������� �������.";
};


func int dia_diegonw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (DIEGO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};


var int SCToldDiegoHeKnowWhereEnemy;

func void dia_diegonw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//� ��������� �������� �������.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//������ �������. � ��� �� �� ����� ����������� � �����. ���� ����� ��������� ������� ������ - �������, ����� ����� ����� ���� �����������, ��� � �������.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//� ��� �� ������� ���� ����� ��������, ������������ ��������� � ��� �� �������� ���� ��������.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//�����, � ������, ���� �� �������� ������� ���.
	if(SCToldDiegoHeKnowWhereEnemy == FALSE)
	{
		Log_CreateTopic(Topic_Crew,LOG_MISSION);
		Log_SetTopicStatus(Topic_Crew,LOG_Running);
		B_LogEntry(Topic_Crew,"������� ��, ����� ����� ����� �� ����. ��� �������, ��� ��� ������ �� ������� �������, ��� �����. �� ��� �� ������� ����, ��� ����� ����� ������ � ������� �� ���� ��������� �������. ����� �� ����� ������� ���� ������������ ���������.");
		SCToldDiegoHeKnowWhereEnemy = TRUE;
	};
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//� ������� ��� ����. �� ���� ��� ������� ��������� ��������������.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//�� ��������. � ��� ����� ������ �� ������.
	}
	else
	{
		Info_ClearChoices(dia_diegonw_knowwhereenemy);
		Info_AddChoice(dia_diegonw_knowwhereenemy,"��������, � ��� ���� �����, ����� ������ �����.",dia_diegonw_knowwhereenemy_no);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"������ �� ���� �� ����������� � ���� �� ����? ���������� � ������.",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

func void dia_diegonw_knowwhereenemy_yes()
{
	var C_Item DiegoArmor;
	DiegoArmor = Npc_GetEquippedArmor(self);
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//������ �� ���� �� ����������� � ���� �� ����? ���������� � ������.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//���. �� ����, � �������� ��� ����� ������ ������. � ������� � �����.
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") && !Hlp_IsItem(DiegoArmor,ITAR_Diego))
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//�������, � ���� ����� ����� ������.
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		if(!Npc_HasItems(self,ITAR_Diego))
		{
			CreateInvItems(self,ITAR_Diego,1);
		};
		AI_EquipArmor(self,itar_diego);
		AI_Wait(self,1);
		AI_GotoWP(self,"NW_CITY_UPTOWN_PATH_23");
	};
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//��, � �����. ���������� � �������.
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_diegonw_knowwhereenemy);
};

func void dia_diegonw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//��������, � ��� ���� �����, ����� ������ �����.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//��������. �, ��������, � ���� ������������ � ����. ��� �����?
	DIEGO_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_diegonw_knowwhereenemy);
};


instance DIA_DIEGONW_LEAVEMYSHIP(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_leavemyship_condition;
	information = dia_diegonw_leavemyship_info;
	permanent = TRUE;
	description = "�� ������ ���������� � ������.";
};


func int dia_diegonw_leavemyship_condition()
{
	if((DIEGO_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_leavemyship_info()
{
	var C_Item DiegoArmor;
	DiegoArmor = Npc_GetEquippedArmor(self);
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//�� ������ ���������� � ������.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//��? � ���� ������ �� �����? ��, �����. �� ������ ��������� �� ���, ����� ��������� � �����.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//�� �������, �� ��� ����������?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//� ������� �� ������ ��������� ������ ����, ����� �� ����� �� ����� ����� ����, ��� ������ ������� ����. ����� �� ����������� � ������ ���.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//�� ������� �� ������� ����. �� ����������� ���������� �����. ������ ����.
	if(!Npc_HasItems(self,ITAR_Vlk_H))
	{
		CreateInvItems(self,ITAR_Vlk_H,1);
	};
	if(!Hlp_IsItem(DiegoArmor,ITAR_Vlk_H))
	{
		AI_EquipArmor(self,ITAR_Vlk_H);
	};
	DIEGO_ISONBOARD = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	if(MIS_DiegosResidence == LOG_Success)
	{
		Npc_ExchangeRoutine(self,"Gerbrandt");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_DIEGONW_STILLNEEDYOU(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_stillneedyou_condition;
	information = dia_diegonw_stillneedyou_info;
	permanent = TRUE;
	description = "�����������. � ����, ����� �� ����������� ����.";
};


func int dia_diegonw_stillneedyou_condition()
{
	if(((DIEGO_ISONBOARD == LOG_OBSOLETE) || (DIEGO_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_diegonw_stillneedyou_info()
{
	var C_Item DiegoArmor;
	DiegoArmor = Npc_GetEquippedArmor(self);
	AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//�����������. � ����, ����� �� ����������� ����.
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//���� ���������� ���� �������������, ����? �������, � ������������ � ���� - �� ������ ���������� � ���, ��� ���� �����.
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") && !Hlp_IsItem(DiegoArmor,ITAR_Diego))
	{
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_02");	//�������, � ���� ����� ����� ������.
		AI_SetWalkMode(self,NPC_RUN);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		if(!Npc_HasItems(self,ITAR_Diego))
		{
			CreateInvItems(self,ITAR_Diego,1);
		};
		AI_EquipArmor(self,itar_diego);
		AI_Wait(self,1);
		AI_GotoWP(self,"NW_CITY_UPTOWN_PATH_23");
	};
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//�������, �� ����� ����.
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	B_CheckLog();
};


instance DIA_THIEF_NW_PICKPOCKET(C_INFO)
{
	npc = pc_thief_nw;
	nr = 900;
	condition = dia_thief_nw_pickpocket_condition;
	information = dia_thief_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thief_nw_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thief_nw_pickpocket_info()
{
	Info_ClearChoices(dia_thief_nw_pickpocket);
	Info_AddChoice(dia_thief_nw_pickpocket,DIALOG_BACK,dia_thief_nw_pickpocket_back);
	Info_AddChoice(dia_thief_nw_pickpocket,DIALOG_PICKPOCKET,dia_thief_nw_pickpocket_doit);
};

func void dia_thief_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thief_nw_pickpocket);
};

func void dia_thief_nw_pickpocket_back()
{
	Info_ClearChoices(dia_thief_nw_pickpocket);
};

