
instance DIA_GARWIG_EXIT(C_INFO)
{
	npc = nov_608_garwig;
	nr = 999;
	condition = dia_garwig_exit_condition;
	information = dia_garwig_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garwig_exit_condition()
{
	return TRUE;
};

func void dia_garwig_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GARWIG_WURST(C_INFO)
{
	npc = nov_608_garwig;
	nr = 3;
	condition = dia_garwig_wurst_condition;
	information = dia_garwig_wurst_info;
	permanent = FALSE;
	description = "������ �������?";
};


func int dia_garwig_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_garwig_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Garwig_Wurst_15_00");	//������ �������?
	AI_Output(self,other,"DIA_Garwig_Wurst_06_01");	//��, ��� ������. �������� ������� ����, ����.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
};


instance DIA_GARWIG_HELLO(C_INFO)
{
	npc = nov_608_garwig;
	nr = 3;
	condition = dia_garwig_hello_condition;
	information = dia_garwig_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_garwig_hello_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_garwig_hello_info()
{
	AI_Output(self,other,"DIA_Garwig_Hello_06_00");	//�� �������� � ����� �����, � ������� �� ����� ���� ������. �� ��������� �����?
	AI_Output(other,self,"DIA_Garwig_Hello_15_01");	//��, � ������ ��� ���� �����������.
	AI_Output(self,other,"DIA_Garwig_Hello_06_02");	//����� � ����� ���� ��������� ����� ���������. ��� ��� �����, ���� ���� ����������� ������.
};


instance DIA_GARWIG_ROOM(C_INFO)
{
	npc = nov_608_garwig;
	nr = 5;
	condition = dia_garwig_room_condition;
	information = dia_garwig_room_info;
	permanent = FALSE;
	description = "��� ��� �� �������?";
};


func int dia_garwig_room_condition()
{
	return TRUE;
};

func void dia_garwig_room_info()
{
	AI_Output(other,self,"DIA_Garwig_Room_15_00");	//��� ��� �� �������?
	AI_Output(self,other,"DIA_Garwig_Room_06_01");	//����� �������� ��������� �������� ���������.
	AI_Output(other,self,"DIA_Garwig_Room_15_02");	//����� ��������?
	AI_Output(self,other,"DIA_Garwig_Room_06_03");	//����� �������� ����� ������, � ����� ��� ����. ��� ����� ������ �������� ������ ������ �����, ����� �� ������� �����������.
};


instance DIA_GARWIG_HAMMER(C_INFO)
{
	npc = nov_608_garwig;
	nr = 99;
	condition = dia_garwig_hammer_condition;
	information = dia_garwig_hammer_info;
	permanent = TRUE;
	description = "�������� ��� �� ���� ������.";
};


func int dia_garwig_hammer_condition()
{
	if(Npc_KnowsInfo(other,dia_garwig_room))
	{
		return TRUE;
	};
};

func void dia_garwig_hammer_info()
{
	AI_Output(other,self,"DIA_Garwig_Hammer_15_00");	//�������� ��� �� ���� ������.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_01");	//��� ��������� ����� ������. ���� ������� ������ ����� ������� ��������� ��������.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_02");	//� ��������� �������� ���������, ��� �������� ������� ��� ��������. �� ���������� ��� ����� ���, ��� �����, � ������ ��� ������ ����������� � ��� �������� ����.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_03");	//� ������ ������ �� �����, ����� �������� �� ����� ������� � ������� ��� ����� ������� ������ ������ ������.
};


instance DIA_GARWIG_SHIELD(C_INFO)
{
	npc = nov_608_garwig;
	nr = 98;
	condition = dia_garwig_shield_condition;
	information = dia_garwig_shield_info;
	permanent = FALSE;
	description = "�������� ��� �� ���� ����.";
};


func int dia_garwig_shield_condition()
{
	if(Npc_KnowsInfo(other,dia_garwig_room))
	{
		return TRUE;
	};
};

func void dia_garwig_shield_info()
{
	AI_Output(other,self,"DIA_Garwig_Shield_15_00");	//�������� ��� �� ���� ����.
	AI_Output(self,other,"DIA_Garwig_Shield_06_01");	//��� ���� ����������� �������� � ����� �� ����� ��������.
	AI_Output(self,other,"DIA_Garwig_Shield_06_02");	//�� ���� ����� ���� �� ������  ������ �������������� - �������, �� ������� ��� �� �����.
};


instance DIA_GARWIG_AUGE(C_INFO)
{
	npc = nov_608_garwig;
	nr = 4;
	condition = dia_garwig_auge_condition;
	information = dia_garwig_auge_info;
	permanent = FALSE;
	description = "� ���� ������ ���� ��������� �����?";
};


func int dia_garwig_auge_condition()
{
	if(Npc_KnowsInfo(other,dia_garwig_room) && (KAPITEL <= 2))
	{
		return TRUE;
	};
};

func void dia_garwig_auge_info()
{
	AI_Output(other,self,"DIA_Garwig_Auge_15_00");	//� ���� ������ ���� ��������� �����?
	AI_Output(self,other,"DIA_Garwig_Auge_06_01");	//������� ���. ��� �� �������� �����. ����� �� �����, ��� �������� ���� ������������ ��������.
};


instance DIA_GARWIG_SLEEP(C_INFO)
{
	npc = nov_608_garwig;
	nr = 23;
	condition = dia_garwig_sleep_condition;
	information = dia_garwig_sleep_info;
	permanent = TRUE;
	description = "��� �� ������� �����?";
};


func int dia_garwig_sleep_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_garwig_sleep_info()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Garwig_SLEEP_06_01");	//� ����� ��������� ����������.
	Info_ClearChoices(dia_garwig_sleep);
	Info_AddChoice(dia_garwig_sleep,DIALOG_BACK,dia_garwig_sleep_back);
	Info_AddChoice(dia_garwig_sleep,"��� ���� � ����� ���� ���������?",dia_garwig_sleep_exchange);
	Info_AddChoice(dia_garwig_sleep,"������ ��� ��������� ����������?",dia_garwig_sleep_thief);
	Info_AddChoice(dia_garwig_sleep,"�� �����-������ �����?",dia_garwig_sleep_never);
};

