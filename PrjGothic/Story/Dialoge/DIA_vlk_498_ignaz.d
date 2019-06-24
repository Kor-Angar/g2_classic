
instance DIA_IGNAZ_EXIT(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 999;
	condition = dia_ignaz_exit_condition;
	information = dia_ignaz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ignaz_exit_condition()
{
	return TRUE;
};

func void dia_ignaz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_PICKPOCKET(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 900;
	condition = dia_ignaz_pickpocket_condition;
	information = dia_ignaz_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_ignaz_pickpocket_condition()
{
	return c_beklauen(38,50);
};

func void dia_ignaz_pickpocket_info()
{
	Info_ClearChoices(dia_ignaz_pickpocket);
	Info_AddChoice(dia_ignaz_pickpocket,DIALOG_BACK,dia_ignaz_pickpocket_back);
	Info_AddChoice(dia_ignaz_pickpocket,DIALOG_PICKPOCKET,dia_ignaz_pickpocket_doit);
};

func void dia_ignaz_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ignaz_pickpocket);
};

func void dia_ignaz_pickpocket_back()
{
	Info_ClearChoices(dia_ignaz_pickpocket);
};


instance DIA_IGNAZ_HALLO(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_hallo_condition;
	information = dia_ignaz_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ignaz_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ignaz_hallo_info()
{
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_00");	//�� - �� �������� ��� ��� �������. ��� ����� ��������� ��� ����������� ������������.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_01");	//� ������, ��� ���� �� �������� ������� ��� ������ �� ��� �����.
	AI_Output(other,self,"DIA_Ignaz_Hallo_15_02");	//�������, ���� ���. ������� �����, � ��� �� �����������.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_03");	//� ���������� ����� ����������. ���������� ��������.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_04");	//� ��� ��������, ��� ����� ������������ ���, �� � ���� ��� ������� �� ���������� ������ ���������� �����.
};


instance DIA_IGNAZ_TRAENKE(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 3;
	condition = dia_ignaz_traenke_condition;
	information = dia_ignaz_traenke_info;
	permanent = FALSE;
	description = "� ��� � ������ �� ��, ��� ������ ����?";
};


func int dia_ignaz_traenke_condition()
{
	if(MIS_IGNAZ_CHARM != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ignaz_traenke_info()
{
	AI_Output(other,self,"DIA_Ignaz_Traenke_15_00");	//� ��� � ������ �� ��, ��� ������ ����?
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_01");	//� ��� �� ������� ���� ��������� ������������� �����.
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_02");	//� ���� ������� �������� �������� � �������� ����, � ����� ����� ���������.
};


instance DIA_IGNAZ_EXPERIMENT(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 4;
	condition = dia_ignaz_experiment_condition;
	information = dia_ignaz_experiment_info;
	permanent = FALSE;
	description = "�������� ��� ��������� �� ���� ������������ � ����� ����������.";
};


func int dia_ignaz_experiment_condition()
{
	return TRUE;
};

func void dia_ignaz_experiment_info()
{
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_00");	//�������� ��� ��������� �� ���� ������������ � ����� ����������.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_01");	//��� ���������� ��������� ��������� ����-������ ������ ��������� �������.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_02");	//����, � ������� ������, ��� ��� ��������, ����� ������ ����� ���������� ��������� � ������ - ��������, ���� �� ������ ��� ��� ���� � ��� ��� ��������.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_03");	//� ���� �������� �� ��, ��� ��� ������������ ��������� � ��� ������ ���, �� ��� �������.
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_04");	//�� ����, � ������ ����� ����-������ � ��� � �������� �� ���� ��� ����������?
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_05");	//��, �� ��� ��������� ���������. �� ����� ��������� ����-������, ���������� ������ ��������� - ����� ��� ������������� ������� ��� � ���.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_06");	//������ �� ������ ��������� ��� ��� ��� ���������� - ���� ���������� ����� ���������� ������ ����, � ���� ����������� ��������� �������� � ������ �����.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_07");	//����� �� ����� ������ �������� ��� ���������� �� ����, ��� ������� ����. ����� ���������� ������.
};


instance DIA_IGNAZ_TEILNEHMEN(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 5;
	condition = dia_ignaz_teilnehmen_condition;
	information = dia_ignaz_teilnehmen_info;
	permanent = FALSE;
	description = "������, � ������� ��� ����������.";
};


func int dia_ignaz_teilnehmen_condition()
{
	if(Npc_KnowsInfo(other,dia_ignaz_experiment))
	{
		return TRUE;
	};
};

