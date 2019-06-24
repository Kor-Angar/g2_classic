
instance DIA_CARL_EXIT(C_INFO)
{
	npc = vlk_461_carl;
	nr = 999;
	condition = dia_carl_exit_condition;
	information = dia_carl_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_carl_exit_condition()
{
	return TRUE;
};

func void dia_carl_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_carlsayhallo()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_00");	//������, � ������ ���� ��������� �����, ������� ������ � ���������� �������.
	AI_Output(self,other,"DIA_Carl_Hallo_05_01");	//��������� ������ ������� ����������� �������� ������� ����� ����, �� ��� ������ �� �����.
};


instance DIA_CARL_PICKPOCKET(C_INFO)
{
	npc = vlk_461_carl;
	nr = 900;
	condition = dia_carl_pickpocket_condition;
	information = dia_carl_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_carl_pickpocket_condition()
{
	return c_beklauen(34,40);
};

func void dia_carl_pickpocket_info()
{
	Info_ClearChoices(dia_carl_pickpocket);
	Info_AddChoice(dia_carl_pickpocket,DIALOG_BACK,dia_carl_pickpocket_back);
	Info_AddChoice(dia_carl_pickpocket,DIALOG_PICKPOCKET,dia_carl_pickpocket_doit);
};

func void dia_carl_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_carl_pickpocket);
};

func void dia_carl_pickpocket_back()
{
	Info_ClearChoices(dia_carl_pickpocket);
};


instance DIA_CARL_HALLO(C_INFO)
{
	npc = vlk_461_carl;
	nr = 2;
	condition = dia_carl_hallo_condition;
	information = dia_carl_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_carl_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_carl_hallo_info()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_02");	//��� ������� ���� � ���� ������ �����? ��� �� ����� �����?
	Info_ClearChoices(dia_carl_hallo);
	Info_AddChoice(dia_carl_hallo,"� ����������.",dia_carl_hallo_verlaufen);
	Info_AddChoice(dia_carl_hallo,"� ������ �����, ���������� �����������.",dia_carl_hallo_umsehen);
};

func void dia_carl_hallo_verlaufen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_verlaufen_15_00");	//� ����������.
	AI_Output(self,other,"DIA_Carl_Hallo_verlaufen_05_01");	//����� ������, ����� ���� �� ��������.
	b_carlsayhallo();
	Info_ClearChoices(dia_carl_hallo);
};

func void dia_carl_hallo_umsehen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_umsehen_15_00");	//� ������ �����, ���������� �����������.
	AI_Output(self,other,"DIA_Carl_Hallo_umsehen_05_01");	//���. ������, ����������� � �������� ��������.
	b_carlsayhallo();
	Info_ClearChoices(dia_carl_hallo);
};


instance DIA_CARL_DIEBE(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_diebe_condition;
	information = dia_carl_diebe_info;
	permanent = FALSE;
	description = "��� �� ������ � �����?";
};


func int dia_carl_diebe_condition()
{
	return TRUE;
};

func void dia_carl_diebe_info()
{
	AI_Output(other,self,"DIA_Carl_Diebe_15_00");	//��� �� ������ � �����?
	AI_Output(self,other,"DIA_Carl_Diebe_05_01");	//������. �� ��� �������� �������� � ���������� ������������� - �������� � �������.
	AI_Output(self,other,"DIA_Carl_Diebe_05_02");	//������, ����� ���� �� ������� � ����� ����. � ��� ����� �� �����.
	AI_Output(self,other,"DIA_Carl_Diebe_05_03");	//��, �� ������ ��� ���������� �� �����. ������� ������� - ����� �����.
};


