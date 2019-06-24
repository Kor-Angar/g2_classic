
instance DIA_VLK_8_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_8_exit_condition;
	information = dia_vlk_8_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_8_exit_condition()
{
	return TRUE;
};

func void dia_vlk_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_8_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_8_join_condition;
	information = dia_vlk_8_join_info;
	permanent = TRUE;
	description = "� ���� ����� ����������� ����� ������!";
};


func int dia_vlk_8_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_8_join_info()
{
	AI_Output(other,self,"DIA_VLK_8_JOIN_15_00");	//� ���� ����� ����������� ����� ������!
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_01");	//� ��� �� ����� �� ���� ��������? ��� � ������ �� �������� ������������� � ������ ����� ������. ����� ����, ���� ���� �������, ����-������ �� ��� ����� ������.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_02");	//� ��������� ������, ���� �������� ���������� � �����������, ����� �� ��������������� ���� ��� ����������.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_03");	//�� ������, �� ������ ������ �� ����. � ��� ���, ��� ������ ��������, ���������� ������ ������ �� ������.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_04");	//� � �� �����, ����� ������, �� ����� ��� ������� �� ����� �������.
};


instance DIA_VLK_8_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_8_people_condition;
	information = dia_vlk_8_people_info;
	permanent = TRUE;
	description = "��� ����� ����������� �������� ����� ������?";
};


func int dia_vlk_8_people_condition()
{
	return TRUE;
};

func void dia_vlk_8_people_info()
{
	AI_Output(other,self,"DIA_VLK_8_PEOPLE_15_00");	//��� ����� ����������� �������� ����� ������?
	AI_Output(self,other,"DIA_VLK_8_PEOPLE_08_01");	//����� ���������... ������� ������������ �� ������ ����� ������. ��� ����� ����������.
};


instance DIA_VLK_8_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_8_location_condition;
	information = dia_vlk_8_location_info;
	permanent = TRUE;
	description = "��� ����� �����������?";
};


func int dia_vlk_8_location_condition()
{
	return TRUE;
};

func void dia_vlk_8_location_info()
{
	AI_Output(other,self,"DIA_VLK_8_LOCATION_15_00");	//��� ����������� ����� ����� �������?
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_01");	//������� �������, �� ������� �������� �������� � ������. ��� �������� �����! ���� ����������� ����� ��������� �� ����.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_02");	//�� � ����������, ��� ��� ������ ���� �� ����. �������� �������� ���� ������� �����, ��� ����������� ����������.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_03");	//��� �������������. ��� ������������ ������� ����� �� ������ ���� ������.
};


instance DIA_VLK_8_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_8_standard_condition;
	information = dia_vlk_8_standard_info;
	permanent = TRUE;
	description = "��� ������?";
};


func int dia_vlk_8_standard_condition()
{
	return TRUE;
};

func void dia_vlk_8_standard_info()
{
	AI_Output(other,self,"DIA_VLK_8_STANDARD_15_00");	//��� ����������?
	if((KAPITEL == 1) || (KAPITEL == 2))
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_01");	//��� ����, ����� �������� �������, ����� ��� ���� �������. � �������, ��� ��-�� �����. ���, ���������, ����� ������� �� ���!
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_02");	//��������, ����� ����, � ������������� �������, �� ����� ���� ����� �������� �����, � �����, ��� ���� ������������.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_03");	//� ������, ��� �������� ����� ������ �����, ����� ���������� �� ������� ��� ����. ��� ����� �� ��������, ��� ��� �������.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_04");	//�� ���������, ��� ��� ��������? ������ ���� ������� �� ���������, ���� �� ��� ��� �������� �� ����� ����� �����.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_05");	//� �������� ������� �� �������, ����� �������� ����� ��������� �����.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_06");	//�������, ��� ���� �������� ���� �� �������� ��������, �������� � �������� ������! � ��� ��� �� ������� �����!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_07");	//�������, ��� ��� ������� ����������. ������� ��� ������?
	};
};

func void b_assignambientinfos_vlk_8(var C_NPC slf)
{
	dia_vlk_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_standard.npc = Hlp_GetInstanceID(slf);
};

