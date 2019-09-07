
instance DIA_TILL_EXIT(C_INFO)
{
	npc = bau_931_till;
	nr = 999;
	condition = dia_till_exit_condition;
	information = dia_till_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_till_exit_condition()
{
	return TRUE;
};

func void dia_till_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TILL_HALLO(C_INFO)
{
	npc = bau_931_till;
	nr = 3;
	condition = dia_till_hallo_condition;
	information = dia_till_hallo_info;
	description = "������.";
};


func int dia_till_hallo_condition()
{
	if(KAPITEL < 5)
	{
		return TRUE;
	};
};

func void dia_till_hallo_info()
{
	AI_Output(other,self,"DIA_Till_HALLO_15_00");	//������.
	AI_Output(self,other,"DIA_Till_HALLO_03_01");	//� �� ������������ � ��������. ������� ���� ��� ���������?
	b_startotherroutine(till,"Start");
	Info_ClearChoices(dia_till_hallo);
	if(KAPITEL < 5)
	{
		Info_AddChoice(dia_till_hallo,"� �� �������.",dia_till_hallo_keinervoneuch);
		if(Npc_IsDead(sekob) == FALSE)
		{
			Info_AddChoice(dia_till_hallo,"�� ���������� �����?",dia_till_hallo_selber);
		};
	};
};

func void dia_till_hallo_selber()
{
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_00");	//�� ���������� �����?
	AI_Output(self,other,"DIA_Till_HALLO_selber_03_01");	//�-�. ���, � ����� ���� ��� ������. �� ����� ������� ������ �� ����� � ����, ��� �����, ��� �� ������ ������, �������� �� ���.
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_02");	//����������!
	Info_ClearChoices(dia_till_hallo);
};

func void dia_till_hallo_keinervoneuch()
{
	AI_Output(other,self,"DIA_Till_HALLO_keinervoneuch_15_00");	//� �� �������.
	AI_Output(self,other,"DIA_Till_HALLO_keinervoneuch_03_01");	//� ���� ���� ����� ����? � ��� ������ ���. ��� ��� ����� �����.
	Info_ClearChoices(dia_till_hallo);
};


instance DIA_TILL_FELDARBEITER(C_INFO)
{
	npc = bau_931_till;
	nr = 4;
	condition = dia_till_feldarbeiter_condition;
	information = dia_till_feldarbeiter_info;
	description = "�� ��� ������ ����������� �� ������ �����������?";
};


func int dia_till_feldarbeiter_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_feldarbeiter_info()
{
	AI_Output(other,self,"DIA_Till_FELDARBEITER_15_00");	//�� ��� ������ ����������� �� ������ �����������?
	AI_Output(self,other,"DIA_Till_FELDARBEITER_03_01");	//������� - ����� ������. ���� �� ������������ ����������, ����� �� ����� - ��� ��������� �������.
};


instance DIA_TILL_SEKOB(C_INFO)
{
	npc = bau_931_till;
	nr = 9;
	condition = dia_till_sekob_condition;
	information = dia_till_sekob_info;
	description = "��� ����� ���������� � ����� �����.";
};


func int dia_till_sekob_condition()
{
	if(Npc_KnowsInfo(other,dia_till_feldarbeiter) && (Npc_KnowsInfo(other,dia_sekob_hallo) == FALSE) && (KAPITEL < 3) && (Npc_IsDead(sekob) == FALSE))
	{
		return TRUE;
	};
};

func void dia_till_sekob_info()
{
	AI_Output(other,self,"DIA_Till_SEKOB_15_00");	//��� ����� ���������� � ����� �����.
	AI_Output(self,other,"DIA_Till_SEKOB_03_01");	//� ���� ��� �� ��� �������. � ��� �������������. ��� � ���� ������ ����?
	AI_Output(other,self,"DIA_Till_SEKOB_15_02");	//��������, ���� �������� � ������ ����.
	AI_Output(self,other,"DIA_Till_SEKOB_03_03");	//�� �������� ���� ������� ������ � ������� ������, ��?
	AI_Output(other,self,"DIA_Till_SEKOB_15_04");	//������.
	AI_Output(self,other,"DIA_Till_SEKOB_03_05");	//��������, ����� ����� ������� ���.
	AI_Output(other,self,"DIA_Till_SEKOB_15_06");	//�� ����������, �������. � ����� ��� ���.
	AI_Output(self,other,"DIA_Till_SEKOB_03_07");	//��� �������.
	AI_StopProcessInfos(self);
};


instance DIA_TILL_WASMACHSTDU(C_INFO)
{
	npc = bau_931_till;
	nr = 10;
	condition = dia_till_wasmachstdu_condition;
	information = dia_till_wasmachstdu_info;
	description = "��� �� �����������?";
};


func int dia_till_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) && (hero.guild != GIL_MIL) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_00");	//� ��� �� �������, ����� �� ������� � ������� ���� �����?
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_01");	//���� �� ������.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_02");	//������� ��������� �� ������ ��� ���� ��������� �� ���� ����� � ������ ���, ��� ����� �����.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_03");	//��� ������� ���� ����� ������ �� ������� ������, ��� ������ ����� ����.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_04");	//���� �� � �������� �� ������ �� ���, ��� �� �� �������������.
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_05");	//�������!
};


