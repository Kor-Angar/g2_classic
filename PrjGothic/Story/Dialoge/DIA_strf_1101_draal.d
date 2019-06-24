
instance DIA_DRAAL_EXIT(C_INFO)
{
	npc = strf_1101_draal;
	nr = 999;
	condition = dia_draal_exit_condition;
	information = dia_draal_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_draal_exit_condition()
{
	return TRUE;
};

func void dia_draal_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DRAAL_DRAGON(C_INFO)
{
	npc = strf_1101_draal;
	nr = 1;
	condition = dia_draal_dragon_condition;
	information = dia_draal_dragon_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_draal_dragon_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_draal_dragon_info()
{
	AI_Output(self,other,"DIA_Draal_DRAGON_03_00");	//� ��� �������, ����� ����� ������.
	AI_Output(self,other,"DIA_Draal_DRAGON_03_01");	//� ����� ���, �� ������, ��� 10 ����� - ��� �������� ������� ���������� ������ � ��������� ���!
	AI_Output(self,other,"DIA_Draal_DRAGON_03_02");	//������! � ����� �������� �����. ����� �� ������� ���� � �����. �� � �� �������!
};

