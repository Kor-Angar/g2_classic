
instance DIA_FENIA_EXIT(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 999;
	condition = dia_fenia_exit_condition;
	information = dia_fenia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fenia_exit_condition()
{
	return TRUE;
};

func void dia_fenia_exit_info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Fenia_EXIT_17_00");	//�����������, ������ �������.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fenia_EXIT_17_01");	//������� ���� ������, �, �������������� ���.
	};
	AI_StopProcessInfos(self);
};


instance DIA_FENIA_PICKPOCKET(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 900;
	condition = dia_fenia_pickpocket_condition;
	information = dia_fenia_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_fenia_pickpocket_condition()
{
	return c_beklauen(50,75);
};

func void dia_fenia_pickpocket_info()
{
	Info_ClearChoices(dia_fenia_pickpocket);
	Info_AddChoice(dia_fenia_pickpocket,DIALOG_BACK,dia_fenia_pickpocket_back);
	Info_AddChoice(dia_fenia_pickpocket,DIALOG_PICKPOCKET,dia_fenia_pickpocket_doit);
};

func void dia_fenia_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fenia_pickpocket);
};

func void dia_fenia_pickpocket_back()
{
	Info_ClearChoices(dia_fenia_pickpocket);
};


instance DIA_FENIA_HALLO(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 3;
	condition = dia_fenia_hallo_condition;
	information = dia_fenia_hallo_info;
	important = TRUE;
};


func int dia_fenia_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_fenia_hallo_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Fenia_Hallo_17_00");	//�� ��������� ��������. ����� �� ����, ��?
		AI_Output(other,self,"DIA_Fenia_Hallo_15_01");	//������� �����, � �� ������.
	};
	AI_Output(self,other,"DIA_Fenia_Hallo_17_02");	//������� �������, �� �����. � ���� �� ������� ���, ��� ���� �����!
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"���� ������� ���� �� ���� � ������.");
};


instance DIA_FENIA_HANDELN(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 10;
	condition = dia_fenia_handeln_condition;
	information = dia_fenia_handeln_info;
	permanent = TRUE;
	trade = TRUE;
	description = "������ ��� ���� ������.";
};


func int dia_fenia_handeln_condition()
{
	if(Npc_KnowsInfo(hero,dia_fenia_hallo))
	{
		return TRUE;
	};
};

func void dia_fenia_handeln_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Fenia_HANDELN_15_00");	//������ ��� ���� ������.
};


instance DIA_FENIA_INFOS(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 10;
	condition = dia_fenia_infos_condition;
	information = dia_fenia_infos_info;
	permanent = FALSE;
	description = "�� �������, � ���� ���� ���, ��� ��� �����. ��� �������� ����������?";
};


func int dia_fenia_infos_condition()
{
	if(Npc_KnowsInfo(hero,dia_fenia_hallo))
	{
		return TRUE;
	};
};

func void dia_fenia_infos_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_15_00");	//�� �������, � ���� ���� ���, ��� ��� �����. ��� �������� ����������?
	AI_Output(self,other,"DIA_Fenia_Infos_17_01");	//�������. ��� �� ������ ������?
};


instance DIA_FENIA_MORETRADERS(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 11;
	condition = dia_fenia_moretraders_condition;
	information = dia_fenia_moretraders_info;
	permanent = FALSE;
	description = "���� �����, � �����, ������ ��������?";
};


func int dia_fenia_moretraders_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos))
	{
		return TRUE;
	};
};

func void dia_fenia_moretraders_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_haendler_15_00");	//���� �����, � �����, ������ ��������?
	AI_Output(self,other,"DIA_Fenia_Infos_haendler_17_01");	//���� �� ������� ������ ����� �������, �� ������� �������, ����� ����. �� ������� �����.
	AI_Output(self,other,"DIA_Fenia_Infos_haendler_17_02");	//� ���� ������� � ������ �������, ��� ����� �������, ���������.
};


instance DIA_FENIA_OV(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 13;
	condition = dia_fenia_ov_condition;
	information = dia_fenia_ov_info;
	permanent = FALSE;
	description = "�� ������ ����-������ �� �������� ��������?";
};


func int dia_fenia_ov_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_fenia_ov_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_oberesViertel_15_00");	//�� ������ ����-������ �� �������� ��������?
	AI_Output(self,other,"DIA_Fenia_Infos_oberesViertel_17_01");	//(�������) ���� �� � ����-������ ��� �����, � �� ����� �� ������, �����.
};


instance DIA_FENIA_INTERESTING(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 14;
	condition = dia_fenia_interesting_condition;
	information = dia_fenia_interesting_info;
	permanent = FALSE;
	description = "�� ��� ���������� ����� �������� �������� � �����?";
};


func int dia_fenia_interesting_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos))
	{
		return TRUE;
	};
};

func void dia_fenia_interesting_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_interessantes_15_00");	//�� ��� ���������� ����� �������� �������� � �����?
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_01");	//��... ���� �� ����� �����������, ��� � ����� ������� � �������. ��� ������ ���-������ ����������.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_02");	//�� ���� �� ���������� ���. ������, ������� ����� ������ ����, ����������� ��������� ���� �������� � ����.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_03");	//����� ����, � ����� ����� ������� ������� ���������. ����������� ������� ������. �� ��� ������������� ����� ����������.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_04");	//�� ������� ��, ���� ������� ����� ����� �������, � ����� �������� ��� ������� ������.
};


instance DIA_FENIA_AUFREGEND(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 15;
	condition = dia_fenia_aufregend_condition;
	information = dia_fenia_aufregend_info;
	permanent = FALSE;
	description = "������ ����������� �� ����?";
};


func int dia_fenia_aufregend_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos))
	{
		return TRUE;
	};
};

func void dia_fenia_aufregend_info()
{
	AI_Output(other,self,"DIA_Fenia_Add_15_00");	//������ ����������� �� ����?
	AI_Output(self,other,"DIA_Fenia_Add_17_01");	//����. � ������ �������.
	AI_Output(self,other,"DIA_Fenia_Add_17_02");	//����� �������� ���. ��, ������, ����� ��� ���-�� � ������ ����� ������.
	AI_Output(self,other,"DIA_Fenia_Add_17_03");	//�������, ��� ������ ��������� ������� ������� ������.
	AI_Output(self,other,"DIA_Fenia_Add_17_04");	//��� ������� ������� �� ��� - �� ������� � ���� � ��� �����.
};

