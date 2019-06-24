
instance DIA_NONE_101_MARIO_EXIT(C_INFO)
{
	npc = none_101_mario;
	nr = 999;
	condition = dia_none_101_mario_exit_condition;
	information = dia_none_101_mario_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_none_101_mario_exit_condition()
{
	return TRUE;
};

func void dia_none_101_mario_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_101_MARIO_JOB(C_INFO)
{
	npc = none_101_mario;
	nr = 4;
	condition = dia_none_101_mario_job_condition;
	information = dia_none_101_mario_job_info;
	permanent = TRUE;
	description = "��� �� ������� �����?";
};


func int dia_none_101_mario_job_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE) && (Npc_KnowsInfo(other,dia_none_101_mario_youneedme) == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_job_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Job_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//�������, ����� ������ �����-������ �������, � � ������� �� ����.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//��� ������� ��� ���� ��� ��������� ��� �� �����.
};


instance DIA_NONE_101_MARIO_YOUNEEDME(C_INFO)
{
	npc = none_101_mario;
	nr = 4;
	condition = dia_none_101_mario_youneedme_condition;
	information = dia_none_101_mario_youneedme_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_none_101_mario_youneedme_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_youneedme_info()
{
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//� ������, ��� �� ��������� ������� �� ���� �������?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//�?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//� �����!
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"����� ������ �����, ��������� �� ���� � �������� �������. �� ����� ����� �� �������.");
};


instance DIA_NONE_101_MARIO_WHYNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 5;
	condition = dia_none_101_mario_whyneedyou_condition;
	information = dia_none_101_mario_whyneedyou_info;
	permanent = FALSE;
	description = "������ � ������ ����� ����?";
};


func int dia_none_101_mario_whyneedyou_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_whyneedyou_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//������ � ������ ����� ����?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//��� ������. ������ ��� � ����� ����.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//�... � ��� ����������� � ����������� �����.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//� ������ ������� �� '������ ������' � '�������� �������'.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//� ����� � ���������� ���������� � ��������������� �������� ���� �������� ����� ����� � ������� �������.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//� ���������, ��� �������� ������� ����, ����� ��� ������� ������� � ��� �������� ���������.
};


instance DIA_NONE_101_MARIO_WHYHERE(C_INFO)
{
	npc = none_101_mario;
	nr = 7;
	condition = dia_none_101_mario_whyhere_condition;
	information = dia_none_101_mario_whyhere_info;
	permanent = FALSE;
	description = "� ��� �� ������� �����?";
};


func int dia_none_101_mario_whyhere_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_whyneedyou) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_whyhere_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//� ��� �� ������� �����?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//����� �������� ������, � �� �������� ���������.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//����� ����� �������� �� ����� � ������� � ���� ����, � ��� ������ ��� ����� �����.
};


instance DIA_NONE_101_MARIO_ABILITIES(C_INFO)
{
	npc = none_101_mario;
	nr = 8;
	condition = dia_none_101_mario_abilities_condition;
	information = dia_none_101_mario_abilities_info;
	permanent = FALSE;
	description = "��� �� ������ ������?";
};


func int dia_none_101_mario_abilities_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_whyneedyou) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_abilities_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//��� �� ������ ������?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//� ������ �������� � �������� ���, � ���� �� � ����� ������� �� ����������� �����.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//� ������, ��� � ����� ������� ���� ����-������ �� ����� �����������.
	b_logentry(TOPIC_CREW,"�����, ������, ������ ���� � ���, ��� ��������  ������� ����. ��������, �� ������ ������� ���� ���-����.");
};


instance DIA_NONE_101_MARIO_YOURPRICE(C_INFO)
{
	npc = none_101_mario;
	nr = 9;
	condition = dia_none_101_mario_yourprice_condition;
	information = dia_none_101_mario_yourprice_info;
	permanent = FALSE;
	description = "��� �� �� ��� ������?";
};