instance DIA_TILL_WARUMNICHTSLD(C_INFO)
{
	npc = bau_931_till;
	nr = 11;
	condition = dia_till_warumnichtsld_condition;
	information = dia_till_warumnichtsld_info;
	description = "� ����� �������� �� �������� ��� ���������� �� ���������?";
};


func int dia_till_warumnichtsld_condition()
{
	if(Npc_KnowsInfo(other,dia_till_wasmachstdu) && (hero.guild != GIL_MIL) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_warumnichtsld_info()
{
	AI_Output(other,self,"DIA_Till_WARUMNICHTSLD_15_00");	//� ����� �������� �� �������� ��� ���������� �� ���������?
	AI_Output(self,other,"DIA_Till_WARUMNICHTSLD_03_01");	//�� ���� �������� ���������, � ��� ������� �������� ���� �����.
};


instance DIA_TILL_BRONKO(C_INFO)
{
	npc = bau_931_till;
	nr = 5;
	condition = dia_till_bronko_condition;
	information = dia_till_bronko_info;
	description = "(�������� � ������)";
};


func int dia_till_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_till_feldarbeiter) && Npc_KnowsInfo(other,dia_bronko_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronko_info()
{
	AI_Output(other,self,"DIA_Till_BRONKO_15_00");	//��� ��� �������� ������� ����� �� ���� ���������� ����, ���������, ��� �� ��� ������!
	AI_Output(self,other,"DIA_Till_BRONKO_03_01");	//(�����) ���. ��. � ����. ��� ������. �� ������ ��, ��� �����.
	AI_Output(self,other,"DIA_Till_BRONKO_03_02");	//� ��� ������� ��� ������� ��� ������, ����� �� ������ �� �� � ����� ��������, �� ��� ��� �����...
	AI_Output(other,self,"DIA_Till_BRONKO_15_03");	//��?
	AI_Output(self,other,"DIA_Till_BRONKO_03_04");	//�� ��� ����� �� ����� ��������.
	if(Npc_IsDead(sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Till_BRONKO_03_05");	//����� ���� ����� �� ��������, ��� ��� ��� ��� �� ������� ������� ��� ��������� � ������.
	};
};


instance DIA_TILL_BRONKOZURARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 6;
	condition = dia_till_bronkozurarbeit_condition;
	information = dia_till_bronkozurarbeit_info;
	permanent = TRUE;
	description = "��������, � ����� ������ ����.";
};


var int dia_till_bronkozurarbeit_noperm;

func int dia_till_bronkozurarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_till_bronko) && (DIA_TILL_BRONKOZURARBEIT_NOPERM == FALSE) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronkozurarbeit_info()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_15_00");	//����� ����, � ����� �������.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_03_01");	//��� �� ������ ������� ����? ������, ��������, ���� �� ������� ��������� ������ ��������, � ������� ����, ������, 10 ������� �����. ��� �������?
	TILL_ANGEBOT = 10;
	Info_ClearChoices(dia_till_bronkozurarbeit);
	Info_AddChoice(dia_till_bronkozurarbeit,"��� �������. �� ��� ����� ������ �����.",dia_till_bronkozurarbeit_mehr);
	Info_AddChoice(dia_till_bronkozurarbeit,"������. � ��������, ��� ����� �������.",dia_till_bronkozurarbeit_ok);
	Info_AddChoice(dia_till_bronkozurarbeit,"� ������� ��� ����.",dia_till_bronkozurarbeit_nochnicht);
};

