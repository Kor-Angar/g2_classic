
instance DIA_GORNDJG_EXIT(C_INFO)
{
	npc = pc_fighter_djg;
	nr = 999;
	condition = dia_gorndjg_exit_condition;
	information = dia_gorndjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorndjg_exit_condition()
{
	return TRUE;
};

func void dia_gorndjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNDJG_STARTCAMP(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_startcamp_condition;
	information = dia_gorndjg_startcamp_info;
	description = "� ����, �� ������������� � ��������� �� ��������.";
};


func int dia_gorndjg_startcamp_condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_gorndjg_startcamp_info()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_15_00");	//� ����, �� ������������� � ��������� �� ��������.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_01");	//� ����� �� ������� � ������ ��������, ������ ��� � ���� ��� ��������� ��� ���� ���� �������, � � ����� ��� ������, ��� ����� ����������.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_02");	//� ����� ���� ��� ���. ����� ����������� ���-�� �� ���. � ����� ������� �� ����� ������� ����� � ����� �����.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_03");	//� �� ��������, ���� ������ � �������� �� ����� ����� ������� ��� ��� ��� ��������.
	Info_AddChoice(dia_gorndjg_startcamp,"��� ��������.",dia_gorndjg_startcamp_by);
	Info_AddChoice(dia_gorndjg_startcamp,"��� �� ���������� ������ ������?",dia_gorndjg_startcamp_wohin);
};

func void dia_gorndjg_startcamp_wohin()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_Wohin_15_00");	//��� �� ���������� ������ ������?
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_01");	//� ������� ����� � ������� � ������ ��������, � ����� �����.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_02");	//��� ������ ����� ������� ��������, ��� ��������� ����.
};

func void dia_gorndjg_startcamp_by()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_By_15_00");	//��� ��������.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_By_12_01");	//���� ���������.
	AI_StopProcessInfos(self);
};


instance DIA_GORNDJG_HALLO(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_hallo_condition;
	information = dia_gorndjg_hallo_info;
	description = "��� ��� �� ���� �������!";
};


func int dia_gorndjg_hallo_condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1500)
	{
		return TRUE;
	};
};

func void dia_gorndjg_hallo_info()
{
	AI_Output(other,self,"DIA_GornDJG_HALLO_15_00");	//��� ��� �� ���� �������!
	AI_Output(self,other,"DIA_GornDJG_HALLO_12_01");	//�� ���� �� �������� ����� �� ����������.
};


instance DIA_GORNDJG_WHATSUP(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_whatsup_condition;
	information = dia_gorndjg_whatsup_info;
	description = "���-������ �������?";
};


func int dia_gorndjg_whatsup_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_hallo))
	{
		return TRUE;
	};
};

func void dia_gorndjg_whatsup_info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_15_00");	//���-������ �������?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_12_01");	//� ��� ��� �������. ��� �������, ���, �������, � ���� ������ �� �����, ����� ���-�� ����. ����� ��� ����� ���� � ��������� �����.
	Info_ClearChoices(dia_gorndjg_whatsup);
	Info_AddChoice(dia_gorndjg_whatsup,"�����, ��� ������?",dia_gorndjg_whatsup_lester);
	Info_AddChoice(dia_gorndjg_whatsup,"������?",dia_gorndjg_whatsup_a_dragon);
	b_logentry(TOPIC_DRAGONHUNTER,"���� ��������� � �������� �����������, �������� � ������ �������� � ������. ������ �� ����� ��������� �� ������������ � �������� �����.");
};

func void dia_gorndjg_whatsup_lester()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_Lester_15_00");	//�����, ��� ������, ������� �������� � ���� ������ ����� �� �����?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_Lester_12_01");	//�����. ��, ��������� � ����, ������ ������ �� ����� ���.
};

func void dia_gorndjg_whatsup_a_dragon()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_A_Dragon_15_00");	//������?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_01");	//������ ��������. �����������, ����������� ���, ���������� �����, ��� ����������� ������������. ��, � ��� ������������ ���� � ��������.
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_02");	//��� ����� ������ ������� ������������. ��, ������, ��� �������� ���� ������ �� ��������.
	GORNDJG_WHATMONSTERS = TRUE;
	b_logentry(TOPIC_DRAGONHUNTER,"�������� ����������, ���������� �� �����, � ������ �������� � ������ ��������� ������.");
	Info_ClearChoices(dia_gorndjg_whatsup);
};


instance DIA_GORNDJG_WHATMONSTERS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_whatmonsters_condition;
	information = dia_gorndjg_whatmonsters_info;
	description = "� ��� ��� �� �������?";
};


func int dia_gorndjg_whatmonsters_condition()
{
	if(GORNDJG_WHATMONSTERS == TRUE)
	{
		return TRUE;
	};
};

func void dia_gorndjg_whatmonsters_info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATMONSTERS_15_00");	//� ��� ��� �� �������?
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_01");	//� �� ���� ������ ���������� ��, �� ��� ����� �� ���� ����� � � ��� ���������� ����. ��� ���������� ����� ��� ��������, ��������� ������.
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_02");	//� ������ ����� ����� �����, ��� ��� ����� � ������� ���. ��� �������, ��� ������ ��� ����������� ���.
};


instance DIA_GORNDJG_WAHTABOUTORCS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_wahtaboutorcs_condition;
	information = dia_gorndjg_wahtaboutorcs_info;
	description = "��� ������ �����?";
};


