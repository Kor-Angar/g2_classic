
instance DIA_NOV_3_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_nov_3_exit_condition;
	information = dia_nov_3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nov_3_exit_condition()
{
	return TRUE;
};

func void dia_nov_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_3_FEGEN(C_INFO)
{
	nr = 2;
	condition = dia_nov_3_fegen_condition;
	information = dia_nov_3_fegen_info;
	permanent = TRUE;
	description = "��� ����� ������, ����� �������� ����� �����������.";
};


var int feger1_permanent;
var int feger2_permanent;

func int dia_nov_3_fegen_condition()
{
	if((KAPITEL == 1) && (MIS_KLOSTERARBEIT == LOG_RUNNING) && (NOV_HELFER < 4))
	{
		return TRUE;
	};
};

func void dia_nov_3_fegen_info()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_15_00");	//��� ����� ������, ����� �������� ����� �����������.
	if(Hlp_GetInstanceID(feger1) == Hlp_GetInstanceID(self))
	{
		if((NOV_HELFER < 1) && (FEGER1_PERMANENT == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_01");	//����� �� ����� �������� ����, ��? ������, � ������ ����, �� ������ �� ������ ����� ��� ����-������ ��� � ����.
			b_logentry(TOPIC_PARLANFEGEN,"���������, ����������� ������, ������� ���, ���� � ����� ����� ��� ������ ����������, �������� ������ �������� �������.");
		}
		else if((NOV_HELFER >= 1) && (FEGER1_PERMANENT == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_02");	//� ������������, ��� ����� ������ ����?
			AI_Output(other,self,"DIA_NOV_3_Fegen_15_03");	//���, � ��� ����� ���������.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_04");	//�����, �� ����!
			NOV_HELFER = NOV_HELFER + 1;
			FEGER1_PERMANENT = TRUE;
			b_giveplayerxp(XP_FEGER);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			b_logentry(TOPIC_PARLANFEGEN,"��������� �� ������� ������� ��� ��������� �������.");
		}
		else if(FEGER1_PERMANENT == TRUE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_05");	//��������, ����, � ��� ������� ����. ������ ������� �������.
		};
	};
	if(Hlp_GetInstanceID(feger2) == Hlp_GetInstanceID(self))
	{
		if(FEGER2_PERMANENT == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_08");	//�������, � ������. ��, ����������, ������ ������������ ���� �����. ������� �� - ���, ������ � - ����.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_09");	//� ����� ����� 50 ������� �����, ��� ����� ��������� �� �������.
			b_logentry(TOPIC_PARLANFEGEN,"��������� � ������ ������� ���, ���� � ��� ��� 50 ������� �����.");
			Info_ClearChoices(dia_nov_3_fegen);
			Info_AddChoice(dia_nov_3_fegen,"����� ����, �����...",dia_nov_3_fegen_nein);
			if(Npc_HasItems(other,itmi_gold) >= 50)
			{
				Info_AddChoice(dia_nov_3_fegen,"������, � �������.",dia_nov_3_fegen_ja);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_06");	//� �� ��� ����������. �� ����� ���, � ������ ����.
		};
	};
	if((Hlp_GetInstanceID(feger1) != Hlp_GetInstanceID(self)) && (Hlp_GetInstanceID(feger2) != Hlp_GetInstanceID(self)))
	{
		AI_Output(self,other,"DIA_NOV_3_Fegen_03_07");	//������ �� ���� - � ���� ��� ���������� �������. ����� ����-������ ���.
	};
};

func void dia_nov_3_fegen_nein()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Nein_15_00");	//�������� �����, ������ � �� ���� ��������� ���� ����� �������.
	Info_ClearChoices(dia_nov_3_fegen);
};

func void dia_nov_3_fegen_ja()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Ja_15_00");	//������, � �������.
	AI_Output(self,other,"DIA_NOV_3_Fegen_Ja_03_01");	//������, ����� � ����� ����������.
	b_giveinvitems(other,self,itmi_gold,50);
	NOV_HELFER = NOV_HELFER + 1;
	b_giveplayerxp(XP_FEGER);
	FEGER2_PERMANENT = TRUE;
	Info_ClearChoices(dia_nov_3_fegen);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FEGEN");
	b_logentry(TOPIC_PARLANFEGEN,"��������� � ������ ������� ��� ��������� �������.");
};


instance DIA_NOV_3_WURST(C_INFO)
{
	nr = 3;
	condition = dia_nov_3_wurst_condition;
	information = dia_nov_3_wurst_info;
	permanent = TRUE;
	description = "������ �������?";
};


func int dia_nov_3_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_nov_3_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_NOV_3_Wurst_15_00");	//�� �� ������ �������?
	AI_Output(self,other,"DIA_NOV_3_Wurst_03_01");	//�������, ����� �� ����. ��� �� ��������� �� ����� �������.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
};


