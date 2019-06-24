
instance DIA_PARCIVAL_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_exit_condition;
	information = dia_parcival_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_parcival_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_SCHURFER(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_schurfer_condition;
	information = dia_parcival_schurfer_info;
	permanent = FALSE;
	description = "��� �� ������ ���������� ��� � ����������?";
};


func int dia_parcival_schurfer_condition()
{
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parcival_schurfer_info()
{
	AI_Output(other,self,"DIA_Parcival_Schurfer_15_00");	//��� �� ������ ���������� ��� � ����������?
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_01");	//� ��������� ��� ��� ������.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_02");	//�� ���������� ������, ������ � ����������.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_03");	//������ ������� ����� �� ����������� � ������ ����� - �� ����� ������ ������� �����.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_04");	//������ ��� ������ ����� ������.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_05");	//�������, ���� �� ����� �����������, �������, ��� ��� ������� ������ ���������� �� ������� �����.
	b_logentry(TOPIC_SCOUTMINE,"������ ���������� ����������� ��������. ������, ������ � ����������.");
	b_logentry(TOPIC_SCOUTMINE,"������ ������� ����� �� ����������� � ������ �����. �� ����������� ��� ������� �����.");
	b_logentry(TOPIC_SCOUTMINE,"������ ��� ������ ����� ������. ��� ������� ������ ���������� �� ������� �����.");
};


instance DIA_PARCIVAL_DIEGO(C_INFO)
{
	npc = pal_252_parcival;
	nr = 9;
	condition = dia_parcival_diego_condition;
	information = dia_parcival_diego_info;
	permanent = FALSE;
	description = "� � ����� ������� ���������� ����� �����?";
};


func int dia_parcival_diego_condition()
{
	if((SEARCHFORDIEGO == LOG_RUNNING) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_parcival_diego_info()
{
	AI_Output(other,self,"DIA_Parcival_Diego_15_00");	//� � ����� ������� ���������� ����� �����?
	AI_Output(self,other,"DIA_Parcival_Diego_13_01");	//���� ��������� - �����? �� � ������� �������� ����������.
	b_logentry(TOPIC_SCOUTMINE,"����� ����� �� �����������, �������������� ��������� ����������.");
};


instance DIA_PARCIVAL_WEG(C_INFO)
{
	npc = pal_252_parcival;
	nr = 8;
	condition = dia_parcival_weg_condition;
	information = dia_parcival_weg_info;
	permanent = FALSE;
	description = "�� ������, ��� ��������� �� ���� ����?";
};


func int dia_parcival_weg_condition()
{
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parcival_weg_info()
{
	AI_Output(other,self,"DIA_Parcival_Weg_15_00");	//�� ������, ��� ��������� �� ���� ����?
	AI_Output(self,other,"DIA_Parcival_Weg_13_01");	//����� ������ ������ ��� ����������� ����. �� ��� ��� �� �������, ��� ����� ����� �������� ������ ������.
	AI_Output(self,other,"DIA_Parcival_Weg_13_02");	//������� �������� �� ����� � ����� - � �� ������ ���� �����.
	b_logentry(TOPIC_SCOUTMINE,"������, ������ ���� � ���������� ����� ��������� �� ������ �������. ��� ����� �������� �������� ���� � ������ �����.");
};


instance DIA_PARCIVAL_DRAGON(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_dragon_condition;
	information = dia_parcival_dragon_info;
	description = "��� ��������?";
};


func int dia_parcival_dragon_condition()
{
	return TRUE;
};

func void dia_parcival_dragon_info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGON_15_00");	//��� ����������?
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_01");	//�� �������� ������. ������, ��� ����� �������.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_02");	//�� ����������� ������ ���� �������� ��������� ��������. ��� ��� ���������� ���� ������� ����.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_03");	//��� ���� ��������� ��������, � �� ������� ������� ������.
};


instance DIA_PARCIVAL_DRAGONS(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_dragons_condition;
	information = dia_parcival_dragons_info;
	description = "������� ����� ��������?";
};


func int dia_parcival_dragons_condition()
{
	if(Npc_KnowsInfo(hero,dia_parcival_dragon) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_parcival_dragons_info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGONS_15_00");	//������� ����� ��������?
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_01");	//�� �� �����, ������� �� �����, �� ������ ������, ��� �����.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_02");	//�� � ��� ��� �� ���. ��� ������ �������� ����� ������������ ����������, ��������������� ��������.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_03");	//�� ����� ���������� ���� - ��� ������������ ����� ���� ����� ��������� ������ ������ ��������.
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_BRAVE(C_INFO)
{
	npc = pal_252_parcival;
	nr = 8;
	condition = dia_parcival_brave_condition;
	information = dia_parcival_brave_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_parcival_brave_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(hero,dia_parcival_dragons) && (KAPITEL < 3) && (PARCIVAL_BRAVE_LABERCOUNT <= 6))
	{
		return TRUE;
	};
};


var int parcival_brave_labercount;

func void dia_parcival_brave_info()
{
	var int randy;
	if(PARCIVAL_BRAVE_LABERCOUNT < 6)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_00");	//���� ��� ��������. �� ��� ����� ������ ������������.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_01");	//�� ����� ���������, ������� ������.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_02");	//����� ������� ���. ��� ���� ������� ���� ������!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_BRAVE_13_03");	//��! ���� ���,  ������ ������ ������, ��� ������� �� ����? ����������!
		b_giveplayerxp(XP_AMBIENT);
	};
	PARCIVAL_BRAVE_LABERCOUNT = PARCIVAL_BRAVE_LABERCOUNT + 1;
};


