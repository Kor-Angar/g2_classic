
instance DIA_STRF_1107_EXIT(C_INFO)
{
	npc = strf_1107_straefling;
	nr = 999;
	condition = dia_strf_1107_exit_condition;
	information = dia_strf_1107_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_strf_1107_exit_condition()
{
	return TRUE;
};

func void dia_strf_1107_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_1107_FINGER(C_INFO)
{
	npc = strf_1107_straefling;
	condition = dia_strf_1107_finger_condition;
	information = dia_strf_1107_finger_info;
	important = TRUE;
};


func int dia_strf_1107_finger_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_strf_1107_finger_info()
{
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_00");	//���� ����� �� ���� �������! ������ �� ��������� �������������� � ���� �������, �������?!
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_01");	//� ������� �� ����, � ��� ��������, ��� ����� ������ �� ����� � ��� ����! �������, � ������� ���������!
};


instance DIA_STRF_1107_COOK(C_INFO)
{
	npc = strf_1107_straefling;
	condition = dia_strf_1107_cook_condition;
	information = dia_strf_1107_cook_info;
	description = "��� �������� ���� �������?";
};


func int dia_strf_1107_cook_condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void dia_strf_1107_cook_info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_00");	//��� �������� ���� �������?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_01");	//����������� ������. �� ����, ��� � ���� �����������, � ��� ������� � '�������� ������'.
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_02");	//� �� ��� ���� ��������?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_03");	//��, ����� ����� �� �����������, ����������, � ���� ��������� �������������.
};


instance DIA_STRF_1107_PERM(C_INFO)
{
	npc = strf_1107_straefling;
	nr = 900;
	condition = dia_strf_1107_perm_condition;
	information = dia_strf_1107_perm_info;
	permanent = TRUE;
	description = "���� ���-������ ���������?";
};


func int dia_strf_1107_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void dia_strf_1107_perm_info()
{
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_00");	//���� �����-������ �������?
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_01");	//���� �� ������ ������ �������, ������ � �������. � � ����� ���� ������� �����-�����������.
};