func void dia_till_bronkozurarbeit_nochnicht()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_nochnicht_15_00");	//� ������� ��� ����.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_nochnicht_03_01");	//��� ������.
	Info_ClearChoices(dia_till_bronkozurarbeit);
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_ok()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_ok_15_00");	//������. � ��������, ��� ����� �������.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_ok_03_01");	//�� ���������� � ����.
	DIA_TILL_BRONKOZURARBEIT_NOPERM = TRUE;
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BRONKOEINGESCHUECHTERT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRONKOEINGESCHUECHTERT,LOG_RUNNING);
	b_logentry(TOPIC_BRONKOEINGESCHUECHTERT,"���� �� ����� ��������� ������ ��������. ���� �����, ����� ��� ���������� ������� �.");
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_mehr()
{
	if(TILL_ICHMACHSNUREINMAL == TRUE)
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_00");	//� ���� ������.
	}
	else
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_01");	//��� �������. �� ��� ����� ������ �����.
		TILL_ICHMACHSNUREINMAL = TRUE;
	};
	if(TILL_ANGEBOT == 10)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_02");	//������. 20 ������� �����.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"� ���� ������.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"������. � ��������, ��� ����� �������.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 20;
	}
	else if(TILL_ANGEBOT == 20)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_03");	//30?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"� ���� ������.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"������. � ��������, ��� ����� �������.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 30;
	}
	else if(TILL_ANGEBOT == 30)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_04");	//����� ����... 50?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"� ���� ������.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"������. � ��������, ��� ����� �������.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 50;
	}
	else if(TILL_ANGEBOT == 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_05");	//������. 70?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"� ���� ������.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"������. � ��������, ��� ����� �������.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 70;
	}
	else if(TILL_ANGEBOT == 70)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_06");	//������, ������! � ��� ���� 100 ������� �����. �� ��� ���, ��� � ���� ����.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"������. � ��������, ��� ����� �������.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 100;
	};
};


instance DIA_TILL_BRONKOWIEDERANARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 7;
	condition = dia_till_bronkowiederanarbeit_condition;
	information = dia_till_bronkowiederanarbeit_info;
	description = "������ �������� � ������.";
};


func int dia_till_bronkowiederanarbeit_condition()
{
	if((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS) && (DIA_TILL_BRONKOZURARBEIT_NOPERM == TRUE) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronkowiederanarbeit_info()
{
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_00");	//������ �������� � ������.
	AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_01");	//������? ��� �����������.
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_02");	//��. � ����� � ���� �������� ��� ������.
	IntToFloat(TILL_ANGEBOT);
	if(TILL_ANGEBOT <= 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_03");	//(���������) ����. ������. ������ ���� ������, ������?
		CreateInvItems(self,itmi_gold,TILL_ANGEBOT);
		b_giveinvitems(self,other,itmi_gold,TILL_ANGEBOT);
	}
	else
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_04");	//� ���������, � ���� ��� ����� �����. �� � ����� ���������� ���� �� ������.
		TILL_HATSEINGELDBEHALTEN = TRUE;
	};
	b_giveplayerxp(XP_BRONKOGEHTANDIEARBEIT);
	AI_StopProcessInfos(self);
};


instance DIA_TILL_PERMKAP1(C_INFO)
{
	npc = bau_931_till;
	nr = 99;
	condition = dia_till_permkap1_condition;
	information = dia_till_permkap1_info;
	permanent = TRUE;
	description = "(���������� �����)";
};


func int dia_till_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) || (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_till_permkap1_info()
{
	if(KAPITEL == 5)
	{
		if((MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
		{
			AI_Output(other,self,"DIA_Till_PERMKAP1_15_00");	//� �� ����-�� ������, �? ������� �� ������ ������ ���� �����.
			AI_Output(self,other,"DIA_Till_PERMKAP1_03_01");	//�����-������ � ����� ���� �����.
		};
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_02");	//�� ����, �������, ���� � ������� ���� � �����.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_03");	//����� ������ ���� � �����.
		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_04");	//�����, ���� ����� �������� �������, ����� �� ����� ������� � �������.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_05");	//�����-������ � ���������� � �����.
		AI_StopProcessInfos(self);
	}
	else if(TILL_HATSEINGELDBEHALTEN == TRUE)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_06");	//�� �� ������ ���������...
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_07");	//�����.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_08");	//���� ������� ����� ��� �� ��� � �����?
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_09");	//������ ���� � �����, ��, �����!
	};
};


instance DIA_TILL_PICKPOCKET(C_INFO)
{
	npc = bau_931_till;
	nr = 900;
	condition = dia_till_pickpocket_condition;
	information = dia_till_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_till_pickpocket_condition()
{
	return c_beklauen(36,40);
};

func void dia_till_pickpocket_info()
{
	Info_ClearChoices(dia_till_pickpocket);
	Info_AddChoice(dia_till_pickpocket,DIALOG_BACK,dia_till_pickpocket_back);
	Info_AddChoice(dia_till_pickpocket,DIALOG_PICKPOCKET,dia_till_pickpocket_doit);
};

func void dia_till_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_till_pickpocket);
};

func void dia_till_pickpocket_back()
{
	Info_ClearChoices(dia_till_pickpocket);
};

