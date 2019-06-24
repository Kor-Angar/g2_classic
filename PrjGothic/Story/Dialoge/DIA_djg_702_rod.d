
instance DIA_RODDJG_EXIT(C_INFO)
{
	npc = djg_702_rod;
	nr = 999;
	condition = dia_roddjg_exit_condition;
	information = dia_roddjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_roddjg_exit_condition()
{
	return TRUE;
};

func void dia_roddjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RODDJG_HALLO(C_INFO)
{
	npc = djg_702_rod;
	condition = dia_roddjg_hallo_condition;
	information = dia_roddjg_hallo_info;
	description = "� ����� ��� � �������?";
};


func int dia_roddjg_hallo_condition()
{
	if(DJG_SWAMPPARTY == FALSE)
	{
		return TRUE;
	};
};

func void dia_roddjg_hallo_info()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_15_00");	//� ����� ��� � �������?
	AI_Output(self,other,"DIA_RodDJG_HALLO_06_01");	//��� ������ �������� ����! ��� ����� ������� ����� ������, �� ������ �������� �� ���� ������� ������ ���� ������ ������?
	AI_Output(self,other,"DIA_RodDJG_HALLO_06_02");	//� ���� � ���� ������� ��, ������ �������� ����������� � ���� ���.
	if((Npc_IsDead(swampdragon) == FALSE) && (DJG_SWAMPPARTY == FALSE))
	{
		Info_AddChoice(dia_roddjg_hallo,"���� �� �����?",dia_roddjg_hallo_warten);
	};
	Info_AddChoice(dia_roddjg_hallo,"��� �� ���� ��� ������?",dia_roddjg_hallo_woher);
};

func void dia_roddjg_hallo_woher()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_Woher_15_00");	//��� �� ���� ��� ������?
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_01");	//������ �������� ������ ������ �� ��� ���, ��������� �� ��������, � �������� ��� ������ ��������� �� ��� ��������� ������.
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_02");	//���� � �����-������ �������� �� ����, � ������� �������� ��� ������ ��, � ����� ����� �� ���� ��� ������ �����.
};

func void dia_roddjg_hallo_warten()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_15_00");	//���� �� �����?
	Info_ClearChoices(dia_roddjg_hallo);
	if(Npc_IsDead(djg_cipher) == FALSE)
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_01");	//����� �����, �������, ��������� ������� ���� �������. ��� ��� ���� ������������ � ����.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_02");	//� ���� ����������� ��� ���������� ��������� ��� ���.
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_03");	//��� �������, ����� ��� ����� ���� ������? ���������, ��� ��� �����?
		Info_AddChoice(dia_roddjg_hallo,"� ����� ����.",dia_roddjg_hallo_warten_allein);
		Info_AddChoice(dia_roddjg_hallo,"��� �� ������ �� ���� ���������� ���������?",dia_roddjg_hallo_warten_wasweisstdu);
		Info_AddChoice(dia_roddjg_hallo,"������ ������.",dia_roddjg_hallo_warten_zusammen);
	};
};

func void dia_roddjg_hallo_warten_zusammen()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_zusammen_15_00");	//������ ������.
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_zusammen_06_01");	//������. ����� ��� �� ����.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait2");
};

func void dia_roddjg_hallo_warten_wasweisstdu()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_wasweisstdu_15_00");	//��� �� ������ �� ���� ���������� ���������?
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_wasweisstdu_06_01");	//������ ��� ���� �� ��� ����������� �� ����� � ��� ���, ��������, �������� ���� ������. ����� ����� ����?
};

func void dia_roddjg_hallo_warten_allein()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_allein_15_00");	//� ����� ����.
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_allein_06_01");	//��� �, ����� � ����� ���� �����.
	AI_StopProcessInfos(self);
};


instance DIA_RODDJG_WARTEMAL(C_INFO)
{
	npc = djg_702_rod;
	condition = dia_roddjg_wartemal_condition;
	information = dia_roddjg_wartemal_info;
	permanent = TRUE;
	description = "��� � �����?";
};


func int dia_roddjg_wartemal_condition()
{
	if(Npc_KnowsInfo(other,dia_roddjg_hallo) || (DJG_SWAMPPARTY == TRUE))
	{
		return TRUE;
	};
};

func void dia_roddjg_wartemal_info()
{
	AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_00");	//��� � �����?
	if(((DJG_SWAMPPARTY == TRUE) || (Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_02") < 1000)) && Npc_IsDead(djg_cipher))
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_01");	//��������, ������. � �����, ��� ����� ������� ��� �� �� �����. � �������, �������� �������� �������.
		DJG_SWAMPPARTY = FALSE;
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_02");	//(�����������) ��� ������! ��� ������� ������!
	};
	if(Npc_IsDead(swampdragon))
	{
		AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_03");	//� ��� �� ����������� ������ ������?
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_04");	//�� ��� �����������! ������ �����, � ����� ���� ����� ������!
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_ROD_PICKPOCKET(C_INFO)
{
	npc = djg_702_rod;
	nr = 900;
	condition = dia_rod_pickpocket_condition;
	information = dia_rod_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rod_pickpocket_condition()
{
	return c_beklauen(16,320);
};

func void dia_rod_pickpocket_info()
{
	Info_ClearChoices(dia_rod_pickpocket);
	Info_AddChoice(dia_rod_pickpocket,DIALOG_BACK,dia_rod_pickpocket_back);
	Info_AddChoice(dia_rod_pickpocket,DIALOG_PICKPOCKET,dia_rod_pickpocket_doit);
};

func void dia_rod_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rod_pickpocket);
};

func void dia_rod_pickpocket_back()
{
	Info_ClearChoices(dia_rod_pickpocket);
};

