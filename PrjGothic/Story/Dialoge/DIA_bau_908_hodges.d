
instance DIA_HODGES_KAP1_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap1_exit_condition;
	information = dia_hodges_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_hodges_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_HALLO(C_INFO)
{
	npc = bau_908_hodges;
	nr = 1;
	condition = dia_hodges_hallo_condition;
	information = dia_hodges_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hodges_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_hallo_info()
{
	AI_Output(other,self,"DIA_Hodges_HALLO_15_00");	//������, � ������� �����.
	AI_Output(self,other,"DIA_Hodges_HALLO_03_01");	//�� ����� ���� �����������, �� ������ � ���� ��� ���������� ������������� - � ��������� �������.
	AI_Output(other,self,"DIA_Hodges_HALLO_15_02");	//�� ������ �����, ��?
	AI_Output(self,other,"DIA_Hodges_HALLO_03_03");	//���� �� ������. ������ ������ ������� ������, ��� ���� ������� ���������� ���.
};


instance DIA_HODGES_TELLABOUTFARM(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_tellaboutfarm_condition;
	information = dia_hodges_tellaboutfarm_info;
	permanent = FALSE;
	description = "��� �� ������ ���������� ��� �� ���� �����?";
};


func int dia_hodges_tellaboutfarm_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_tellaboutfarm_info()
{
	AI_Output(other,self,"DIA_Hodges_TellAboutFarm_15_00");	//��� �� ������ ���������� ��� �� ���� �����?
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_01");	//��� ����� �����.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_02");	//��� ������� ������ - ��� ���. �� ��������� ���� ����� ��� ���������.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_03");	//� ���, ��������, �������� ������������ � �����.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_04");	//(���������) �� � ������ �� ������, ������ ����, ��� ���� ����, ��������� �������� �����.
	if(Npc_GetDistToWP(self,"NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_05");	//��� ��� ������ - �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_06");	//����� ������ ��������� �������.
	};
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_07");	//��������, ���� ������� � ����� ���������� ���� ���-������ ������.
};


instance DIA_HODGES_ABOUTSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_aboutsld_condition;
	information = dia_hodges_aboutsld_info;
	permanent = FALSE;
	description = "� ��� ������ ���������?";
};


func int dia_hodges_aboutsld_condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_aboutsld_info()
{
	AI_Output(other,self,"DIA_Hodges_AboutSld_15_00");	//� ��� ������ ���������?
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_01");	//���� ����� ��, ����� ��� �� ������� ���� ���������.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_02");	//�� ����� ��� �������� �����, ����� ���� � ����� ��������.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_03");	//��� ��� ���� �� ����� ������� ���-������ ��� �������� � ����� �������.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_04");	//��� ������ � ���� �����, ����� ������ ���� ������.
};


instance DIA_HODGES_TRADE(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_trade_condition;
	information = dia_hodges_trade_info;
	permanent = TRUE;
	description = "���� � ������ ������ � ����?";
	trade = TRUE;
};


func int dia_hodges_trade_condition()
{
	return TRUE;
};

func void dia_hodges_trade_info()
{
	AI_Output(other,self,"DIA_Hodges_TRADE_15_00");	//���� � ������ ������ � ����?
	AI_Output(self,other,"DIA_Hodges_TRADE_03_01");	//� ���� ���� ��� ����. �� ������� ����� ��� ���� � ������ � ��� �����.
	Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
};


instance DIA_HODGES_KAP2_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap2_exit_condition;
	information = dia_hodges_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_hodges_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP3_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap3_exit_condition;
	information = dia_hodges_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hodges_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_DONTWORK(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_dontwork_condition;
	information = dia_hodges_dontwork_info;
	permanent = FALSE;
	description = "������ �� �� ���������?";
};


func int dia_hodges_dontwork_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_dontwork_info()
{
	AI_Output(other,self,"DIA_Hodges_DontWork_15_00");	//������ �� �� ���������?
	AI_Output(self,other,"DIA_Hodges_DontWork_03_01");	//�� ��� ������ �� ������? �������� ���������� �������.
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"������ ������ ��������� ���������� � ������.");
};


instance DIA_HODGES_WHATHAPPENED(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_whathappened_condition;
	information = dia_hodges_whathappened_info;
	permanent = FALSE;
	description = "��� ���������?";
};


func int dia_hodges_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_whathappened_info()
{
	AI_Output(other,self,"DIA_Hodges_WhatHappened_15_00");	//��� ���������?
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_01");	//��, �� ���� � ������ �� ���������, ����� ���������� �������� ����. ���-�� ������: '��� ���, ������� ��!'
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_02");	//��, ��� � ���������! � �������� ������. � ����� ���, ��� ����� �� ���� ������� ������.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_03");	//������ ����� �� ����. � �� ����, ��� ���������, �� ����� � �������� �� ������, ��� �� ���� ��� �� ����.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_04");	//������ ����, �� ������ ���-�� � ������.
};


instance DIA_HODGES_BENNETSCRIME(C_INFO)
{
	npc = bau_908_hodges;
	nr = 32;
	condition = dia_hodges_bennetscrime_condition;
	information = dia_hodges_bennetscrime_info;
	permanent = FALSE;
	description = "��� ������ ������� ����������?";
};


func int dia_hodges_bennetscrime_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetscrime_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_00");	//��� ������ ������� ����������?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_01");	//��������! ������� ����������� � �������� ��������. ����� ����. � ��� � ��� ��� ��� �����.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_02");	//��� ������ �� �� ������� � ����� � �� ����������, ��� ��� ����?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_03");	//��� ������� ���� � ������ ��� ��� ���������. �����, ����� ������ ������, �������� ��������.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_04");	//��������?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_05");	//���������, ���� � ��� ��������� � �������... ��� ��� ����� ����� ���������.
	b_logentry(TOPIC_RESCUEBENNET,"�������, ��� ������ ���� ��������. ��� ������ ������ ����������, ��� ������ ���������, �� �� �� ������������ ������� � �����.");
};


instance DIA_HODGES_BENNETANDSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 33;
	condition = dia_hodges_bennetandsld_condition;
	information = dia_hodges_bennetandsld_info;
	permanent = FALSE;
	description = "� ��� ������������� �������� �� �����?";
};


func int dia_hodges_bennetandsld_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetandsld_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_00");	//� ��� ������������� �������� �� �����?
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_01");	//�����������, � �� ����, ��� ��� ���������, �� ������ �� ��� ������ � ������.
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_02");	//��� �������.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_03");	//���� �� � ��� ���� ����� ������, ��� �� ��������� ����� ��� �������, ����� ���������� �������.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_04");	//�������� � ��, ����� ����, �� ���-������ ������� ������.
};


instance DIA_HODGES_KAP4_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap4_exit_condition;
	information = dia_hodges_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hodges_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP5_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap5_exit_condition;
	information = dia_hodges_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hodges_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_PICKPOCKET(C_INFO)
{
	npc = bau_908_hodges;
	nr = 900;
	condition = dia_hodges_pickpocket_condition;
	information = dia_hodges_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_hodges_pickpocket_condition()
{
	return c_beklauen(15,10);
};

func void dia_hodges_pickpocket_info()
{
	Info_ClearChoices(dia_hodges_pickpocket);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_BACK,dia_hodges_pickpocket_back);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_PICKPOCKET,dia_hodges_pickpocket_doit);
};

func void dia_hodges_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hodges_pickpocket);
};

func void dia_hodges_pickpocket_back()
{
	Info_ClearChoices(dia_hodges_pickpocket);
};

