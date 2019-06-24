
instance DIA_NOV_8_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_nov_8_exit_condition;
	information = dia_nov_8_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nov_8_exit_condition()
{
	return TRUE;
};

func void dia_nov_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_8_FEGEN(C_INFO)
{
	nr = 2;
	condition = dia_nov_8_fegen_condition;
	information = dia_nov_8_fegen_info;
	permanent = TRUE;
	description = "��� ����� ������, ����� �������� ����� �����������.";
};


func int dia_nov_8_fegen_condition()
{
	if((KAPITEL == 1) && (MIS_KLOSTERARBEIT == LOG_RUNNING) && (NOV_HELFER < 4))
	{
		return TRUE;
	};
};


var int feger3_permanent;

func void dia_nov_8_fegen_info()
{
	AI_Output(other,self,"DIA_NOV_8_Fegen_15_00");	//��� ����� ������, ����� �������� ����� �����������.
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self))
	{
		if(FEGER3_PERMANENT == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_01");	//��, ������. �� ������ ������� �������� ����� � ��� ����������� ������ ������ ���� ������?
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_02");	//�� �������������, � ���� ���� ����� �� ��������, ����� � ������ ����. ������� � ������ ����. ���� �� ������, ���� �� �� �� ���������� � ����.
			NOV_HELFER = NOV_HELFER + 1;
			FEGER3_PERMANENT = TRUE;
			b_giveplayerxp(XP_FEGER);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			b_logentry(TOPIC_PARLANFEGEN,"� ����� ����������, ��������� ������ ��� ��������� �������.");
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_03");	//����, � ������� ���� ���������. � � ��� ������ ����, ��� ������ ����. ������ ���� � � ���������.
		};
	};
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self) == FALSE)
	{
		AI_Output(self,other,"DIA_NOV_8_Fegen_08_04");	//��, � ��� �� �� ������, �� � ����� �����.
	};
};


instance DIA_NOV_8_WURST(C_INFO)
{
	nr = 3;
	condition = dia_nov_8_wurst_condition;
	information = dia_nov_8_wurst_info;
	permanent = TRUE;
	description = "��� ������ ������� �������� �������?";
};


func int dia_nov_8_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_nov_8_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_NOV_8_Wurst_15_00");	//��� ������ ������� �������� �������?
	AI_Output(self,other,"DIA_NOV_8_Wurst_08_01");	//�� �������, �� ��������. ������� - ��� ������ ��, ��� ��� ���� �����.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
};


instance DIA_NOV_8_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_nov_8_join_condition;
	information = dia_nov_8_join_info;
	permanent = TRUE;
	description = "��� ��� ����� �����?";
};


func int dia_nov_8_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_nov_8_join_info()
{
	AI_Output(other,self,"DIA_NOV_8_JOIN_15_00");	//��� ��� ����� �����?
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_01");	//�� ������� ��������� ������, ������ ����� ������ ���� ���� �������� ���.
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_02");	//����������� ��������� ������� ������ �����, � ������ ������� ����� �������� ������ � ���������� �����.
};


instance DIA_NOV_8_PEOPLE(C_INFO)
{
	nr = 5;
	condition = dia_nov_8_people_condition;
	information = dia_nov_8_people_info;
	permanent = TRUE;
	description = "��� ��������� ����������?";
};


func int dia_nov_8_people_condition()
{
	return TRUE;
};

func void dia_nov_8_people_info()
{
	AI_Output(other,self,"DIA_NOV_8_PEOPLE_15_00");	//��� ��������� ����������?
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_01");	//������ �����. �� ������� �� ���� ����� ������� ����� ������ ������. ���� ��� ��������� � ������.
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_02");	//��������� ������ - ��� ����. ����� ��� �� ���� ���, ����� ��� ����� ���������� � ����� ��� ���� �� �����.
};


instance DIA_NOV_8_LOCATION(C_INFO)
{
	nr = 6;
	condition = dia_nov_8_location_condition;
	information = dia_nov_8_location_info;
	permanent = TRUE;
	description = "�������� ��� �� ���� ���������.";
};


func int dia_nov_8_location_condition()
{
	return TRUE;
};

func void dia_nov_8_location_info()
{
	AI_Output(other,self,"DIA_NOV_8_LOCATION_15_00");	//�������� ��� �� ���� ���������.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_01");	//�� ����� �������. ��� ������� �������� � �������� ������ �������.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_02");	//��� ���� ���������� ��������� ���������. ��� ������������ ������ ������ ����.
};


instance DIA_NOV_8_STANDARD(C_INFO)
{
	nr = 10;
	condition = dia_nov_8_standard_condition;
	information = dia_nov_8_standard_info;
	permanent = TRUE;
	description = "���� ���-������ ���������?";
};


func int dia_nov_8_standard_condition()
{
	return TRUE;
};

func void dia_nov_8_standard_info()
{
	AI_Output(other,self,"DIA_NOV_8_STANDARD_15_00");	//���� ���-������ ���������?
	if(KAPITEL == 1)
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_01");	//����� ������� � ���. ��� ����� ��� ��� �� ���� ��������� �� ������� ��� ������ � ���� ����.
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_02");	//�������, ��� � ���� �����-������ ��������� ���� �����. � ����� ������� ��������� ���� �����.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_03");	//�������� ������� �� ������� ������ �������. ���� �� ��� ��������� �����, � ���������, � �������� ����� � ��������.
		};
	};
	if((KAPITEL == 2) || (KAPITEL == 3))
	{
		if((PEDRO_TRAITOR == TRUE) && (MIS_NOVIZENCHASE != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_04");	//� ��� ��� �� ���� �������� � ���. ���� �� ��� ������ ��������� � ����� ���� ������.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_05");	//�� ������ ����� ������� ������������ ��������, �� �� ��� ������� �����. ��� ������ ������� ������� ���������� ������ �� ��� �� ���� �������.
		}
		else if(MIS_NOVIZENCHASE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_06");	//����� ������, �� ������ ������� ���� �� ��� �����.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_07");	//���� �������� ����� ��������� �������� ��� ������ ����������� ��� � ������ �� ������ � ��� ������ �������.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_08");	//� ������ � �������� � �� ����� ���. �� �������� � ���� �����!
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_09");	//������ ����� ����� ���������� ���������, � ������� ������ ���� ��������. ��� ��� ������ ����� ��� ������� �������� �� ������ ��������.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_10");	//���. � � ��������� ������ ������� �� ���. � ������ ������ �� ������ ���������� ��������!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_11");	//��. �� �������� ������ ��� ���������! ����� ������� ���, ��� ������� �� ����� �������� ����. ������� ���� ������.
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_12");	//�������� ��� ������ �����, � ��� �������� ������ ����� �����, ����� ������� ��.
	};
};

func void b_assignambientinfos_nov_8(var C_NPC slf)
{
	dia_nov_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_standard.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_fegen.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_wurst.npc = Hlp_GetInstanceID(slf);
};

