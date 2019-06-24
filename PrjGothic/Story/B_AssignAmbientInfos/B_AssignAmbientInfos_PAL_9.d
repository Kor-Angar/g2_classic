
instance DIA_PAL_9_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_pal_9_exit_condition;
	information = dia_pal_9_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_9_exit_condition()
{
	return TRUE;
};

func void dia_pal_9_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_pal_9_join_condition;
	information = dia_pal_9_join_info;
	permanent = TRUE;
	description = "��� ��� ����� ���������?";
};


func int dia_pal_9_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_pal_9_join_info()
{
	AI_Output(other,self,"DIA_PAL_9_JOIN_15_00");	//��� ��� ����� ���������?
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_01");	//��������� ����� ����� ������ ���, ��� ������� ���� �������������� �������� ������ ��� ������!
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_02");	//������ �����: ���������� ����� ����� ������ ������ �� ������. �� ���� �� ����� ��� ������, ��� �������!
};


instance DIA_PAL_9_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_pal_9_people_condition;
	information = dia_pal_9_people_info;
	permanent = TRUE;
	description = "��� ��������� �����?";
};


func int dia_pal_9_people_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_pal_9_people_info()
{
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_00");	//��� ��������� �����?
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_01");	//���� �����.
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_02");	//�?
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_03");	//� ������ �����. ���� ����� - ��������� ����������� ����� ����� �������.
};


instance DIA_PAL_9_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_pal_9_location_condition;
	information = dia_pal_9_location_info;
	permanent = TRUE;
	description = "����� �������� ������� � �������?";
};


func int dia_pal_9_location_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_9_location_info()
{
	AI_Output(other,self,"DIA_PAL_9_LOCATION_15_00");	//����� �������� ������� � �������?
	AI_Output(self,other,"DIA_PAL_9_LOCATION_09_01");	//��� �� ���� ����, ��������! ���� ���������� �����, ��� �� ������ ������ � ������!
};


instance DIA_PAL_9_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_pal_9_standard_condition;
	information = dia_pal_9_standard_info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int dia_pal_9_standard_condition()
{
	return TRUE;
};

func void dia_pal_9_standard_info()
{
	AI_Output(other,self,"DIA_PAL_9_STANDARD_15_00");	//��� ����?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(KAPITEL <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_01");	//������, ����� �� �����, ��� ����� ���� � ���������, ��� ����������� ��������� ����� ���-�� ����������.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_02");	//��� ��� ��� ������� �������� �� ������ ������ � ������ ��������. ��� ����� �������.
			};
		};
		if(KAPITEL >= 5)
		{
			AI_Output(self,other,"DIA_PAL_9_STANDARD_09_03");	//����� ������! ������ �������� �������������. ������, ����� �������� �������� ����, ��� ����� ������ ����������� � ������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_9_STANDARD_09_04");	//���� ���� ������ ������ �������, ��� ������, ������!
	};
};

func void b_assignambientinfos_pal_9(var C_NPC slf)
{
	dia_pal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_standard.npc = Hlp_GetInstanceID(slf);
};