func int dia_none_101_mario_yourprice_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_yourprice_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//��� �� �� ��� ������?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//��� � ����? �� � ���� ��� ������ �������� ������.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//� ������ ����, � �� �������� ��� ��������� �� ���� ����.
};


instance DIA_NONE_101_MARIO_COULDBEDANGEROUS(C_INFO)
{
	npc = none_101_mario;
	nr = 10;
	condition = dia_none_101_mario_couldbedangerous_condition;
	information = dia_none_101_mario_couldbedangerous_info;
	permanent = FALSE;
	description = "����������� ����� ���� �������.";
};


func int dia_none_101_mario_couldbedangerous_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_yourprice) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_couldbedangerous_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//����������� ����� ���� �������.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//� ������ � ���������. ����� �� ����� �� ����, ������ ���� ��� ���� ����� ����������.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//����� ����� ����� ����� ��� ���� ���������, � ������� � ������ ����� ���������� ���� ������� �������.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//�� ������ ��� � ������� �����. ������ ���, � ������ �� �����. ������, ������� ������, ������� �� ������.
};


instance DIA_NONE_101_MARIO_DONTNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 13;
	condition = dia_none_101_mario_dontneedyou_condition;
	information = dia_none_101_mario_dontneedyou_info;
	permanent = FALSE;
	description = "�� �� ����� ���.";
};


func int dia_none_101_mario_dontneedyou_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_dontneedyou_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//�� �� ����� ���.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//� ������ ������, �������� ����� ����� �����.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//��� �������, �� �� �����-�� ������������ � ���������.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//��� ��� ������ �������, ������ ��� ���������� ����-������.
};


instance DIA_NONE_101_MARIO_NEEDGOODMEN(C_INFO)
{
	npc = none_101_mario;
	nr = 2;
	condition = dia_none_101_mario_needgoodmen_condition;
	information = dia_none_101_mario_needgoodmen_info;
	permanent = FALSE;
	description = "� ������ ����� ����� ��� ������� �����.";
};


func int dia_none_101_mario_needgoodmen_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_needgoodmen_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//� ������ ����� ����� ��� ������� �����.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//�������, �������� �� �������.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	MARIO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_MARIO_LEAVEMYSHIP(C_INFO)
{
	npc = none_101_mario;
	nr = 11;
	condition = dia_mario_leavemyship_condition;
	information = dia_mario_leavemyship_info;
	permanent = TRUE;
	description = "� ���-���� �� ���� ����� ���� � �����!";
};


func int dia_mario_leavemyship_condition()
{
	if((MARIO_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_mario_leavemyship_info()
{
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//� �����, ��� �� ��� �� �����!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//��� �������. �� ������, ��� ������ ����!
	MARIO_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MARIO_STILLNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 11;
	condition = dia_mario_stillneedyou_condition;
	information = dia_mario_stillneedyou_info;
	permanent = TRUE;
	description = "�� ��� ���-���� �����!";
};


func int dia_mario_stillneedyou_condition()
{
	if(((MARIO_ISONBOARD == LOG_OBSOLETE) || (MARIO_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_mario_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//�� ��� ���-���� �����!
	if(MARIO_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//� ����! �������� �� �������!
		MARIO_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		AI_StopProcessInfos(self);
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//�� �� ������ ��� ���������� �� ����. ������� � �� ���� �����!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_MARIO_PICKPOCKET(C_INFO)
{
	npc = none_101_mario;
	nr = 900;
	condition = dia_mario_pickpocket_condition;
	information = dia_mario_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_mario_pickpocket_condition()
{
	return c_beklauen(71,220);
};

func void dia_mario_pickpocket_info()
{
	Info_ClearChoices(dia_mario_pickpocket);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_BACK,dia_mario_pickpocket_back);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_PICKPOCKET,dia_mario_pickpocket_doit);
};

func void dia_mario_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mario_pickpocket);
};

func void dia_mario_pickpocket_back()
{
	Info_ClearChoices(dia_mario_pickpocket);
};