func int dia_gorndjg_wahtaboutorcs_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_hallo))
	{
		return TRUE;
	};
};

func void dia_gorndjg_wahtaboutorcs_info()
{
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_00");	//��� ������ �����?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_01");	//� ���������� �� ���� �������. ���������, ������� ��� ��������� ���, ��������� ���-�� ��������. � ����������, ��� �� ��� ����� ��������� ������ ������� �����.
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_02");	//�� ������ �������, ���� ������, ��� �� ���� ������?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_03");	//� �� ��������, ���� ������� ������� ��� �������� ���� �������� � �������� ��� ������. �� �������� ��� ��� ���.
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_04");	//���� ��� ��������, ��� ����� ����� ��������� � ������������ ��. �� ��� ����� ����� �������� � ����� �������. � ����� ������� ��� ����� ������.
};


instance DIA_GORNDJG_HELPKILLDRACONIANS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_helpkilldraconians_condition;
	information = dia_gorndjg_helpkilldraconians_info;
	description = "�� �������� ��� ��������� � ��� ��������?";
};


func int dia_gorndjg_helpkilldraconians_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_whatmonsters) && Npc_KnowsInfo(other,dia_gorndjg_wahtaboutorcs) && (Npc_IsDead(rockdragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorndjg_helpkilldraconians_info()
{
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_00");	//�� �������� ��� ��������� � ��� ��������?
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_01");	//� ���� �� ����. �����, ���� ��� ����� ������ �����, ��� ������ � ���������.
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_02");	//��� ��������!
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_03");	//����� �� ���� ������. � ������� �� ����� ����, ���� �������, ���������? �� � ������ ������� ...
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_04");	//�����! ����� � ������ ����� �����? ����� �� ��� ����������� � ������� ���� ������ � ��������.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_05");	//��������� �������� �� ��������. ����� ����, � ���� ���������� ������� ��������, ��� ������ ���.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_06");	//��� ��� �����, ����� ������ �����!
	b_logentry(TOPIC_DRAGONHUNTER,"���� ����� ������ ��� ��������� ����� ����������� �� �������� � ������.");
};


instance DIA_GORNDJG_LOSGEHTS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_losgehts_condition;
	information = dia_gorndjg_losgehts_info;
	description = "����� � �����!";
};


func int dia_gorndjg_losgehts_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_helpkilldraconians))
	{
		return TRUE;
	};
};

func void dia_gorndjg_losgehts_info()
{
	AI_Output(other,self,"DIA_GornDJG_LOSGEHTS_15_00");	//����� � �����!
	AI_Output(self,other,"DIA_GornDJG_LOSGEHTS_12_01");	//��� � ������ �������, ��? �� � ����, ����� �� ����: ��� ��� ���. �� ���� ���, � ����� ������!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RunToRockRuinBridge");
};


instance DIA_GORNDJG_BISHIERHIN(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_bishierhin_condition;
	information = dia_gorndjg_bishierhin_info;
	important = TRUE;
};


func int dia_gorndjg_bishierhin_condition()
{
	if(Npc_GetDistToWP(self,"LOCATION_19_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_gorndjg_bishierhin_info()
{
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_00");	//��� ���� ������� �������. �� � ������, �������, � ��������� �� ���������� ���. ����� �� ����! � � ����� ����� � ���� ��������� �� ������.
	AI_Output(other,self,"DIA_GornDJG_BISHIERHIN_15_01");	//��� �������. ��� ��������!
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_02");	//� ���� ������� �� ���!
	b_logentry(TOPIC_DRAGONHUNTER,"���� �������� �� ���� ���������� ����. �� ����� ���������� ��������� �� ������.");
	b_giveplayerxp(XP_GORNDJGPLATEAUCLEAR);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GORNDJG_DRAGONDEAD(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_dragondead_condition;
	information = dia_gorndjg_dragondead_info;
	description = "�������� ������ �����!";
};


func int dia_gorndjg_dragondead_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_whatsup) && (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1000) && (Npc_IsDead(rockdragon) == TRUE))
	{
		return TRUE;
	};
};

func void dia_gorndjg_dragondead_info()
{
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_00");	//�������� ������ �����!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_01");	//� ������ �� ����� ������! �� ��� � ���� �������� � ������?
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_02");	//��!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_03");	//�� ��! � ��� � �����. ��� �� �� �� ��������, ��� ����� �� ����� �� ��������.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_04");	//��� �� ����������� ������ ������?
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_05");	//� ������ ����� ��� �������, � ����� ������� � ��. �����, �� ��� ��� ����������!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_06");	//���� ��� ������ �� ���� ����. ������ ����� ��������� � ����� �������.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_07");	//��� ��������!
};


instance DIA_FIGHTER_DJG_PICKPOCKET(C_INFO)
{
	npc = pc_fighter_djg;
	nr = 900;
	condition = dia_fighter_djg_pickpocket_condition;
	information = dia_fighter_djg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_fighter_djg_pickpocket_condition()
{
	return c_beklauen(10,35);
};

func void dia_fighter_djg_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_djg_pickpocket);
	Info_AddChoice(dia_fighter_djg_pickpocket,DIALOG_BACK,dia_fighter_djg_pickpocket_back);
	Info_AddChoice(dia_fighter_djg_pickpocket,DIALOG_PICKPOCKET,dia_fighter_djg_pickpocket_doit);
};

func void dia_fighter_djg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fighter_djg_pickpocket);
};

func void dia_fighter_djg_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_djg_pickpocket);
};