instance DIA_NOV_3_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_nov_3_join_condition;
	information = dia_nov_3_join_info;
	permanent = TRUE;
	description = "� ���� ����� �����!";
};


func int dia_nov_3_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_nov_3_join_info()
{
	AI_Output(other,self,"DIA_NOV_3_JOIN_15_00");	//� ���� ����� �����!
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_01");	//����� ����� ��� ����������. �� ������ �������� �� ��� ���������� ���������� � �������� ���� ���� ��������� � ���� ����.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_02");	//����� ����� ����� ���� - ��� ���������� �����, � �� ����� ���������.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_03");	//�� ������ �������� ���������, � �����, ��������, � ���� �������� ����.
};


instance DIA_NOV_3_PEOPLE(C_INFO)
{
	nr = 5;
	condition = dia_nov_3_people_condition;
	information = dia_nov_3_people_info;
	permanent = TRUE;
	description = "��� ����������� ���� ���������?";
};


func int dia_nov_3_people_condition()
{
	return TRUE;
};

func void dia_nov_3_people_info()
{
	AI_Output(other,self,"DIA_NOV_3_PEOPLE_15_00");	//��� ����������� ���� ���������?
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_01");	//��, ����������, ������ ����� ����� ����. ��, � ���� �������, ����������� ������ �����, ��������� �� ���� ����� ����������� �����.
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_02");	//�� �� ��� ���� ����������� �������� ������. ��� ������ ����� ����� �� �����, �� ��������� �� ������� �����������.
};


instance DIA_NOV_3_LOCATION(C_INFO)
{
	nr = 6;
	condition = dia_nov_3_location_condition;
	information = dia_nov_3_location_info;
	permanent = TRUE;
	description = "��� �� ������ ������� ��� �� ���� ���������?";
};


func int dia_nov_3_location_condition()
{
	return TRUE;
};

func void dia_nov_3_location_info()
{
	AI_Output(other,self,"DIA_NOV_3_LOCATION_15_00");	//��� �� ������ ������� ��� �� ���� ���������?
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_01");	//�� ���� ������ �������� ���� ��������. �� ���������� ���� � ������ ����.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_02");	//����� ���� ����������, �� ���� � ��� �������� ������ ����� � ��������� �����������.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_03");	//�� ��, ��������� ����������, ������ �� ���, ����� ���� ����� ���� �� � ��� �� ���������.
};


instance DIA_NOV_3_STANDARD(C_INFO)
{
	nr = 10;
	condition = dia_nov_3_standard_condition;
	information = dia_nov_3_standard_info;
	permanent = TRUE;
	description = "��� ������?";
};


func int dia_nov_3_standard_condition()
{
	return TRUE;
};

func void dia_nov_3_standard_info()
{
	AI_Output(other,self,"DIA_NOV_3_STANDARD_15_00");	//��� ����������?
	if(KAPITEL == 1)
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_01");	//� �� ��� �����������! �� ��� ���������� ������ � ���� � �������.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_02");	//����� ����� ������ ���, ����� ������� ������� ����� ���� ��� ������ � ���� ����.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_03");	//����� ����� ��������� ������. ���� �� ����������� ����� ����� ������ � ���� ����.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_04");	//����� �� ��������� � ���������� ���������.
		};
	};
	if((KAPITEL == 2) || (KAPITEL == 3))
	{
		if((PEDRO_TRAITOR == TRUE) && (MIS_NOVIZENCHASE != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_05");	//������ ������ ��������� ������� ���� �������! ���, ������ ����, ����� ������, ���� ��� ������ ����� ��������� �����.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_06");	//����� ��� � ���� ��������� ������ ����. � �����, ��� �� ������� ����� ������� �������� �� ������� ���������. ��� �������� ��� ���� � ������� �������� ��� ��������� �������.
		}
		else if(MIS_NOVIZENCHASE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_07");	//�� ������ ��� ��� �������. ��� ����� �� ��� �� ������� ������ ������ ��� ������ ���������.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_08");	//�� ������� � ������ ������ ��������� ��� ��������� �����.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_09");	//������� �� ������ �������� ����� ���������. � �����, ��� ����� ���������� ���������� ��� ������� ����������.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_10");	//�������, ��� �� ���������, ������������� � ������ ��������, ��� ������� ������. ������ ����� ����� �����, ��� ����� ������.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_11");	//�������, ��� �� ������ ���������� �������� � ������� ������ �������. ���� ������ ��������� �������� ������.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_12");	//����� ������, ������ ����� ��� �����������. �� ������ ��������� �� ���� ������ ���� - ������ � ��� ������� �� ����� ������������� ���.
	};
};

func void b_assignambientinfos_nov_3(var C_NPC slf)
{
	dia_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_standard.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_fegen.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_wurst.npc = Hlp_GetInstanceID(slf);
};

