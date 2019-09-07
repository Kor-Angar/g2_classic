
instance DIA_MARIA_EXIT(C_INFO)
{
	npc = bau_910_maria;
	nr = 999;
	condition = dia_maria_exit_condition;
	information = dia_maria_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maria_exit_condition()
{
	return TRUE;
};

func void dia_maria_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARIA_HALLO(C_INFO)
{
	npc = bau_910_maria;
	nr = 1;
	condition = dia_maria_hallo_condition;
	information = dia_maria_hallo_info;
	permanent = FALSE;
	description = "��� ��?";
};


func int dia_maria_hallo_condition()
{
	return TRUE;
};

func void dia_maria_hallo_info()
{
	AI_Output(other,self,"DIA_Maria_Hallo_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Maria_Hallo_17_01");	//� ���� �����, �����.
	AI_Output(self,other,"DIA_Maria_Hallo_17_02");	//��� ���� ����� �����?
};


instance DIA_MARIA_UMSEHEN(C_INFO)
{
	npc = bau_910_maria;
	nr = 2;
	condition = dia_maria_umsehen_condition;
	information = dia_maria_umsehen_info;
	permanent = FALSE;
	description = "� ������ ����� ����������, ��� �� ������...";
};


func int dia_maria_umsehen_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_umsehen_info()
{
	AI_Output(other,self,"DIA_Maria_Umsehen_15_00");	//� ������ ����� ����������, ��� �� ������...
	AI_Output(self,other,"DIA_Maria_Umsehen_17_01");	//����� ������� ����� ����� �� �����, ���� � ���� ����� �� �������!
	AI_Output(self,other,"DIA_Maria_Umsehen_17_02");	//��� ��� � ����� ����.
};


instance DIA_MARIA_SOELDNER(C_INFO)
{
	npc = bau_910_maria;
	nr = 3;
	condition = dia_maria_soeldner_condition;
	information = dia_maria_soeldner_info;
	permanent = FALSE;
	description = "���� ��������� ��������?";
};


func int dia_maria_soeldner_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_umsehen))
	{
		return TRUE;
	};
};

func void dia_maria_soeldner_info()
{
	AI_Output(other,self,"DIA_Maria_Soeldner_15_00");	//���� ��������� ��������?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_01");	//��, ������ � ���, ��� � ������ ��� ������� - � ��� ���, ��� �� �����, ���� ����� ����� ����������� ����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_02");	//��. ��, ���� � ��� ��� ��� ������ ��������, ���� �� �� ����� ����� ����������.
	};
	AI_Output(self,other,"DIA_Maria_Soeldner_17_03");	//����� �� ��� ���� ���� �� ����, ���� ��������� ��������� ��������� �� ������ � ������� ���.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_04");	//��� �������� ������� ����� ������. � ���� ����. � ������ �� ������ ��� ������.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_05");	//��������� �� ��� ���� ��������, ��� ����� �����.
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_06");	//������ �� ����� ���� �������, ������. � ����, ��� �� ��� �� �����.
	};
};


instance DIA_MARIA_MISSION(C_INFO)
{
	npc = bau_910_maria;
	nr = 4;
	condition = dia_maria_mission_condition;
	information = dia_maria_mission_info;
	permanent = FALSE;
	description = "� ��� ��� ������ � ����?";
};


func int dia_maria_mission_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_soeldner) && (MIS_MARIA_BRINGPLATE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_maria_mission_info()
{
	AI_Output(other,self,"DIA_Maria_Mission_15_00");	//� ��� ��� ������ � ����?
	AI_Output(self,other,"DIA_Maria_Mission_17_01");	//� �������� ������ � �������. ��� ���� ������� ��� ��������� �������. ������� �������.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Mission_17_02");	//�������, ��� ������ ������� � ������� � ������-������ ���������� ���������.
	};
	MIS_MARIA_BRINGPLATE = LOG_RUNNING;
};


instance DIA_MARIA_BRINGPLATE(C_INFO)
{
	npc = bau_910_maria;
	nr = 5;
	condition = dia_maria_bringplate_condition;
	information = dia_maria_bringplate_info;
	permanent = FALSE;
	description = "� ������ ������� �������. ��� �� ����?";
};


func int dia_maria_bringplate_condition()
{
	if(Npc_HasItems(other,itmi_mariasgoldplate) > 0)
	{
		return TRUE;
	};
};

func void dia_maria_bringplate_info()
{
	b_giveinvitems(other,self,itmi_mariasgoldplate,1);
	AI_Output(other,self,"DIA_Maria_BringPlate_15_00");	//� ������ ������� �������. ��� �� ����?
	AI_Output(self,other,"DIA_Maria_BringPlate_17_01");	//��! ��� ���! �������� ������� ����!
	MIS_MARIA_BRINGPLATE = LOG_SUCCESS;
	b_giveplayerxp(XP_MARIA_TELLER);
};


var int maria_belohnung;

instance DIA_MARIA_BELOHNUNG(C_INFO)
{
	npc = bau_910_maria;
	nr = 6;
	condition = dia_maria_belohnung_condition;
	information = dia_maria_belohnung_info;
	permanent = TRUE;
	description = "� ��� ������ ����� ��������������?";
};


