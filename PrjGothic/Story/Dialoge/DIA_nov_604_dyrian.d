
instance DIA_DYRIAN_EXIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 999;
	condition = dia_dyrian_exit_condition;
	information = dia_dyrian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dyrian_exit_condition()
{
	return TRUE;
};

func void dia_dyrian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_HELLO(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_hello_condition;
	information = dia_dyrian_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_hello_info()
{
	AI_Output(self,other,"DIA_Dyrian_Hello_13_00");	//(��������) ��� ���� �����?
};


instance DIA_DYRIAN_WURST(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_wurst_condition;
	information = dia_dyrian_wurst_info;
	permanent = FALSE;
	description = "� ��������� �������������� �������.";
};


func int dia_dyrian_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_dyrian_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Dyrian_Wurst_15_00");	//� ��������� �������������� �������.
	AI_Output(self,other,"DIA_Dyrian_Wurst_13_01");	//�������. �������, ��� �� ��������� �������, ��� � ������ �����.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
};


instance DIA_DYRIAN_JOB(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_job_condition;
	information = dia_dyrian_job_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_dyrian_job_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_hello) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_job_info()
{
	AI_Output(other,self,"DIA_Dyrian_Job_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Dyrian_Job_13_01");	//� ������. � ������� ������� ��������� � ���������.
	AI_Output(self,other,"DIA_Dyrian_Job_13_02");	//������ � ��� ������� ������� ������. �� ����, ������� �� ���� � ���������.
};


instance DIA_DYRIAN_WHATDONE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_whatdone_condition;
	information = dia_dyrian_whatdone_info;
	permanent = FALSE;
	description = "�������� ���, ��� ���������.";
};


func int dia_dyrian_whatdone_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_whatdone_info()
{
	AI_Output(other,self,"DIA_Dyrian_WhatDone_15_00");	//�������� ���, ��� ���������.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_01");	//� ���� ����� � ������� ������ �� �����, ����� �������� ���, ����� �������� �� �� ������.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_02");	//������ ������, ������� ��, ����� ������� ������� � ������� ���� �� ���� �����.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_03");	//�� ������ ���� ����������, � ������. � ����� �� ������ ���� � ���� �����, ����� � ����� ��� �����.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_04");	//�� ����� ���������� � ������� �� ���� ������� ������. ������ ��� ������, ���� �� � �������� � ���������.
};


instance DIA_DYRIAN_CANHELP(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_canhelp_condition;
	information = dia_dyrian_canhelp_info;
	permanent = TRUE;
	description = "� ���� ���� ���-������ ������?";
};


func int dia_dyrian_canhelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_canhelp_info()
{
	AI_Output(other,self,"DIA_Dyrian_CanHelp_15_00");	//� ���� ���� ���-������ ������?
	AI_Output(self,other,"DIA_Dyrian_CanHelp_13_01");	//���, ��� ������ ������� ������ ������ �� ������� ������ � �����.
};


instance DIA_DYRIAN_SCROLL(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_scroll_condition;
	information = dia_dyrian_scroll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_scroll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) || (MIS_RUNE == LOG_RUNNING) || (MIS_GOLEM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dyrian_scroll_info()
{
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_00");	//��, �� ������������� ���������� ��������� �����?
	AI_Output(other,self,"DIA_Dyrian_Scroll_15_01");	//��. � � ������� ������ ���.
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_02");	//������ - ��������, � ���� ������ ���� � ����. � ���� ���� ���� ������ � ����� ������� �����������. ����������� ���. ��, ���?
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"���, ��� �� ����� ���� ������.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"��� �� ������ �� ���?",dia_dyrian_scroll_how);
	Info_AddChoice(dia_dyrian_scroll,"� ��� ��� ������ � ���?",dia_dyrian_scroll_what);
};

func void dia_dyrian_scroll_what()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_00");	//� ��� ��� ������ � ���?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_01");	//��� ������ ����� ���������� �� ������ ��������� ����� � ���������� ��� �� �������� �����. �� ������ ���� �� ���� ������ �����.
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_02");	//��� ���� ���� ����� ��������, ���� ���-�� ����� � ���� �� ����...
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_03");	//� ��� � �����, ��� ���� �������?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_04");	//�� ����� ���� � �������� ���������� ��� ���������� �� �����. �� ����������� ����������� ��������� � ��� ���� �������.
};

func void dia_dyrian_scroll_no()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_No_15_00");	//���, ��� �� ����� ���� ������.
	AI_Output(self,other,"DIA_Dyrian_Scroll_No_13_01");	//�� ������ ���������� �� ��� � ����� �����, ���� �����������.
	Info_ClearChoices(dia_dyrian_scroll);
};

func void dia_dyrian_scroll_how()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_How_15_00");	//��� �� ������ �� ����?
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_01");	//� ������� ����� ������������ ���� ���� ����� �� ���� �������.
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_02");	//� ���� �� ������������� �������� ��������� �����, �� ������ ��������, ����� � ������� � ���������.
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"���, ��� �� ����� ���� ������.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"������, ����� ��� ���� ������.",dia_dyrian_scroll_yes);
};

