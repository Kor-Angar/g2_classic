
instance DIA_MORTIS_EXIT(C_INFO)
{
	npc = mil_314_mortis;
	nr = 999;
	condition = dia_mortis_exit_condition;
	information = dia_mortis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mortis_exit_condition()
{
	return TRUE;
};

func void dia_mortis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MORTIS_HALLO(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_hallo_condition;
	information = dia_mortis_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mortis_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && ((Npc_KnowsInfo(other,dia_peck_found_peck) == FALSE) && (KAPITEL < 3)))
	{
		return TRUE;
	};
};

func void dia_mortis_hallo_info()
{
	AI_Output(self,other,"DIA_Mortis_Hallo_13_00");	//��� ���� �����? ���� ����� ���. � ��� ���� �� ������ �� ��������. ������ �����.
};


instance DIA_MORTIS_WAFFE(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_waffe_condition;
	information = dia_mortis_waffe_info;
	permanent = FALSE;
	description = "� ��� ���?";
};


func int dia_mortis_waffe_condition()
{
	if((MIS_ANDRE_PECK == LOG_RUNNING) && ((Npc_KnowsInfo(other,dia_peck_found_peck) == FALSE) && (KAPITEL < 3)))
	{
		return TRUE;
	};
};

func void dia_mortis_waffe_info()
{
	AI_Output(other,self,"DIA_Mortis_Waffe_15_00");	//� ��� ���?
	AI_Output(self,other,"DIA_Mortis_Waffe_13_01");	//�� ������ ��� ������� � ���� ����? ��, ����� ����� ����������.
	AI_Output(self,other,"DIA_Mortis_Waffe_13_02");	//��� ���� � ����� ��� �����. ����� ���������, ��� �� ���������� ���� � ������� ������.
};


instance DIA_MORTIS_PAKET(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_paket_condition;
	information = dia_mortis_paket_info;
	permanent = FALSE;
	description = "�� ���-������ ������ � ���� ������?";
};


func int dia_mortis_paket_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_mortis_paket_info()
{
	AI_Output(other,self,"DIA_Mortis_Paket_15_00");	//�� ���-������ ������ � ���� ������?
	AI_Output(self,other,"DIA_Mortis_Paket_13_01");	//��... ��������� ���, ����� � ��� � �������� ������, � ������, ��� ������ ������� �� ���� � �����-�� ������.
	AI_Output(other,self,"DIA_Mortis_Paket_15_02");	//��� ��� �� ������?
	AI_Output(self,other,"DIA_Mortis_Paket_13_03");	//������� �� ����. �� �� ������, ��� ����� �������� ����� ��� �������� ����� - � ����� ��� ����� ����� ��� ������ ����.
	b_logentry(TOPIC_WAREHOUSE,"������ ������, ��� ���������� ������ � ���-�� ��� ������������� � ���� � �������� �������. ��� ���������, ��� ����� ������� ���.");
};


instance DIA_MORTIS_REDLIGHT(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_redlight_condition;
	information = dia_mortis_redlight_info;
	permanent = FALSE;
	description = "�� ������ ������ �������� �������?";
};


func int dia_mortis_redlight_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_mortis_redlight_info()
{
	AI_Output(other,self,"DIA_Mortis_Redlight_15_00");	//�� ������ ������ �������� �������? � ���� ����� ����, ��� ������� �������� �����.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_01");	//��-�... ����� ��� �� �������� �������������, � ��� �� ����� ������ �� ������ ���������� ���������.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_02");	//���� �� ������ ��������� ���-���� ���, ���� �����... ���, �� ������ ����� ���� �������.
	AI_Output(other,self,"DIA_Mortis_Redlight_15_03");	//������, � ��� ������?
	AI_Output(self,other,"DIA_Mortis_Redlight_13_04");	//����� � ������� - ��������, ����� ������ ����� ��� �������. ���� ���� ������ ������� ���-���� ������, �� �� ������� ��� ���.
	b_logentry(TOPIC_REDLIGHT,"������ ��������, ��� ���� � ���� ������ �������� ����� � �������� ��������, ��� ����� ����� ��� �������. ����� ����� �������� �������� � ������� ��� �������.");
};


instance DIA_MORTIS_CANTEACH(C_INFO)
{
	npc = mil_314_mortis;
	nr = 5;
	condition = dia_mortis_canteach_condition;
	information = dia_mortis_canteach_info;
	permanent = TRUE;
	description = "� ���� ����� �������.";
};


func int dia_mortis_canteach_condition()
{
	if(MORTIS_TEACHSTR == FALSE)
	{
		return TRUE;
	};
};

func void dia_mortis_canteach_info()
{
	AI_Output(other,self,"DIA_Mortis_CanTeach_15_00");	//� ���� ����� �������.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_01");	//�������. ���� � ���� ���������� �����, � ���� ������������� ����.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"��������� ������ ����� ������ ��� �������� ��� ����.");
		MORTIS_TEACHSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_02");	//�������, ������. �� ���� �� �� ������� ����� �� ��� ��� ���������, � �� ���� �������� ����.
	};
};


instance DIA_MORTIS_TEACH(C_INFO)
{
	npc = mil_314_mortis;
	nr = 100;
	condition = dia_mortis_teach_condition;
	information = dia_mortis_teach_info;
	permanent = TRUE;
	description = "� ���� ����� �������.";
};


var int dia_mortis_teach_permanent;

func int dia_mortis_teach_condition()
{
	if((MORTIS_TEACHSTR == TRUE) && (DIA_MORTIS_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_mortis_teach_info()
{
	AI_Output(other,self,"DIA_Mortis_Teach_15_00");	//� ���� ����� �������.
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};

func void dia_mortis_teach_back()
{
	if(other.attribute[ATR_STRENGTH] >= 60)
	{
		AI_Output(self,other,"DIA_Mortis_Teach_13_00");	//�� � ��� ���������� �����. ���� �� �� ���������� � ��������, ����� ���� ������� �������.
		DIA_MORTIS_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_mortis_teach);
};

func void dia_mortis_teach_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,60);
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};

func void dia_mortis_teach_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,60);
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};


instance DIA_MORTIS_PICKPOCKET(C_INFO)
{
	npc = mil_314_mortis;
	nr = 900;
	condition = dia_mortis_pickpocket_condition;
	information = dia_mortis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_mortis_pickpocket_condition()
{
	return c_beklauen(38,60);
};

func void dia_mortis_pickpocket_info()
{
	Info_ClearChoices(dia_mortis_pickpocket);
	Info_AddChoice(dia_mortis_pickpocket,DIALOG_BACK,dia_mortis_pickpocket_back);
	Info_AddChoice(dia_mortis_pickpocket,DIALOG_PICKPOCKET,dia_mortis_pickpocket_doit);
};

func void dia_mortis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mortis_pickpocket);
};

func void dia_mortis_pickpocket_back()
{
	Info_ClearChoices(dia_mortis_pickpocket);
};

