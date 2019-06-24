
var int brahim_showedmaps;

func void b_brahimnewmaps()
{
	if(BRAHIM_SHOWEDMAPS == TRUE)
	{
		AI_Output(self,other,"B_BrahimNewMaps_07_00");	//������ �������. � ������, ��� ����� ����������� ���-������ ���������� ��� ����.
	};
};


instance DIA_BRAHIM_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_exit_condition;
	information = dia_brahim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brahim_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_brahim_exit_info()
{
	b_brahimnewmaps();
	AI_StopProcessInfos(self);
};


instance DIA_BRAHIM_PICKPOCKET(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 900;
	condition = dia_brahim_pickpocket_condition;
	information = dia_brahim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_brahim_pickpocket_condition()
{
	return c_beklauen(15,15);
};

func void dia_brahim_pickpocket_info()
{
	Info_ClearChoices(dia_brahim_pickpocket);
	Info_AddChoice(dia_brahim_pickpocket,DIALOG_BACK,dia_brahim_pickpocket_back);
	Info_AddChoice(dia_brahim_pickpocket,DIALOG_PICKPOCKET,dia_brahim_pickpocket_doit);
};

func void dia_brahim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_brahim_pickpocket);
};

func void dia_brahim_pickpocket_back()
{
	Info_ClearChoices(dia_brahim_pickpocket);
};


instance DIA_BRAHIM_GREET(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 2;
	condition = dia_brahim_greet_condition;
	information = dia_brahim_greet_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_brahim_greet_condition()
{
	return TRUE;
};

func void dia_brahim_greet_info()
{
	AI_Output(other,self,"DIA_Brahim_GREET_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Brahim_GREET_07_01");	//���� ����� �������. � ����� ����� � ������ ��.
	AI_Output(self,other,"DIA_Brahim_GREET_07_02");	//��� ��� �� ������� �����, ��������, ���� ���������� ����� ������.
	AI_Output(self,other,"DIA_Brahim_GREET_07_03");	//��� ����� �������� � ����� �������, ���� �� ����� �� ���������.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"������� ������ ����� � ������� �� � ������.");
};


instance DIA_BRAHIM_BUY(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 9;
	condition = dia_brahim_buy_condition;
	information = dia_brahim_buy_info;
	permanent = TRUE;
	trade = TRUE;
	description = "������ ��� ���� �����.";
};


func int dia_brahim_buy_condition()
{
	if(Npc_KnowsInfo(hero,dia_brahim_greet))
	{
		return TRUE;
	};
};

func void dia_brahim_buy_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Brahim_BUY_15_00");	//������ ��� ���� �����.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_01");	//�� �� ������� ����� ���� � ���������.
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_02");	//������� ����� - ��� ����� �����, �������� ��� �����, ��������� � ��������, ������ �������.
	};
	BRAHIM_SHOWEDMAPS = TRUE;
};


instance DIA_BRAHIM_KAP3_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_kap3_exit_condition;
	information = dia_brahim_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brahim_kap3_exit_condition()
{
	if((KAPITEL >= 3) && (Npc_KnowsInfo(other,dia_brahim_kap3_first_exit) || (Npc_HasItems(other,itwr_shatteredgolem_mis) == 0)))
	{
		return TRUE;
	};
};

func void dia_brahim_kap3_exit_info()
{
	if(KAPITEL <= 4)
	{
		b_brahimnewmaps();
	};
	AI_StopProcessInfos(self);
};


instance DIA_BRAHIM_KAP3_FIRST_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_kap3_first_exit_condition;
	information = dia_brahim_kap3_first_exit_info;
	permanent = FALSE;
	description = DIALOG_ENDE;
};


func int dia_brahim_kap3_first_exit_condition()
{
	if((KAPITEL >= 3) && (Npc_HasItems(other,itwr_shatteredgolem_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_brahim_kap3_first_exit_info()
{
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_00");	//� ����, ��� ���� ������ ������ ������������ ����.
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_15_01");	//����� ������?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_02");	//��, �� ������ �����, ��� �� ������ ��� �����.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_03");	//� ���� ����� �����, ��� ��. �� ����������� ������ ����, ����� ����� ���������.
	Info_ClearChoices(dia_brahim_kap3_first_exit);
	Info_AddChoice(dia_brahim_kap3_first_exit,DIALOG_BACK,dia_brahim_kap3_first_exit_back);
	Info_AddChoice(dia_brahim_kap3_first_exit,"��� �� ���� ��� �����?",dia_brahim_kap3_first_exit_wheregetit);
	Info_AddChoice(dia_brahim_kap3_first_exit,"��� ��� �� �����?",dia_brahim_kap3_first_exit_content);
	Info_AddChoice(dia_brahim_kap3_first_exit,"������ �� �� ������� �� ����?",dia_brahim_kap3_first_exit_keepit);
};

func void dia_brahim_kap3_first_exit_back()
{
	Info_ClearChoices(dia_brahim_kap3_first_exit);
};

func void dia_brahim_kap3_first_exit_wheregetit()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00");	//��� �� ���� ��� �����?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01");	//��, � ����� �� � ������ ������ ����, ��� � ����� �������.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02");	//��������, ������ ����, ��������� ��.
};

func void dia_brahim_kap3_first_exit_content()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_Content_15_00");	//��� ��� �� �����?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01");	//������, ��� ����� �������� ��� ���-�� �����.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02");	//��, ������, �� �� ���, ��� �������� �������� ��� ��������������.
};

func void dia_brahim_kap3_first_exit_keepit()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//������ �� �� ������� �� ����?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01");	//� ������ �������, � �������, ����� � ��� ����� ���������, ����� ������.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02");	//����� ���� ���������� ��, ��� ��������.
};

