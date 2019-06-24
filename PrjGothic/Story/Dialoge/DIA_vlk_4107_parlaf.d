
instance DIA_PARLAF_EXIT(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 999;
	condition = dia_parlaf_exit_condition;
	information = dia_parlaf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlaf_exit_condition()
{
	return TRUE;
};

func void dia_parlaf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARLAF_HALLO(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 1;
	condition = dia_parlaf_hallo_condition;
	information = dia_parlaf_hallo_info;
	description = "������, ��� ����?";
};


func int dia_parlaf_hallo_condition()
{
	return TRUE;
};

func void dia_parlaf_hallo_info()
{
	AI_Output(other,self,"DIA_Parlaf_HALLO_15_00");	//������, ��� ����?
	AI_Output(self,other,"DIA_Parlaf_HALLO_03_01");	//� ���, ��-������? � ������ ����� ���� �� ��������� ������, ��������� ������.
	if(Npc_IsDead(engor) == FALSE)
	{
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_02");	//� ����� ����� ����� ������ ��� ����. ���� �� ����� ���������� � ��� �� ����, �� ��� ������ � ������.
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_03");	//��� ��� ���� �������� ����. �� ����� �������� �����������.
	};
};


instance DIA_PARLAF_ENGOR(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 2;
	condition = dia_parlaf_engor_condition;
	information = dia_parlaf_engor_info;
	description = "��� ����� �����?";
};


func int dia_parlaf_engor_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlaf_hallo) && (Npc_IsDead(engor) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlaf_engor_info()
{
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_00");	//��� ����� �����?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_01");	//����� �������� ��������� � ������ �����. � ��� ���������� ��� ������ � ������ �������.
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_02");	//�������, � ��� ����� ������������, �� ������ �� ������ � ������ ��������.
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_03");	//� �� �� ������ ��������� ���� ���?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_04");	//�� �� �����, ��� ��� ������, � ���� ������ ������ ���� ���!
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	Log_AddEntry(TOPIC_TRADER_OC,"����� �������� ��������� ����� � ����� ��������� ������ �� �������.");
};


instance DIA_PARLAF_WO(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 3;
	condition = dia_parlaf_wo_condition;
	information = dia_parlaf_wo_info;
	permanent = FALSE;
	description = "��� ��� ����� ����� ������?";
};


func int dia_parlaf_wo_condition()
{
	if(Npc_KnowsInfo(other,dia_parlaf_engor) && (Npc_IsDead(engor) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlaf_wo_info()
{
	AI_Output(other,self,"DIA_Parlaf_Wo_15_00");	//��� ��� ����� ����� ������?
	AI_Output(self,other,"DIA_Parlaf_Wo_03_01");	//� ���� �������. ������ ����� �������� ���� ����� � ��������.
};


instance DIA_PARLAF_HUNGRIG(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 2;
	condition = dia_parlaf_hungrig_condition;
	information = dia_parlaf_hungrig_info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int dia_parlaf_hungrig_condition()
{
	if((MIS_ENGOR_BRINGMEAT != LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_parlaf_hallo) && (Npc_IsDead(engor) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlaf_hungrig_info()
{
	AI_Output(other,self,"DIA_Parlaf_HUNGRIG_15_00");	//��� ����������?
	AI_Output(self,other,"DIA_Parlaf_HUNGRIG_03_01");	//���� ������ ����� ������ ��������� �����!
};


instance DIA_PARLAF_SATT(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 3;
	condition = dia_parlaf_satt_condition;
	information = dia_parlaf_satt_info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int dia_parlaf_satt_condition()
{
	if(((MIS_ENGOR_BRINGMEAT == LOG_SUCCESS) || Npc_IsDead(engor)) && Npc_KnowsInfo(hero,dia_parlaf_hallo))
	{
		return TRUE;
	};
};


var int dia_parlaf_satt_onetime;

func void dia_parlaf_satt_info()
{
	AI_Output(other,self,"DIA_Parlaf_SATT_15_00");	//��� ����������?
	if((DIA_PARLAF_SATT_ONETIME == FALSE) && (Npc_IsDead(engor) == FALSE))
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_01");	//����� ������ ������ �����. ��, ��� ����� � ����� ����.
		DIA_PARLAF_SATT_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_02");	//���� �������� - ��� ������������ ������������� ������ �������.
	};
};


instance DIA_PARLAF_PICKPOCKET(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 900;
	condition = dia_parlaf_pickpocket_condition;
	information = dia_parlaf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_parlaf_pickpocket_condition()
{
	return c_beklauen(34,12);
};

func void dia_parlaf_pickpocket_info()
{
	Info_ClearChoices(dia_parlaf_pickpocket);
	Info_AddChoice(dia_parlaf_pickpocket,DIALOG_BACK,dia_parlaf_pickpocket_back);
	Info_AddChoice(dia_parlaf_pickpocket,DIALOG_PICKPOCKET,dia_parlaf_pickpocket_doit);
};

func void dia_parlaf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_parlaf_pickpocket);
};

func void dia_parlaf_pickpocket_back()
{
	Info_ClearChoices(dia_parlaf_pickpocket);
};