instance DIA_CARL_LERNEN(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_lernen_condition;
	information = dia_carl_lernen_info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_carl_lernen_condition()
{
	return TRUE;
};

func void dia_carl_lernen_info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_Carl_Lernen_05_01");	//��, � ����� ���� ��� �������� ������� � ������ � ���� ��������� ��������.
	AI_Output(self,other,"DIA_Carl_Lernen_05_02");	//�� � ���� ��� ���� �� ������������ ������, ����� ����� ���� �����.
	AI_Output(self,other,"DIA_Carl_Lernen_05_03");	//���� �� ������ ��������� ����� �������, �������� � �������. ��-�� �� ����� �����, ��� ������ ������!
	AI_Output(self,other,"DIA_Carl_Lernen_05_04");	//�� ���� �� ������ ������� ������������� ���� �������, ��� � ���� ������.
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"����, ������ � �������� ��������, ����� ������� ���� �������.");
};


instance DIA_CARL_WIEVIEL(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_wieviel_condition;
	information = dia_carl_wieviel_info;
	permanent = FALSE;
	description = "������� �� ������ �� ��������?";
};


func int dia_carl_wieviel_condition()
{
	if(Npc_KnowsInfo(other,dia_carl_lernen))
	{
		return TRUE;
	};
};

func void dia_carl_wieviel_info()
{
	AI_Output(other,self,"DIA_Carl_Wieviel_15_00");	//������� �� ������ �� ��������?
	if(Npc_KnowsInfo(other,dia_edda_statue))
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_01");	//� ������, ��� �� ������ ��� ����. � ���� ����������� ���� ���������.
		CARL_TEACHSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_02");	//50 ������� ����� - � � ������ ���� ����� �������.
	};
};


instance DIA_CARL_BEZAHLEN(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_bezahlen_condition;
	information = dia_carl_bezahlen_info;
	permanent = TRUE;
	description = "� ���� ��������������� � �����. (��������� 50 �������).";
};


func int dia_carl_bezahlen_condition()
{
	if(Npc_KnowsInfo(other,dia_carl_wieviel) && (CARL_TEACHSTR == FALSE))
	{
		return TRUE;
	};
};

func void dia_carl_bezahlen_info()
{
	AI_Output(other,self,"DIA_Carl_bezahlen_15_00");	//� ���� ��������������� � �����.
	if(Npc_KnowsInfo(other,dia_edda_statue))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_01");	//� ������, ��� �� ������ ��� ����. � ���� ����������� ���� ���������.
		CARL_TEACHSTR = TRUE;
	}
	else if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_02");	//������, �� ����� ������, ��� ������ �� ������ �����.
		CARL_TEACHSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_03");	//������� ������, � � ���������� ����.
	};
};


instance DIA_CARL_TEACH(C_INFO)
{
	npc = vlk_461_carl;
	nr = 7;
	condition = dia_carl_teach_condition;
	information = dia_carl_teach_info;
	permanent = TRUE;
	description = "� ���� ����� �������.";
};


func int dia_carl_teach_condition()
{
	if(CARL_TEACHSTR == TRUE)
	{
		return TRUE;
	};
};

func void dia_carl_teach_info()
{
	AI_Output(other,self,"DIA_Carl_Teach_15_00");	//� ���� ����� �������.
	Info_ClearChoices(dia_carl_teach);
	Info_AddChoice(dia_carl_teach,DIALOG_BACK,dia_carl_teach_back);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_carl_teach_str_1);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_carl_teach_str_5);
};

func void dia_carl_teach_back()
{
	Info_ClearChoices(dia_carl_teach);
};

func void dia_carl_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,30);
	Info_ClearChoices(dia_carl_teach);
	Info_AddChoice(dia_carl_teach,DIALOG_BACK,dia_carl_teach_back);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_carl_teach_str_1);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_carl_teach_str_5);
};

func void dia_carl_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,30);
	Info_ClearChoices(dia_carl_teach);
	Info_AddChoice(dia_carl_teach,DIALOG_BACK,dia_carl_teach_back);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_carl_teach_str_1);
	Info_AddChoice(dia_carl_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_carl_teach_str_5);
};

