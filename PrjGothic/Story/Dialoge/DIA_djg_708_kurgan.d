
instance DIA_KURGAN_EXIT(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 999;
	condition = dia_kurgan_exit_condition;
	information = dia_kurgan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kurgan_exit_condition()
{
	return TRUE;
};

func void dia_kurgan_exit_info()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(biff,400);
};


instance DIA_KURGAN_HELLO(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_hello_condition;
	information = dia_kurgan_hello_info;
	important = TRUE;
};


func int dia_kurgan_hello_condition()
{
	return TRUE;
};

func void dia_kurgan_hello_info()
{
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_00");	//��, ��! ������, ���� �����!
	AI_Output(other,self,"DIA_Kurgan_HELLO_15_01");	//��� �� ���� ������ �������?
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_02");	//� ���� �������, ��� ���������� ����� ����� �� ����� ������ ��������� �� ����� ��������. ��� ����� ������ ����� ������ � ���������.
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_03");	//�� ������ ��� � ��������. ��� ������ ��������� ��������������.
	b_logentry(TOPIC_DRAGONHUNTER,"� ����� � ������ �������� ��� ����������� ������ ��������� �� ��������. ��� ����� ������ ���������, ��, �����, ��� �� ���������� ������� ����������� �� ��������.");
};


instance DIA_KURGAN_ELSE(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_else_condition;
	information = dia_kurgan_else_info;
	description = "�� ������ ������� ��� ���-������, ���� � ��� �� ����?";
};


func int dia_kurgan_else_condition()
{
	return TRUE;
};

func void dia_kurgan_else_info()
{
	AI_Output(other,self,"DIA_Kurgan_ELSE_15_00");	//�� ������ ������� ��� ���-������, ���� � ��� �� ����?
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_01");	//� ���� ���� ���� ������ �����, ������ ���������.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_02");	//��� ����� �� ����� �����, ������� ������ � �������, ��� ������ ����������� ���� ������ ����� �������.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_03");	//����������� �����, ��� ������ ��� ��������� ������.
};


instance DIA_KURGAN_LEADER(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_leader_condition;
	information = dia_kurgan_leader_info;
	description = "�� ��� �����, �� ��������?";
};


func int dia_kurgan_leader_condition()
{
	return TRUE;
};

func void dia_kurgan_leader_info()
{
	AI_Output(other,self,"DIA_Kurgan_Leader_15_00");	//�� ��� �����, �� ��������?
	AI_Output(self,other,"DIA_Kurgan_Leader_01_01");	//� ���, ����� �� ��������? ������� ���. ��� ����� �� ����� ����������� �������, ��������� �������.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_02");	//����� ������� ��������� ����� ���� ��� ��������, �� �������� ��� � ��� ������, ��� �� ������ �� ����.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_03");	//��������� ��������� ������. � � ����� ������ �� �������� ��������.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_04");	//�������, ������� ������ ���� ����� � �������� ������-������ ����.
};


instance DIA_KURGAN_KILLDRAGON(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_killdragon_condition;
	information = dia_kurgan_killdragon_info;
	description = "��� �� ������ ����� ��������?";
};


func int dia_kurgan_killdragon_condition()
{
	if(Npc_KnowsInfo(other,dia_kurgan_leader))
	{
		return TRUE;
	};
};


var int kurgan_killdragon_day;

func void dia_kurgan_killdragon_info()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_00");	//(���������) ��� �� ������ ����� ��������?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_01");	//���� ��, ����� ����������. � �� ���� ������, ��� ����� �������� �������?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_02");	//�� �������, �� ����� �������� ������ �� �����, ����� �� ������ ������ ��� ������?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_03");	//����� ���� ������� ����������� ������������ � ����������� ��������.
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_04");	//�������. � ��� �� ����������� ���������� � ���������?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_05");	//������� �� ������ ��������, ��� ��� ����������.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_06");	//������ ����� ����� ����� �������� � ������ ������� ��������� ��.
	KURGAN_KILLDRAGON_DAY = Wld_GetDay();
	Info_AddChoice(dia_kurgan_killdragon,"� ���������, ��� ����� ����.",dia_kurgan_killdragon_weg);
	Info_AddChoice(dia_kurgan_killdragon,"��� �� ����������� ������ ���� �����?",dia_kurgan_killdragon_orks);
	Info_AddChoice(dia_kurgan_killdragon,"��� �������, �� �� �������� ����� ���� ������ ����.",dia_kurgan_killdragon_spott);
};

func void dia_kurgan_killdragon_spott()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_spott_15_00");	//��� �������, �� �� �������� ����� ���� ������ ����.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_spott_01_01");	//���? �� ������ ���������� �� ����� ����� ����������?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_kurgan_killdragon_orks()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_orks_15_00");	//��� �� ����������� ������ ���� �����?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_orks_01_01");	//�� ���������� ���� ������ �����.
};

func void dia_kurgan_killdragon_weg()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_weg_15_00");	//��� �� ����� �������� ����������, ��� �� ������ ������ ���, ��, � ���������, ��� ����� ����.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_weg_01_01");	//����������� �����, ����� ������. � ��������� ������ �� �������� �������� ���� ��� ����.
	AI_StopProcessInfos(self);
};


instance DIA_KURGAN_SEENDRAGON(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_seendragon_condition;
	information = dia_kurgan_seendragon_info;
	permanent = TRUE;
	description = "�� ��� �� ����� �������?";
};


func int dia_kurgan_seendragon_condition()
{
	if(KURGAN_KILLDRAGON_DAY <= (Wld_GetDay() - 2))
	{
		return TRUE;
	};
};

func void dia_kurgan_seendragon_info()
{
	AI_Output(other,self,"DIA_Kurgan_SEENDRAGON_15_00");	//�� ��� �� ����� �������?
	AI_Output(self,other,"DIA_Kurgan_SEENDRAGON_01_01");	//���� ���. �� ��� ����� �� ����� ���������� �����.
};


instance DIA_KURGAN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 5;
	condition = dia_kurgan_alldragonsdead_condition;
	information = dia_kurgan_alldragonsdead_info;
	permanent = FALSE;
	description = "������� ������.";
};


func int dia_kurgan_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_kurgan_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_00");	//������� ������.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_01");	//��! � ���, ���������, ���� ��? ��������?
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_02");	//�.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_03");	//(�������) ��. �� ���� ��� � ��� �� ������. ������ ����� ����.
};


instance DIA_KURGAN_PICKPOCKET(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 900;
	condition = dia_kurgan_pickpocket_condition;
	information = dia_kurgan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_kurgan_pickpocket_condition()
{
	return c_beklauen(34,120);
};

func void dia_kurgan_pickpocket_info()
{
	Info_ClearChoices(dia_kurgan_pickpocket);
	Info_AddChoice(dia_kurgan_pickpocket,DIALOG_BACK,dia_kurgan_pickpocket_back);
	Info_AddChoice(dia_kurgan_pickpocket,DIALOG_PICKPOCKET,dia_kurgan_pickpocket_doit);
};

func void dia_kurgan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kurgan_pickpocket);
};

func void dia_kurgan_pickpocket_back()
{
	Info_ClearChoices(dia_kurgan_pickpocket);
};

