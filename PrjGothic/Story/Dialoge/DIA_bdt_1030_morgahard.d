
instance DIA_MORGAHARD_EXIT(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 999;
	condition = dia_morgahard_exit_condition;
	information = dia_morgahard_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_morgahard_exit_condition()
{
	return TRUE;
};

func void dia_morgahard_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_HALLO(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_hallo_condition;
	information = dia_morgahard_hallo_info;
	description = "�� ���������.";
};


func int dia_morgahard_hallo_condition()
{
	return TRUE;
};

func void dia_morgahard_hallo_info()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_00");	//�� ���������.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_01");	//������ �� ������ ��� ���?
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_02");	//���� ���� �����. �� ������ �� ������.
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_03");	//��� �� ������ ������? ����� ��� ��������?
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_04");	//�� ���. �����������. �� ��� �������.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_05");	//� ����� ���� ��� �� ������ �� �����������, �� �� ������� �������� ������������ � ���� � ������� ��� �� �������.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_06");	//��� �� �������� ��������� �� ��������, ������� �� �������.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_07");	//�� ������, ��� ��� ����� �� ������. �� ������, �� ���������.
	Info_ClearChoices(dia_morgahard_hallo);
	Info_AddChoice(dia_morgahard_hallo,"������ �������. �������� ���� ������.",dia_morgahard_hallo_attack);
	Info_AddChoice(dia_morgahard_hallo,"��� �� ����� ������� � ������?",dia_morgahard_hallo_richter);
	Info_AddChoice(dia_morgahard_hallo,"����� �������� ��� ����� ����.",dia_morgahard_hallo_tot);
	b_logentry(TOPIC_RICHTERLAKAI,"� ����� ����������, ������� ������.");
	SCFOUNDMORGAHARD = TRUE;
	b_giveplayerxp(XP_FOUNDMORGAHARD);
};

func void dia_morgahard_hallo_tot()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_tot_15_00");	//����� �������� ��� ����� ����.
	AI_Output(self,other,"DIA_Morgahard_HALLO_tot_07_01");	//��, �������. �� ���� �� � ������, ��?
};

func void dia_morgahard_hallo_richter()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_00");	//��� �� ����� ������� � ������?
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_01");	//������. �� ����� � ������� �������� ������ ��� ���� � �������. ����������������.
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_02");	//� �� ��� �� ������. ��� ����� �������������� ��� ���� � ���� �����������.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_03");	//�������������� ��������? � ���� ���� ���. �� ��� ��������� ������� �����������?
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_04");	//��� ��� ��� ��������������, � � ����������, ����� �� ���� ������ ����� �� ��������.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_05");	//�� ������? ������. ���, ������ ��� ������. ��� ��������� ������.
	b_giveinvitems(self,other,itwr_richterkomprobrief_mis,1);
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_06");	//���� ��� � �� ������ � ���� ����, ��� �������� ��������, ��� ����� ��� ������������ � ���� ����.
	b_logentry(TOPIC_RICHTERLAKAI,"��������� ������� ��� ������ � �������� �����. ���� ������ ������ ����������, ��� ����� ������� ����������� �������. � �����, ��� ������ ��, ��� ����� ����� ��.");
	AI_StopProcessInfos(self);
};


var int morgahardsucked;

func void dia_morgahard_hallo_attack()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_attack_15_00");	//������ �������. �������� ���� ������. �� ������� ����� ���� �����.
	AI_Output(self,other,"DIA_Morgahard_HALLO_attack_07_01");	//�������. ��� ��� ����� ������ ������.
	AI_StopProcessInfos(self);
	MORGAHARDSUCKED = TRUE;
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};


instance DIA_MORGAHARD_PERM(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_perm_condition;
	information = dia_morgahard_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_morgahard_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_morgahard_hallo) && (MORGAHARDSUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_morgahard_perm_info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm_07_00");	//� ���� ������ �����... � ��� ����� ��� ����������� �� ��������.
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_PERM2(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_perm2_condition;
	information = dia_morgahard_perm2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_morgahard_perm2_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MORGAHARDSUCKED == TRUE))
	{
		return TRUE;
	};
};

func void dia_morgahard_perm2_info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm2_07_00");	//������ �� ���� ������ �� ���������?
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_PICKPOCKET(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 900;
	condition = dia_morgahard_pickpocket_condition;
	information = dia_morgahard_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_morgahard_pickpocket_condition()
{
	return c_beklauen(73,45);
};

func void dia_morgahard_pickpocket_info()
{
	Info_ClearChoices(dia_morgahard_pickpocket);
	Info_AddChoice(dia_morgahard_pickpocket,DIALOG_BACK,dia_morgahard_pickpocket_back);
	Info_AddChoice(dia_morgahard_pickpocket,DIALOG_PICKPOCKET,dia_morgahard_pickpocket_doit);
};

func void dia_morgahard_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_morgahard_pickpocket);
};

func void dia_morgahard_pickpocket_back()
{
	Info_ClearChoices(dia_morgahard_pickpocket);
};