instance DIA_PARCIVAL_KAP3_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap3_exit_condition;
	information = dia_parcival_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_parcival_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_ALLESKLAR(C_INFO)
{
	npc = pal_252_parcival;
	nr = 31;
	condition = dia_parcival_allesklar_condition;
	information = dia_parcival_allesklar_info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int dia_parcival_allesklar_condition()
{
	if((KAPITEL == 3) && (DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER < 3) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};


var int dia_parcival_allesklar_nervcounter;

func void dia_parcival_allesklar_info()
{
	AI_Output(other,self,"DIA_Parcival_ALLESKLAR_15_00");	//��� � �������?
	if(DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_01");	//���� ��!
	}
	else if(DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER == 1)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_02");	//��, ���� ���� ������.
	}
	else if(PARCIVAL_BRAVE_LABERCOUNT > 6)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_03");	//(�������) ��. ������ � �������, ��� �� �������. ���, ������. �� �� ���� ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_04");	//�� �������� ����.
	};
	DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER = DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER + 1;
};


instance DIA_PARCIVAL_KAP4_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap4_exit_condition;
	information = dia_parcival_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_parcival_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_ANYNEWS(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_anynews_condition;
	information = dia_parcival_anynews_info;
	description = "������ ������� �� ���������?";
};


func int dia_parcival_anynews_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_anynews_info()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_15_00");	//������ ������� �� ���������?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_01");	//�� ���� �� ���� �������� ��������, ��� �������� ���� ���������� �� ��������?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_02");	//������-��, � �������, ��� � ���� ������ ��� �� ����������� � ����� ����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_03");	//� ����������. ����� ������ ����������.
		AI_Output(other,self,"DIA_Parcival_AnyNews_15_04");	//���?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_05");	//������� ����� ��������� ��� ����. ��� �������� ���� ���������� �� ��������.
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_06");	//� ���� ����� ������ ��� ��� ����������� � �����������.
	};
	AI_Output(self,other,"DIA_Parcival_AnyNews_13_07");	//���� �� ��� ���� � ���� ������, � �� ������ �� ���� �� �����. ����� ���� ����������� � ���.
	Info_ClearChoices(dia_parcival_anynews);
	Info_AddChoice(dia_parcival_anynews,"�� � ������� �� ����� ������, ��� ��� �� �����.",dia_parcival_anynews_lordhagen);
	Info_AddChoice(dia_parcival_anynews,"�� ������ ���� �� ����.",dia_parcival_anynews_chance);
	Info_AddChoice(dia_parcival_anynews,"���� �� �������, ��� �� ���������������?",dia_parcival_anynews_overact);
};

func void dia_parcival_anynews_lordhagen()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_LordHagen_15_00");	//�� � ������� �� ����� ������, ��� ��� �� �����.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_01");	//(������ �������) ��, � ���������, ��� ���, ��� � ��� ����.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_02");	//�������� ����� ���������� ��� �������� ���������.
	Info_ClearChoices(dia_parcival_anynews);
};

func void dia_parcival_anynews_chance()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Chance_15_00");	//�� ������ ���� �� ����.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_01");	//� ��� ��� �������. � ���������.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_02");	//������ �������, ��� ��� ����� ������ ���.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_03");	//�� � ���� � ��� �� �����. � ��� � ��� ������� ������� � ������. � �������������� ������������ ��� ������ �� � ����.
	Info_ClearChoices(dia_parcival_anynews);
};

func void dia_parcival_anynews_overact()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Overact_15_00");	//���� �� �������, ��� �� ���������������?
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_01");	//��������� ���. � ����� �������� ��� ����� ����, �������� ����� ������ ��������.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_02");	//�����, ������� �������� ����� ������ � ������� ����� ������.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_03");	//� ������ ����� ��� ���������� ��������� ������ ��� ���� ������.
};


