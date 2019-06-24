
func void b_dia_bdt_10xx_fluechtling_stimme7()
{
	AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_07_00");	//������ �� ����, � �� ������� ����� � ������.
};

func void b_dia_bdt_10xx_fluechtling_stimme6()
{
	AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_06_00");	//�� �� ������ �� �����, ����� ������� ��� ����� � ������, ������?
};


instance DIA_BDT_1031_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1031_fluechtling;
	nr = 999;
	condition = dia_bdt_1031_fluechtling_exit_condition;
	information = dia_bdt_1031_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1031_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1031_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1031_FLUECHTLING_TIP1(C_INFO)
{
	npc = bdt_1031_fluechtling;
	nr = 2;
	condition = dia_bdt_1031_fluechtling_tip1_condition;
	information = dia_bdt_1031_fluechtling_tip1_info;
	important = TRUE;
};


func int dia_bdt_1031_fluechtling_tip1_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1031_fluechtling_tip1_info()
{
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_07_00");	//���� ����� ��������� �� ���� ��������, ���� �� ������ ������� � ������.
	b_giveplayerxp(XP_AMBIENTKAP3);
	if(SCFOUNDMORGAHARD == FALSE)
	{
		Info_ClearChoices(dia_bdt_1031_fluechtling_tip1);
		Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"� �� ��������� ������� ����.",dia_bdt_1031_fluechtling_tip1_frei);
		Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"� ������ ���������� ����.",dia_bdt_1031_fluechtling_tip1_knast);
		Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"��� ���������, ��� �������?",dia_bdt_1031_fluechtling_tip1_morgahard);
	};
};

func void dia_bdt_1031_fluechtling_tip1_morgahard()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_15_00");	//��� ���������, ��� �������?
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_07_01");	//�� �����������, ����� ��� �� ������� ������� ������. ������� �� ����, ��� ������ ���������.
	Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"����. �����, �������, ��� �������� ��������� ���� � �����.",dia_bdt_1031_fluechtling_tip1_morgahard_drohen);
};

func void dia_bdt_1031_fluechtling_tip1_morgahard_drohen()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_15_00");	//����. �����, �������, ��� �������� ��������� ���� � �����.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_07_01");	//������, ������. � �����, ��������� �� ��� ����������� � �������. �� �� �� ������ ����� �� ����, ������?
	AI_StopProcessInfos(self);
};

func void dia_bdt_1031_fluechtling_tip1_knast()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Knast_15_00");	//� ������ ���������� ����.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Knast_07_01");	//������ ����� ��� ����.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_bdt_1031_fluechtling_tip1_frei()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_15_00");	//� �� ��������� ������� ����.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_07_01");	//���� ���� ������ �����, ����� ���, ����� �� ������ �� ���.
	Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"��� � ����� ������������ �� �����������?",dia_bdt_1031_fluechtling_tip1_frei_verbrechen);
};

func void dia_bdt_1031_fluechtling_tip1_frei_verbrechen()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_15_00");	//��� � ����� ������������ �� �����������?
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_07_01");	//��� �� ���� ����.
};


instance DIA_BDT_1031_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1031_fluechtling;
	nr = 3;
	condition = dia_bdt_1031_fluechtling_perm_condition;
	information = dia_bdt_1031_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1031_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1031_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1032_fluechtling;
	nr = 999;
	condition = dia_bdt_1032_fluechtling_exit_condition;
	information = dia_bdt_1032_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1032_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1032_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1032_fluechtling;
	nr = 2;
	condition = dia_bdt_1032_fluechtling_perm_condition;
	information = dia_bdt_1032_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1032_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1032_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1033_fluechtling;
	nr = 999;
	condition = dia_bdt_1033_fluechtling_exit_condition;
	information = dia_bdt_1033_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1033_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1033_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_FLUECHTLING_TIP2(C_INFO)
{
	npc = bdt_1033_fluechtling;
	nr = 2;
	condition = dia_bdt_1033_fluechtling_tip2_condition;
	information = dia_bdt_1033_fluechtling_tip2_info;
	important = TRUE;
};


func int dia_bdt_1033_fluechtling_tip2_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1033_fluechtling_tip2_info()
{
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_07_00");	//(���������) ��� ���� ����� �� ����?
	b_giveplayerxp(XP_AMBIENTKAP3);
	if(SCFOUNDMORGAHARD == FALSE)
	{
		Info_ClearChoices(dia_bdt_1033_fluechtling_tip2);
		Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"����������. � ������ ���� ����������.",dia_bdt_1033_fluechtling_tip2_frei);
		Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"���� ������ �����, ����� � ������ ���� �����.",dia_bdt_1033_fluechtling_tip2_knast);
		Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"��� ���������, ��� �������?",dia_bdt_1033_fluechtling_tip2_morgahard);
	};
};

func void dia_bdt_1033_fluechtling_tip2_morgahard()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_15_00");	//��� ���������, ��� �������?
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_07_01");	//(���������) ��� �� ����� ��������. ��� � ���������. �� ����� ���������� ����� ���������. � ���� ������ � �����.
	AI_StopProcessInfos(self);
};

func void dia_bdt_1033_fluechtling_tip2_knast()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Knast_15_00");	//���� ������ �����, ����� � ������ ���� �����.
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Knast_07_01");	//(�����) ����!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_bdt_1033_fluechtling_tip2_frei()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_15_00");	//����������. � ������ ���� ����������.
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_07_01");	//�� � �� ���� �������� � �����. ����������!
	Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"�� ���� �� ������ �������, ����� ���?",dia_bdt_1033_fluechtling_tip2_frei_verbrechen);
};

func void dia_bdt_1033_fluechtling_tip2_frei_verbrechen()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_15_00");	//�� ���� ������� �� ������, ���?
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_07_01");	//���� ����� ��������. ���� �� ���� ��������, ���� ���� �������.
};


instance DIA_BDT_1033_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1033_fluechtling;
	nr = 3;
	condition = dia_bdt_1033_fluechtling_perm_condition;
	information = dia_bdt_1033_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1033_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1033_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1034_fluechtling;
	nr = 999;
	condition = dia_bdt_1034_fluechtling_exit_condition;
	information = dia_bdt_1034_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1034_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1034_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1034_fluechtling;
	nr = 2;
	condition = dia_bdt_1034_fluechtling_perm_condition;
	information = dia_bdt_1034_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1034_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1034_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1035_fluechtling;
	nr = 999;
	condition = dia_bdt_1035_fluechtling_exit_condition;
	information = dia_bdt_1035_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1035_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1035_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1035_fluechtling;
	nr = 2;
	condition = dia_bdt_1035_fluechtling_perm_condition;
	information = dia_bdt_1035_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1035_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1035_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme7();
	AI_StopProcessInfos(self);
};

