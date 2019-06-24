
instance DIA_MIL_7_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_mil_7_exit_condition;
	information = dia_mil_7_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_7_exit_condition()
{
	return TRUE;
};

func void dia_mil_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_7_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_mil_7_join_condition;
	information = dia_mil_7_join_info;
	permanent = TRUE;
	description = "� ���� �������� � ���������!";
};


func int dia_mil_7_join_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_mil_7_join_info()
{
	AI_Output(other,self,"DIA_MIL_7_JOIN_15_00");	//� ���� �������� � ���������!
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_01");	//�� ���� �� ��������� ��������! � ���� �� ����, ��� ���� ����� ������� ����?
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_02");	//��� ������ ��� �� ��������, �������� ������ � ������� ���������, � ����� ��������� � ����!
		if(c_npcisinquarter(self) != Q_KASERNE)
		{
			AI_Output(other,self,"DIA_MIL_7_JOIN_15_03");	//�� � ���� ��������� ���������!
			AI_Output(self,other,"DIA_MIL_7_JOIN_07_04");	//�� ���� ��������� ��� ���, �������� ��������� ��� ����� �����. �� ������� ��� � ��������.
		};
	}
	else
	{
		b_say(self,other,"$ABS_GOOD");
	};
};


instance DIA_MIL_7_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_mil_7_people_condition;
	information = dia_mil_7_people_info;
	permanent = TRUE;
	description = "��� �� ������ � ���������?";
};


func int dia_mil_7_people_condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_mil_7_people_info()
{
	AI_Output(other,self,"DIA_MIL_7_PEOPLE_15_00");	//��� �� ������ � ���������?
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_01");	//�� ������. ����� ����� �� �����, ����� ��� �����. ���� ��, ��� ������ � ��������� ������.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_02");	//��� ����� ��� ������ � ������ � ���� ����. ������� ����������� �� ���� ��������� � ����� �� ��� ������.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_03");	//���� ���� ���������� ��� ������ - �� ��� ���� ������. ���� ���������� ����� ������ ��������� ����.
};


instance DIA_MIL_7_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_mil_7_location_condition;
	information = dia_mil_7_location_info;
	permanent = TRUE;
	description = "� ��� � ���� �������� � ������?";
};


func int dia_mil_7_location_condition()
{
	return TRUE;
};

func void dia_mil_7_location_info()
{
	AI_Output(other,self,"DIA_MIL_7_LOCATION_15_00");	//� ��� � ���� �������� � ������?
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_01");	//���� �� �� ������ ��������� ����� � ������� ������ � �����, ����� ���������� ������. ����������� � ������ ����� ������ - ��������, ���� �������.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_02");	//���� �� ���������� �������� � ������ �������, ���� ����� �������� � ���������� � ��������� ���, �� ������� ����, ��������������� � ������ ����������.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_03");	//����������� ��� � �������� ��������� � �����������.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_04");	//����� ������ ����, � ����� �� ������ ��� ������� ����, ������������ �� �����.
};


instance DIA_MIL_7_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_mil_7_standard_condition;
	information = dia_mil_7_standard_info;
	permanent = TRUE;
	description = "��� ������?";
};


func int dia_mil_7_standard_condition()
{
	return TRUE;
};

func void dia_mil_7_standard_info()
{
	AI_Output(other,self,"DIA_MIL_7_STANDARD_15_00");	//��� ����������?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_01");	//�������, ��� ������� �������������. ������ ����� ��� ��� �� �������. ��� ��� � ����� ������ ����� � ������!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_02");	//�������� ������ �������� ��������� ��������. ���, ��� �������� �����, ������ ���� �������. �������� ������, ����� ���� �����.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_03");	//�������, �������� �������� � �������� ������, �������� ����������. ���-�� ���� ��������, ��� ��� ����������.
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_04");	//���� �� ��������� ����� ���� ������������ �������� ������. �� ����� ������� ������� �������� � ������� �� �������.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_05");	//����� ��������� ��� �������� ����� �����. ��������� �������� �������� ���� �����.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_06");	//� ��������� ���������, �� ��� ��� �� ���. ��������� �� ������� ����. �� �� ���� ����� ���������!
	};
};

func void b_assignambientinfos_mil_7(var C_NPC slf)
{
	dia_mil_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_standard.npc = Hlp_GetInstanceID(slf);
};

