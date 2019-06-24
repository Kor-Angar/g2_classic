
instance DIA_OUT_7_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_out_7_exit_condition;
	information = dia_out_7_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_out_7_exit_condition()
{
	return TRUE;
};

func void dia_out_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OUT_7_STANDARD(C_INFO)
{
	nr = 2;
	condition = dia_out_7_standard_condition;
	information = dia_out_7_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_out_7_standard_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_out_7_standard_info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_OUT_7_STANDARD_07_00");	//��������� ����� ���� ����� ����� ����������� �������. � ������� ������� ��� ������ ����� �� ����.
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_OUT_7_STANDARD_07_01");	//�� ������ �������� ���� ������. ���� �� �� ���� ������ �����, � ��� ����� �������� � ����������.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_OUT_7_STANDARD_07_02");	//���� ����� ����� ����� ��������� �����������. � ����� �� ���� ��������� � ��� �������.
	};
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_out_7(var C_NPC slf)
{
	dia_out_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_out_7_standard.npc = Hlp_GetInstanceID(slf);
};