instance DIA_PARCIVAL_JAN(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_jan_condition;
	information = dia_parcival_jan_info;
	permanent = FALSE;
	description = "��� ����� ���������� � ����� � ���.";
};


func int dia_parcival_jan_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_RUNNING) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_jan_info()
{
	AI_Output(other,self,"DIA_Parcival_Jan_15_00");	//��� ����� ���������� � ����� � ���.
	AI_Output(self,other,"DIA_Parcival_Jan_13_01");	//���? ��� ���?
	AI_Output(other,self,"DIA_Parcival_Jan_15_02");	//������� �� ��������. �� ������.
	AI_Output(self,other,"DIA_Parcival_Jan_13_03");	//��, ��. � �����. ��� ������ ����?
	AI_Output(other,self,"DIA_Parcival_Jan_15_04");	//�� ����� �������� � �������.
	AI_Output(self,other,"DIA_Parcival_Jan_13_05");	//��� ���� �� �����������. �� �� ��� ������� � � �� ������� ���.
};


instance DIA_PARCIVAL_THINKAGAIN(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_thinkagain_condition;
	information = dia_parcival_thinkagain_info;
	permanent = TRUE;
	description = "�� �� ��� �� ������������ ���� ������ ������ ���?";
};


func int dia_parcival_thinkagain_condition()
{
	if(Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_JANBECOMESSMITH == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_parcival_thinkagain_info()
{
	AI_Output(other,self,"DIA_Parcival_ThinkAgain_15_00");	//�� �� ��� �� ������������ ���� ������ ������ ���?
	AI_Output(self,other,"DIA_Parcival_ThinkAgain_13_01");	//���, ��� ������� ������������.
};


instance DIA_PARCIVAL_TALKEDGAROND(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_talkedgarond_condition;
	information = dia_parcival_talkedgarond_info;
	description = "������ �����, ����� �� ������� � �������.";
};


func int dia_parcival_talkedgarond_condition()
{
	if(Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_talkedgarond_info()
{
	AI_Output(other,self,"DIA_Parcival_TalkedGarond_15_00");	//������ �����, ����� �� ������� � �������.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_01");	//���. ���� ��� ������������� ���, �� � �� ���� ������ ������ �����.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_02");	//���� � � ������ ������� �������� ����� ���.
};


instance DIA_PARCIVAL_PERMKAP4(C_INFO)
{
	npc = pal_252_parcival;
	nr = 43;
	condition = dia_parcival_permkap4_condition;
	information = dia_parcival_permkap4_info;
	permanent = TRUE;
	description = "� ����� �����?";
};


func int dia_parcival_permkap4_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_parcival_anynews))
	{
		return TRUE;
	};
};

func void dia_parcival_permkap4_info()
{
	AI_Output(other,self,"DIA_Parcival_PERMKAP4_15_00");	//� ����� �����?
	AI_Output(self,other,"DIA_Parcival_PERMKAP4_13_01");	//��, ������ ���� � �����!
};


instance DIA_PARCIVAL_KAP5_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap5_exit_condition;
	information = dia_parcival_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_parcival_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_VERRAETER(C_INFO)
{
	npc = pal_252_parcival;
	condition = dia_parcival_verraeter_condition;
	information = dia_parcival_verraeter_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_parcival_verraeter_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (MIS_OCGATEOPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_parcival_verraeter_info()
{
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_00");	//���������! � ����� ����, ��� ��� �� ������ ������.
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_01");	//�� ��������� �� ���.
	Npc_SetRefuseTalk(self,30);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_PARCIVAL_KAP6_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap6_exit_condition;
	information = dia_parcival_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_parcival_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_PICKPOCKET(C_INFO)
{
	npc = pal_252_parcival;
	nr = 900;
	condition = dia_parcival_pickpocket_condition;
	information = dia_parcival_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_parcival_pickpocket_condition()
{
	return c_beklauen(84,460);
};

func void dia_parcival_pickpocket_info()
{
	Info_ClearChoices(dia_parcival_pickpocket);
	Info_AddChoice(dia_parcival_pickpocket,DIALOG_BACK,dia_parcival_pickpocket_back);
	Info_AddChoice(dia_parcival_pickpocket,DIALOG_PICKPOCKET,dia_parcival_pickpocket_doit);
};

func void dia_parcival_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_parcival_pickpocket);
};

func void dia_parcival_pickpocket_back()
{
	Info_ClearChoices(dia_parcival_pickpocket);
};

