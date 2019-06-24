
instance DIA_PAL_4_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_pal_4_exit_condition;
	information = dia_pal_4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_4_exit_condition()
{
	return TRUE;
};

func void dia_pal_4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_4_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_pal_4_join_condition;
	information = dia_pal_4_join_info;
	permanent = TRUE;
	description = "��� ��� ����� ���������?";
};


func int dia_pal_4_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_pal_4_join_info()
{
	AI_Output(other,self,"DIA_PAL_4_JOIN_15_00");	//��� ��� ����� ���������?
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_01");	//���� � ���� ������������� ��������� ���������, �� ������� �� ������ ��������� � ��������� ���������.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_02");	//��� � ������� � �������� � ������ �����. �������� �������� � ���������.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_03");	//��������, ��� � ���� �������� ���� �������� ����.
};


instance DIA_PAL_4_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_pal_4_people_condition;
	information = dia_pal_4_people_info;
	permanent = TRUE;
	description = "��� ��������� �����?";
};


func int dia_pal_4_people_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_pal_4_people_info()
{
	AI_Output(other,self,"DIA_PAL_4_PEOPLE_15_00");	//��� ��������� �����?
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_01");	//���� ����� - ����������������� ����� �������� �� ���� �������. �� �������� ��� �����������, ���� �� ��������������� �����.
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_02");	//�� �� ����� �����. ���� ���� ���-�� �����, ��� � ������� � �������� � ������ �����.
};


instance DIA_PAL_4_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_pal_4_location_condition;
	information = dia_pal_4_location_info;
	permanent = TRUE;
	description = "��� ��, ��������, ������� �����, � ��������?";
};


func int dia_pal_4_location_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_4_location_info()
{
	AI_Output(other,self,"DIA_PAL_4_LOCATION_15_00");	//��� ��, ��������, ������� �����, � ��������?
	AI_Output(self,other,"DIA_PAL_4_LOCATION_04_01");	//� �� ����������� �������� ���� ���.
};


instance DIA_PAL_4_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_pal_4_standard_condition;
	information = dia_pal_4_standard_info;
	permanent = TRUE;
	description = "��� ������?";
};


func int dia_pal_4_standard_condition()
{
	return TRUE;
};

func void dia_pal_4_standard_info()
{
	AI_Output(other,self,"DIA_PAL_4_STANDARD_15_00");	//��� ����������?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(KAPITEL <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_01");	//������, ����� �� �����, ��� ����� ���� � ���������, ��� ����������� ��������� ������ ���-�� ����������.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_02");	//� �� ��� ��� ��� ������� �������� �� ������ ������ � ������ ��������. ��� ��������� ����.
			};
		};
		if(KAPITEL >= 5)
		{
			AI_Output(self,other,"DIA_PAL_4_STANDARD_04_03");	//����� ������! ������� ������ �� �������� ���. ������ ��� �������� ������ ����������� � ������, ����� ������ �������� �������� ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_4_STANDARD_04_04");	//� ���� ��� ������� �� ���������� ������, ������� � ������.
	};
};

func void b_assignambientinfos_pal_4(var C_NPC slf)
{
	dia_pal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_standard.npc = Hlp_GetInstanceID(slf);
};

