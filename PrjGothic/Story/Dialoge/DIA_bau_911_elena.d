
instance DIA_ELENA_EXIT(C_INFO)
{
	npc = bau_911_elena;
	nr = 999;
	condition = dia_elena_exit_condition;
	information = dia_elena_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_elena_exit_condition()
{
	return TRUE;
};

func void dia_elena_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ELENA_HALLO(C_INFO)
{
	npc = bau_911_elena;
	nr = 1;
	condition = dia_elena_hallo_condition;
	information = dia_elena_hallo_info;
	permanent = FALSE;
	description = "������, ���������.";
};


func int dia_elena_hallo_condition()
{
	return TRUE;
};

func void dia_elena_hallo_info()
{
	AI_Output(other,self,"DIA_Elena_HALLO_15_00");	//������, ���������.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_01");	//��. ������ ��� �� ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_02");	//��� ���� �����?
	};
};


instance DIA_ELENA_AUFSTAND(C_INFO)
{
	npc = bau_911_elena;
	nr = 2;
	condition = dia_elena_aufstand_condition;
	information = dia_elena_aufstand_info;
	permanent = FALSE;
	description = "�������, ��� �� �������� ������ ������?";
};


func int dia_elena_aufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_aufstand_info()
{
	AI_Output(other,self,"DIA_Elena_Aufstand_15_00");	//�������, ��� �� �������� ������ ������?
	AI_Output(self,other,"DIA_Elena_Aufstand_16_01");	//��� ���� �����, ��� ������ ����� �������� ���� �����.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Elena_Aufstand_16_02");	//��������� ������� �� �������� ���. ��� ��������� ���� ������, ����� ������� ��������.
	};
};


instance DIA_ELENA_ARBEIT(C_INFO)
{
	npc = bau_911_elena;
	nr = 3;
	condition = dia_elena_arbeit_condition;
	information = dia_elena_arbeit_info;
	permanent = FALSE;
	description = "�����, �� �����, ���� �����-������ ������?";
};


func int dia_elena_arbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_elena_arbeit_info()
{
	AI_Output(other,self,"DIA_Elena_Arbeit_15_00");	//�����, �� �����, ���� �����-������ ������?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_01");	//��� ���� ������ ������ ����, ��� �������� �������� �����.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_02");	//���� ��� ���������? �� �� ����� �� ��������, ���������� � ������ � ����.
	AI_Output(other,self,"DIA_Elena_Arbeit_15_03");	//������� ������ ���� ����?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_04");	//���� ����� �������� ���� ������ � ���.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_05");	//� ���� ������, ��� ��������� ������ ���������.
};


instance DIA_ELENA_REGELN(C_INFO)
{
	npc = bau_911_elena;
	nr = 4;
	condition = dia_elena_regeln_condition;
	information = dia_elena_regeln_info;
	permanent = FALSE;
	description = "����� ���� �����-������ �������, ������� ��� ����� ��������������?";
};


func int dia_elena_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_elena_regeln_info()
{
	AI_Output(other,self,"DIA_Elena_Regeln_15_00");	//����� ���� �����-������ �������, ������� ��� ����� ��������������?
	AI_Output(self,other,"DIA_Elena_Regeln_16_01");	//�� ������ ����, ��� ���� �� �����������.
	AI_Output(self,other,"DIA_Elena_Regeln_16_02");	//�� ��� ���� ��� � ����� ����.
	AI_Output(self,other,"DIA_Elena_Regeln_16_03");	//� ���� ���� ������� ���������, ������ � ����������.
	AI_Output(self,other,"DIA_Elena_Regeln_16_04");	//���� �� ������� ����� � ��������, ��� ����� ����� ������ ����.
};