func void dia_garwig_sleep_back()
{
	Info_ClearChoices(dia_garwig_sleep);
};

func void dia_garwig_sleep_exchange()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_EXCHANGE_15_00");	//��� ���� � ����� ���� ���������?
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_01");	//��� ���������? ���� ������� ���� �������� ����, ���������? ���, � ���� ���!
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_02");	//�� � ������ ��� ���������. ����� ����� �����, ��� � ��� ������������� ��� ����� � ��� � ���� �������������� ���� ����������. ��� � ������� �����.
};

func void dia_garwig_sleep_thief()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_THIEF_15_00");	//������ ��� ��������� ����������? ���� ������� ��������, ��� ��� ����� ���� ��������?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_01");	//��� �� �������� �����. � ���� �� ��� ����?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_02");	//������ ��, ��� ������ ������, ����� ������� � ���������. � �� � ���� �� �������� �������� ����� ����� ���� ��������� �� �����.
};

func void dia_garwig_sleep_never()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_NEVER_15_00");	//�� �����-������ �����?
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_01");	//��� �� ��������� ���������. ������� ��, � ������� �� ����. ��� ����� ������ ��� ���� ���������� ��� ���.
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_02");	//��� �� ����� ��� �� � ��������� ��������� ����������� ������?
	Info_ClearChoices(dia_garwig_sleep);
	Info_AddChoice(dia_garwig_sleep,"�� ������������� ������� �� �����?",dia_garwig_sleep_again);
};

func void dia_garwig_sleep_again()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_AGAIN_15_00");	//�� ������������� ������� �� �����?
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_01");	//���. ���� ����� ������, �� �������� ���� ���������.
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_02");	//�� � �� ���������, ���� ����� ���� ��� ���� � ������������, � � ������� �� �����.
};


instance DIA_GARWIG_THIEF(C_INFO)
{
	npc = nov_608_garwig;
	nr = 2;
	condition = dia_garwig_thief_condition;
	information = dia_garwig_thief_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garwig_thief_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_HasItems(hero,holy_hammer_mis) == 1))
	{
		return TRUE;
	};
};

func void dia_garwig_thief_info()
{
	if(HAMMER_TAKEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_00");	//(������������) ���! �� �������� �� ������ ���� � ����, �� � ���� ���������!
		AI_Output(self,other,"DIA_Garwig_THIEF_06_01");	//�� ����������� �� ��� ������������. �, �������� ������� - ����� ��� ���� �����!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_02");	//(� ��������) ����� �����! ��� ��� ����� ���������?
		AI_Output(self,other,"DIA_Garwig_THIEF_06_03");	//� �������� ���������. ����� ������� ����!
	};
};


instance DIA_GARWIG_ABGEBEN(C_INFO)
{
	npc = nov_608_garwig;
	nr = 2;
	condition = dia_garwig_abgeben_condition;
	information = dia_garwig_abgeben_info;
	permanent = TRUE;
	description = "� ������ ����� �����.";
};


func int dia_garwig_abgeben_condition()
{
	if(Npc_HasItems(other,holy_hammer_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_garwig_abgeben_info()
{
	AI_Output(other,self,"DIA_Garwig_Abgeben_15_00");	//� ������ ����� �����.
	if(HAMMER_TAKEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_01");	//�� �� ������ ���!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_02");	//��� ��� �� ���� ���...
	};
	AI_Output(self,other,"DIA_Garwig_Abgeben_06_03");	//�� � �� ������ ������ ����. ����� ����� ������ ����, � �� �������� ����������� ����!
	b_giveinvitems(other,self,holy_hammer_mis,1);
	HAMMER_TAKEN = FALSE;
};


instance DIA_GARWIG_PICKPOCKET(C_INFO)
{
	npc = nov_608_garwig;
	nr = 900;
	condition = dia_garwig_pickpocket_condition;
	information = dia_garwig_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_garwig_pickpocket_condition()
{
	return c_beklauen(52,80);
};

func void dia_garwig_pickpocket_info()
{
	Info_ClearChoices(dia_garwig_pickpocket);
	Info_AddChoice(dia_garwig_pickpocket,DIALOG_BACK,dia_garwig_pickpocket_back);
	Info_AddChoice(dia_garwig_pickpocket,DIALOG_PICKPOCKET,dia_garwig_pickpocket_doit);
};

func void dia_garwig_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_garwig_pickpocket);
};

func void dia_garwig_pickpocket_back()
{
	Info_ClearChoices(dia_garwig_pickpocket);
};