func int dia_maria_belohnung_condition()
{
	if((MIS_MARIA_BRINGPLATE == LOG_SUCCESS) && (MARIA_BELOHNUNG == FALSE))
	{
		return TRUE;
	};
};

func void dia_maria_belohnung_info()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_15_00");	//� ��� ������ ����� ��������������?
	if((other.guild == GIL_SLD) || Npc_KnowsInfo(other,dia_onar_howmuch))
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_01");	//�� ��������� ��������� �� ����� ����, ��?
		AI_Output(other,self,"DIA_Maria_Belohnung_15_02");	//�����.
		AI_Output(self,other,"DIA_Maria_Belohnung_17_03");	//������� ��� ��� ������ ����?
		b_say_gold(other,self,SOLD);
		AI_Output(self,other,"DIA_Maria_Belohnung_17_04");	//����� ������������. ��� � ���� � �����, ����� �� ������ ���� ������.
		AI_Output(other,self,"DIA_Maria_Belohnung_15_05");	//�� �������, �� ���������?
		AI_Output(self,other,"DIA_Maria_Belohnung_17_06");	//�� �����, ��� �����, ���� �� ���������. ������ ���.
		MARIA_MEHRGOLD = TRUE;
		MARIA_BELOHNUNG = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_07");	//�� ������ ����� ��������� �� ���� �����?
		Info_ClearChoices(dia_maria_belohnung);
		Info_AddChoice(dia_maria_belohnung,"������-�� ���.",dia_maria_belohnung_gold);
		Info_AddChoice(dia_maria_belohnung,"��.",dia_maria_belohnung_sold);
	}
	else
	{
		b_giveinvitems(self,other,itmi_gold,50);
		MARIA_BELOHNUNG = TRUE;
		AI_Output(self,other,"DIA_Maria_Belohnung_17_08");	//���, ������ ���. �� ��������.
	};
};

func void dia_maria_belohnung_gold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_Gold_15_00");	//������-�� ���.
	b_giveinvitems(self,other,itmi_gold,50);
	MARIA_BELOHNUNG = TRUE;
	AI_Output(self,other,"DIA_Maria_Belohnung_Gold_17_01");	//����� ������ ��� ������ � �������� �������. �� �������� ���.
	Info_ClearChoices(dia_maria_belohnung);
};

func void dia_maria_belohnung_sold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_SOLD_15_00");	//��.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_01");	//������, ���� �� ������ �������� �����, � ��������, ����� �� ������� ������� ���������.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_02");	//����� �� ���, ����� �������� ������ ��������� � ���� �����.
	Info_ClearChoices(dia_maria_belohnung);
};


instance DIA_MARIA_ABOUTONAR(C_INFO)
{
	npc = bau_910_maria;
	nr = 7;
	condition = dia_maria_aboutonar_condition;
	information = dia_maria_aboutonar_info;
	permanent = FALSE;
	description = "�������� ��� �� �����.";
};


func int dia_maria_aboutonar_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_aboutonar_info()
{
	AI_Output(other,self,"DIA_Maria_AboutOnar_15_00");	//�������� ��� �� �����.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_01");	//�� ������� �������. ������� ��������� � ����� ���������������, �� � ��� � ���� ���� ���� ����������.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_02");	//� �������� ������ ����: '������ �� ���������� �������� �� ������ ��� � ����� ����������'?
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_03");	//'������ �� ���-������', - ������� �.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_04");	//� �� ����� ���������. � ������ ��� �������, ��� �� ����� �����.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_05");	//��, ���� ��������, �� ���� ������������� �����, ����� ���?
};


instance DIA_MARIA_PERM(C_INFO)
{
	npc = bau_910_maria;
	nr = 8;
	condition = dia_maria_perm_condition;
	information = dia_maria_perm_info;
	permanent = FALSE;
	description = "��� ����������� ���� � ��������� �����?";
};


func int dia_maria_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_perm_info()
{
	AI_Output(other,self,"DIA_Maria_PERM_15_00");	//��� ����������� ���� � ��������� �����?
	if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_01");	//���� ������ ��������.
		AI_Output(self,other,"DIA_Maria_PERM_17_02");	//������� �� ��������, ��� ��� ���������� ������� �� ���� �����, �� ��� ������ ����, � ������ ��������.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_03");	//������� ������ ���� ��������� ���� �����. � ����� �����, ��� ��������.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_04");	//� ��� ���, ��� ����� ��������� ���� ������, ����� ����������� ���������.
	};
};


instance DIA_MARIA_PICKPOCKET(C_INFO)
{
	npc = bau_910_maria;
	nr = 900;
	condition = dia_maria_pickpocket_condition;
	information = dia_maria_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_maria_pickpocket_condition()
{
	return c_beklauen(60,110);
};

func void dia_maria_pickpocket_info()
{
	Info_ClearChoices(dia_maria_pickpocket);
	Info_AddChoice(dia_maria_pickpocket,DIALOG_BACK,dia_maria_pickpocket_back);
	Info_AddChoice(dia_maria_pickpocket,DIALOG_PICKPOCKET,dia_maria_pickpocket_doit);
};

func void dia_maria_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_maria_pickpocket);
};

func void dia_maria_pickpocket_back()
{
	Info_ClearChoices(dia_maria_pickpocket);
};

