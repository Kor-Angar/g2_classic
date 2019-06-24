
instance DIA_PAL_298_EXIT(C_INFO)
{
	npc = pal_298_ritter;
	nr = 999;
	condition = dia_pal_298_exit_condition;
	information = dia_pal_298_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_298_exit_condition()
{
	return TRUE;
};

func void dia_pal_298_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_298_PASS(C_INFO)
{
	npc = pal_298_ritter;
	nr = 2;
	condition = dia_pal_298_pass_condition;
	information = dia_pal_298_pass_info;
	permanent = FALSE;
	description = "���� ����� ��� ������?";
};


func int dia_pal_298_pass_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_298_pass_info()
{
	AI_Output(other,self,"DIA_PAL_298_Pass_15_00");	//���� ����� ��� ������?
	AI_Output(self,other,"DIA_PAL_298_Pass_09_01");	//�� ����� �������� ����� ������ � ������ ��������.
	AI_Output(self,other,"DIA_PAL_298_Pass_09_02");	//�� ���� ������� ��, � �� ������ ����.
	AI_Output(self,other,"DIA_PAL_298_Pass_09_03");	//����� �� ���� ��������� ����� - �� �� ������� ��������� ����.
};


instance DIA_PAL_298_TRESPASS(C_INFO)
{
	npc = pal_298_ritter;
	nr = 2;
	condition = dia_pal_298_trespass_condition;
	information = dia_pal_298_trespass_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_298_trespass_condition()
{
	if(MIS_OLDWORLD == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_pal_298_trespass_info()
{
	AI_Output(self,other,"DIA_PAL_298_TRESPASS_09_00");	//�� ������, ��� ������ ����� ����? �����, ������ �� �� ������ - ��� ����.
	AI_Output(other,self,"DIA_PAL_298_TRESPASS_15_01");	//���� ���� ���� � ������ ��������, � ����� ���.
	AI_Output(self,other,"DIA_PAL_298_TRESPASS_09_02");	//������, ����� ���. ��� � �������.
};


instance DIA_PAL_298_PERM1(C_INFO)
{
	npc = pal_298_ritter;
	nr = 3;
	condition = dia_pal_298_perm1_condition;
	information = dia_pal_298_perm1_info;
	permanent = TRUE;
	description = "� ��� ���� � ��� �� �����, �� ���� ����� � ����?";
};


func int dia_pal_298_perm1_condition()
{
	if((KAPITEL == 1) && Npc_KnowsInfo(other,dia_pal_298_pass))
	{
		return TRUE;
	};
};

func void dia_pal_298_perm1_info()
{
	AI_Output(other,self,"DIA_PAL_298_Perm1_15_00");	//� ��� ���� � ��� �� �����, �� ���� ����� � ����?
	AI_Output(self,other,"DIA_PAL_298_Perm1_09_01");	//����� �� ���������. ��� ������ �� �����. ����� � ���� �� ��������� ����� ��������� ����.
};


instance DIA_PAL_298_PERM2(C_INFO)
{
	npc = pal_298_ritter;
	nr = 3;
	condition = dia_pal_298_perm2_condition;
	information = dia_pal_298_perm2_info;
	permanent = TRUE;
	description = "��� ��������?";
};


func int dia_pal_298_perm2_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_pal_298_perm2_info()
{
	AI_Output(other,self,"DIA_PAL_298_Perm2_15_00");	//��� ����������?
	AI_Output(self,other,"DIA_PAL_298_Perm2_09_01");	//��� ��������. �� ������ �������� ��� ���������.
};