instance DIA_ELENA_AUFGABE(C_INFO)
{
	npc = bau_911_elena;
	nr = 5;
	condition = dia_elena_aufgabe_condition;
	information = dia_elena_aufgabe_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_elena_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_aufgabe_info()
{
	AI_Output(other,self,"DIA_Elena_AUFGABE_15_00");	//� ��� �� �����������?
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_01");	//� ������ ��, ��� �� ���������� �� �����. ���� �������� ������ ���-������, ��� ��� �����.
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_02");	//�� � ���� ������������ ����. � �� ����� ����������� � �� �������� ���������. �������?
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"����� ������� ������ �� ����� �����.");
};


var int elena_trade_mit_mir;

instance DIA_ELENA_TRADE(C_INFO)
{
	npc = bau_911_elena;
	nr = 7;
	condition = dia_elena_trade_condition;
	information = dia_elena_trade_info;
	permanent = TRUE;
	description = "������ ��� ���� ������!";
	trade = TRUE;
};


func int dia_elena_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_aufgabe) || (ELENA_TRADE_MIT_MIR == TRUE))
	{
		return TRUE;
	};
};

func void dia_elena_trade_info()
{
	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//������ ��� ���� ������!
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Elena_TRADE_16_01");	//�������.
};


instance DIA_ELENA_PERM(C_INFO)
{
	npc = bau_911_elena;
	nr = 900;
	condition = dia_elena_perm_condition;
	information = dia_elena_perm_info;
	permanent = TRUE;
	description = "������ ����������� ��������� ����� �� ����?";
};


func int dia_elena_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_perm_info()
{
	AI_Output(other,self,"DIA_Elena_PERM_15_00");	//������ ����������� ��������� ����� �� ����?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_01");	//��������� ���� ����� ��� ���� �������, ��� ��� ������ ������ ������ ��������� ������.
		AI_Output(self,other,"DIA_Elena_PERM_16_02");	//������� � ������ ��� ����� �� ����� � ������ ������ ������ �����.
		ELENA_TRADE_MIT_MIR = TRUE;
	}
	else if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_03");	//��������� ��������� �� �������� ����� ���������� ��� ���� � ����. ��� ������ ������ �������, ����� ��� ���� ���������.
	}
	else if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_04");	//����� ����� ����� ����� �������. ����� �� ������������ ������ �������� �� ������ ����. ��� ����� ����� �� ��� �� ��� � ������.
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_05");	//�������� ���������� ��� ����� � ����� ��������. �� � ��� ���, ��� ���� ������� �� ������ �������, ��� ����� ������� �����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_06");	//��� ������ � �������, ��� � ������ ��������� �����. �� � �� �����-�� ���� � ���. � �����, ��� �����, �� �����, �� � ������������.
	};
};


instance DIA_ELENA_MINENANTEIL(C_INFO)
{
	npc = bau_911_elena;
	nr = 2;
	condition = dia_elena_minenanteil_condition;
	information = dia_elena_minenanteil_info;
	description = "�� �������� �����?";
};


func int dia_elena_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_minenanteil_info()
{
	AI_Output(other,self,"DIA_Elena_MINENANTEIL_15_00");	//�� �������� ����� ����?
	AI_Output(self,other,"DIA_Elena_MINENANTEIL_16_01");	//�� � ���? � ���� �� ������ � ������� ��������.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ELENA_PICKPOCKET(C_INFO)
{
	npc = bau_911_elena;
	nr = 900;
	condition = dia_elena_pickpocket_condition;
	information = dia_elena_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_elena_pickpocket_condition()
{
	return c_beklauen(30,35);
};

func void dia_elena_pickpocket_info()
{
	Info_ClearChoices(dia_elena_pickpocket);
	Info_AddChoice(dia_elena_pickpocket,DIALOG_BACK,dia_elena_pickpocket_back);
	Info_AddChoice(dia_elena_pickpocket,DIALOG_PICKPOCKET,dia_elena_pickpocket_doit);
};

func void dia_elena_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_elena_pickpocket);
};

func void dia_elena_pickpocket_back()
{
	Info_ClearChoices(dia_elena_pickpocket);
};

