
instance DIA_VLK_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_1_exit_condition;
	information = dia_vlk_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_1_exit_condition()
{
	return TRUE;
};

func void dia_vlk_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_1_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_1_join_condition;
	information = dia_vlk_1_join_info;
	permanent = TRUE;
	description = "��� ��� ����� ����������� ����� ������?";
};


func int dia_vlk_1_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_1_join_info()
{
	AI_Output(other,self,"DIA_VLK_1_JOIN_15_00");	//��� ��� ����� ����������� ����� ������?
	AI_Output(self,other,"DIA_VLK_1_JOIN_01_01");	//����� ���� ��������� ������! ���, � ���� ���� ������� � ��������, ��������� ���������� ������.
};


instance DIA_VLK_1_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_1_people_condition;
	information = dia_vlk_1_people_info;
	permanent = TRUE;
	description = "� ��� ����� ����� ����������� ��������?";
};


func int dia_vlk_1_people_condition()
{
	return TRUE;
};

func void dia_vlk_1_people_info()
{
	AI_Output(other,self,"DIA_VLK_1_PEOPLE_15_00");	//� ��� ����� ����� ����������� ��������?
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_01");	//(�������) �� ���������� ������� ��� ���� ���������� � �����. �� ����� ������ �������� � ��������� ��� ������ � ������.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_02");	//�� ����������� ���� �����. �� ������ ����� ����������, �� ������ � �� ������.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_03");	//���� ����� - ��� ������ ����. �� ����������� ��������� ������, � ����� ��������� � �������� �����.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_04");	//���� ������ ����-�� ��������� ���������, ���� ������� ������ ��������� ����� ������ �����.
};


instance DIA_VLK_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_1_location_condition;
	information = dia_vlk_1_location_info;
	permanent = TRUE;
	description = "��� ����������� ���� � ������?";
};


func int dia_vlk_1_location_condition()
{
	return TRUE;
};

func void dia_vlk_1_location_info()
{
	AI_Output(other,self,"DIA_VLK_1_LOCATION_15_00");	//��� ����������� ���� � ������?
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_01");	//����� �� ������ ������ ����� ���, ��� ������ ����� �����������. ���� � ��������� �� �����, ���� � ������ ����� ������.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_02");	//�� ����� ���, ��� ����� ��������, ����� ��������.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_03");	//���� � ���� ������������ �����, �����, ��������, ��������� ����� ������ ������ ����. ��� ��� ��������� � ����� ������ ��������� ��������, ���� ���� �� ������ ����� ������.
};


instance DIA_VLK_1_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_1_standard_condition;
	information = dia_vlk_1_standard_info;
	permanent = TRUE;
	description = "��� ������?";
};


func int dia_vlk_1_standard_condition()
{
	return TRUE;
};

func void dia_vlk_1_standard_info()
{
	AI_Output(other,self,"DIA_VLK_1_STANDARD_15_00");	//��� ����������?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_01");	//� ��� ��� ��� ������ ������, �������� �������� � ������� ��������������� ���������� ������������. ��� �����, ��� �� ���������. ��� ��� ����� ������.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_02");	//���� ����� ������� ������. �� ��� ��� �� ���������� �������������� � �����. ���� ��������� �� ���������, ������ ������� ����� ���� ����� ������ ���, ��� �������.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_03");	//� ������, ��� ������� ������������ � ������. ������� ������ ���� � ������ �����. ���� ����������, ��� ������� ����� � ����� ������ �� ��� � ������.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_04");	//� ������, ��� ��������� �� ��������� ����� ����������� ��������� �� ��������. ��, �� ������� ����, ��� �������� ���� ���-�� ��������!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_05");	//�������, ��� ������� ����������! ���� ����� �������� ����� �����, ����� ������� ��������� ������ �� ������ ��������.
	};
};

func void b_assignambientinfos_vlk_1(var C_NPC slf)
{
	dia_vlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

