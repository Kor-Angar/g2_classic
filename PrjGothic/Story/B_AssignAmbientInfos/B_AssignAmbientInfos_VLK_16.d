
instance DIA_VLK_16_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_16_exit_condition;
	information = dia_vlk_16_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_16_exit_condition()
{
	return TRUE;
};

func void dia_vlk_16_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_16_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_16_join_condition;
	information = dia_vlk_16_join_info;
	permanent = TRUE;
	description = "� ���� ����� ����������� ����� ������!";
};


func int dia_vlk_16_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_16_join_info()
{
	AI_Output(other,self,"DIA_VLK_16_JOIN_15_00");	//� ���� ����� ����������� ����� ������!
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_01");	//�� �������� ��� ���������� �� �����?
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_02");	//���� �� ��������� ��������, �� ������ ��������� � ��������� - �������� � ���-������ �� ��������� ������.
};


instance DIA_VLK_16_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_16_people_condition;
	information = dia_vlk_16_people_info;
	permanent = TRUE;
	description = "��� ����� ����� ����������� ����?";
};


func int dia_vlk_16_people_condition()
{
	return TRUE;
};

func void dia_vlk_16_people_info()
{
	AI_Output(other,self,"DIA_VLK_16_PEOPLE_15_00");	//��� ����� ����� ����������� ����?
	AI_Output(self,other,"DIA_VLK_16_PEOPLE_16_01");	//��������, ������� ����� � ������� ��������.
};


instance DIA_VLK_16_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_16_location_condition;
	information = dia_vlk_16_location_info;
	permanent = TRUE;
	description = "��� ����� �����������?";
};


func int dia_vlk_16_location_condition()
{
	return TRUE;
};

func void dia_vlk_16_location_info()
{
	AI_Output(other,self,"DIA_VLK_16_LOCATION_15_00");	//��� ����������� ����� ����� �����?
	AI_Output(self,other,"DIA_VLK_16_LOCATION_16_01");	//�� ����� �� ������ ������ ����������� ����� ������.
};


instance DIA_VLK_16_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_16_standard_condition;
	information = dia_vlk_16_standard_info;
	permanent = TRUE;
	description = "��� ������?";
};


func int dia_vlk_16_standard_condition()
{
	return TRUE;
};

func void dia_vlk_16_standard_info()
{
	AI_Output(other,self,"DIA_VLK_16_STANDARD_15_00");	//��� ����������?
	if((KAPITEL == 1) || (KAPITEL == 2))
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_01");	//�� ����� �� ������? ���� ��� ����� ������! �������� ���������, ��� � ��������� ���������� �����.
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_02");	//���������, ������ ������� ������ �� �������� �� �����?
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_03");	//�������, �������, ��� ��� ������, ���� ������, �������� ����������. ����� ��������������, ��� ��� ����������. � ������� �� ���� �� �����.
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_04");	//��� �������������. �������� ����� ����� ���������� �������� ������ ����� � ���� �� ������.
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_05");	//�� ����� ����������� ������� �� �� �� �����. ������ �� ��������� ��������� ���� �� ������� ������ �������.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_06");	//� �������, ��� ��� ����������� ����� � ����� �����. �������, ��� ������ ��������� ��������� ����� ������, � ����� �� ��� �����, � ������ ��������.
	};
	if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_07");	//� �������, ��� ��������� ������� ���������� ���� ���� ������� �������� �� ������ ��������.
	};
};

func void b_assignambientinfos_vlk_16(var C_NPC slf)
{
	dia_vlk_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_standard.npc = Hlp_GetInstanceID(slf);
};