func void dia_ignaz_teilnehmen_info()
{
	AI_Output(other,self,"DIA_Ignaz_teilnehmen_15_00");	//������, � ������� ��� ����������.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_01");	//����� ������ ���� ������ � ����� ����������� ����������� �������.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_02");	//� ����� ���������, ����������� � �������� ��� ��� ��� ������.
	b_giveinvitems(self,other,itsc_charm,1);
	MIS_IGNAZ_CHARM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_IGNAZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_IGNAZ,LOG_RUNNING);
	b_logentry(TOPIC_IGNAZ,"� ������ �������� ����� ���������� ������. ��� ���������� ���������� ��������. ������ ���-������ ������� �� ���� � ���������� ����� ��� �� ������ ������� � ������ �� ����� �������� �� ����. ��� ��������� ������ ��� ������������� ����� ����������.");
	b_logentry(TOPIC_IGNAZ,"��� ��������� ����������� �������� ����������. ���������� ����� ������� �������� � ������������ �������. � �� �����, ��� ���-���� � �������� �������� ������ ��������, ���� � ������� ���.");
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_RUNNING(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_running_condition;
	information = dia_ignaz_running_info;
	permanent = FALSE;
	description = "������ ������������...";
};


func int dia_ignaz_running_condition()
{
	if((MIS_IGNAZ_CHARM == LOG_RUNNING) && (CHARM_TEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_running_info()
{
	AI_Output(other,self,"DIA_Ignaz_Running_15_00");	//������ ������������...
	AI_Output(self,other,"DIA_Ignaz_Running_14_01");	//� ���� ����������, ��? ��� �� ������ ������� �������� ��� ������?
	AI_Output(self,other,"DIA_Ignaz_Running_14_02");	//���� ���� ����� ��� ������ � ���� �����������, �� ������ ������ �� � ����.
};


instance DIA_IGNAZ_DANACH(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 6;
	condition = dia_ignaz_danach_condition;
	information = dia_ignaz_danach_info;
	permanent = FALSE;
	description = "� ����������� ������.";
};


func int dia_ignaz_danach_condition()
{
	if((CHARM_TEST == TRUE) && (MIS_IGNAZ_CHARM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_ignaz_danach_info()
{
	AI_Output(other,self,"DIA_Ignaz_Danach_15_00");	//� ����������� ������.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_01");	//�������, �������. � ���� ��� ����������?
	AI_Output(other,self,"DIA_Ignaz_Danach_15_02");	//��, ���������� ���������.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_03");	//�����������. �����, � ����� ������ ����� ��� � �� ����� ������� ����������, �� ��� ���� ��� ����� ����� ������!
	AI_Output(self,other,"DIA_Ignaz_Danach_14_04");	//������ � ���� ������� ���� ����� � ������� ���� ��������� �������.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_05");	//� ����� ���� ������� ���� ���-������ ��������, ���� ��, �������, ������ �����.
	IGNAZ_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"����� ����� �������� ��� ������� ������������� �����. �� ����� � �������� ��������.");
	MIS_IGNAZ_CHARM = LOG_SUCCESS;
	b_giveplayerxp(XP_MIS_IGNAZ_CHARM);
	CreateInvItems(self,itsc_charm,3);
};


instance DIA_IGNAZ_TRADE(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 6;
	condition = dia_ignaz_trade_condition;
	information = dia_ignaz_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "������ ��� ���� ������.";
};


func int dia_ignaz_trade_condition()
{
	if((MIS_IGNAZ_CHARM == LOG_SUCCESS) || Npc_KnowsInfo(other,dia_ignaz_running))
	{
		return TRUE;
	};
};

func void dia_ignaz_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Ignaz_Trade_15_00");	//������ ��� ���� ������.
};


instance DIA_IGNAZ_TEACH(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_teach_condition;
	information = dia_ignaz_teach_info;
	permanent = TRUE;
	description = "����� ���� ��������� �������.";
};


var int dia_ignaz_teach_permanent;

func int dia_ignaz_teach_condition()
{
	if((DIA_IGNAZ_TEACH_PERMANENT == FALSE) && (IGNAZ_TEACHALCHEMY == TRUE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Ignaz_Teach_15_00");	//����� ���� ��������� �������.
	if((PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE))
	{
		Info_ClearChoices(dia_ignaz_teach);
		Info_AddChoice(dia_ignaz_teach,DIALOG_BACK,dia_ignaz_teach_back);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE) && ((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE)))
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("����� ���������",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_ignaz_teach_speed);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("�������� ����",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_ignaz_teach_mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("�������� ��������",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_ignaz_teach_health);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_01");	//����� ����������� ����� �� ������������ �����, ���� ����������� ������������ ��������.
			AI_Output(self,other,"DIA_Ignaz_Teach_14_02");	//����� ���� ����������� ��������� �������� � ������ �����������.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_04");	//��� �� ������ ������?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ignaz_Teach_14_05");	//�� ��� ������ ���, ���� � ��� ������� ����.
		DIA_IGNAZ_TEACH_PERMANENT = TRUE;
	};
};

func void dia_ignaz_teach_health()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_speed()
{
	b_teachplayertalentalchemy(self,other,POTION_SPEED);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_back()
{
	Info_ClearChoices(dia_ignaz_teach);
};