func void dia_dyrian_scroll_yes()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_Yes_15_00");	//������, ����� ��� ���� ������.
	AI_Output(self,other,"DIA_Dyrian_Scroll_Yes_13_01");	//����� ���� � ���� ���������. �� ������� ���� �����.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_DYRIANDRIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DYRIANDRIN,LOG_RUNNING);
	b_logentry(TOPIC_DYRIANDRIN,"������ ��� ��� ������ � ����������� ���. ������, �� �����, ����� ���� � ����� �����, � �������� �� ���� �������� � �� ������� � ���������.");
	Info_ClearChoices(dia_dyrian_scroll);
};


instance DIA_DYRIAN_DOCH(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_doch_condition;
	information = dia_dyrian_doch_info;
	permanent = TRUE;
	description = "� ���������. ����� ��� ��� ���������� ���.";
};


func int dia_dyrian_doch_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_scroll) && (MIS_HELPDYRIAN != LOG_RUNNING) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_doch_info()
{
	AI_Output(other,self,"DIA_Dyrian_Doch_15_00");	//� ���������. ����� ��� ��� ���������� ���.
	AI_Output(self,other,"DIA_Dyrian_Doch_13_01");	//������, ���� �� �������� ���������, �� ��������� �� ���� ��������, � ���� ������� � ���������.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
};


instance DIA_DYRIAN_HELLOAGAIN(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_helloagain_condition;
	information = dia_dyrian_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_helloagain_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_KDF) && (MIS_HELPDYRIAN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_dyrian_helloagain_info()
{
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_00");	//(��������) �������! �� ���� ����!
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_01");	//(���������) �� - ����� �������� ����, ������. � �� ����� ���������� ����������.
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_02");	//(� ���������) � ��������� ���� �� ��, ��� ��� ��������� �������� � ���������. ��� ����� ������ �����������...
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};

func void b_dyrian_playerhowisit()
{
	AI_Output(other,self,"DIA_Dyrian_HowIsIt_15_00");	//��� ����?
};


instance DIA_DYRIAN_HOWISIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_howisit_condition;
	information = dia_dyrian_howisit_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_dyrian_howisit_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_helloagain))
	{
		return TRUE;
	};
};

func void dia_dyrian_howisit_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_01");	//������. ��� ����� �������� ��� ������, ������.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_OTHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_other_condition;
	information = dia_dyrian_other_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_dyrian_other_condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_dyrian_other_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_02");	//� ���������� ������ �� ��, ��� ���� ���� � ���������.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_KNEIPE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_kneipe_condition;
	information = dia_dyrian_kneipe_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_dyrian_kneipe_condition()
{
	if((MIS_HELPDYRIAN == LOG_FAILED) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_dyrian_kneipe_info()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_01");	//�� ��� �����������? � ��� �������� �� ����, � �� ������ ���� � ����.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_02");	//������ ��� ������ �� ��������, ����� ��� �������� ���� ���� �����. � � ���� ������� ��!
	Info_ClearChoices(dia_dyrian_kneipe);
	Info_AddChoice(dia_dyrian_kneipe,"���, ����� 5 �������.",dia_dyrian_kneipe_gold);
	Info_AddChoice(dia_dyrian_kneipe,"� ���� ��� ���������.",dia_dyrian_kneipe_canexplain);
	Info_AddChoice(dia_dyrian_kneipe,"����� �� ������ �������.",dia_dyrian_kneipe_shutup);
};

func void dia_dyrian_kneipe_gold()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_Gold_15_00");	//���, ����� 5 �������.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_01");	//(������) 5 �������? �� ����� ��� 5 ������� � �������� ����������� �� ��, ��� ����� ���� ������ ���� �����?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_02");	//� ������ ��� ���� ������!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,0);
};

func void dia_dyrian_kneipe_canexplain()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_CanExplain_15_00");	//� ���� ��� ���������.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_01");	//��� �� ����� ���� ����������.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_02");	//�� ����� ������ ���, ����� ���������� ���� ������� ���. � ������ ������ ����.
	AI_StopProcessInfos(self);
};

func void dia_dyrian_kneipe_shutup()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_ShutUp_15_00");	//����� �� ������ �������.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_01");	//��, �����, ������� ���! ��� ��� ����� ���� �� �������.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_02");	//� ���� ��������, ����� �� ���������� �������! ��� ������ �������� ��� �������...
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_03");	//� ������ �������� � ���� ����, �� ��� ��������!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_NACHHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_nachher_condition;
	information = dia_dyrian_nachher_info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int dia_dyrian_nachher_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_kneipe))
	{
		return TRUE;
	};
};

func void dia_dyrian_nachher_info()
{
	AI_Output(other,self,"DIA_Dyrian_nachher_15_00");	//��� � �����?
	AI_Output(self,other,"DIA_Dyrian_nachher_13_01");	//��, ������ ���� � �����! � ���� ����� ���� �� ����!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_PICKPOCKET(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 900;
	condition = dia_dyrian_pickpocket_condition;
	information = dia_dyrian_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_dyrian_pickpocket_condition()
{
	return c_beklauen(10,15);
};

func void dia_dyrian_pickpocket_info()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_BACK,dia_dyrian_pickpocket_back);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_PICKPOCKET,dia_dyrian_pickpocket_doit);
};

func void dia_dyrian_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dyrian_pickpocket);
};

func void dia_dyrian_pickpocket_back()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
};

