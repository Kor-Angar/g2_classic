
instance DIA_RETHON_EXIT(C_INFO)
{
	npc = djg_709_rethon;
	nr = 999;
	condition = dia_rethon_exit_condition;
	information = dia_rethon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rethon_exit_condition()
{
	return TRUE;
};

func void dia_rethon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RETHON_HALLO(C_INFO)
{
	npc = djg_709_rethon;
	nr = 5;
	condition = dia_rethon_hallo_condition;
	information = dia_rethon_hallo_info;
	description = "��� �� ������� �����?";
};


func int dia_rethon_hallo_condition()
{
	return TRUE;
};

func void dia_rethon_hallo_info()
{
	AI_Output(other,self,"DIA_Rethon_HALLO_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Rethon_HALLO_12_01");	//��������� � ��������, ��� �� ���?
};


instance DIA_RETHON_KAMPF(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_kampf_condition;
	information = dia_rethon_kampf_info;
	description = "� ��� �� �������� ���������?";
};


func int dia_rethon_kampf_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_kampf_info()
{
	AI_Output(other,self,"DIA_Rethon_KAMPF_15_00");	//� ��� �� �������� ���������?
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_01");	//� ���� ������� �� ��� ��������� � �������� ���� ������ �������, ��� ���� ������.
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_02");	//�����. � ���������, ������� ��. � �� ��� �������?
};


instance DIA_RETHON_PALADINE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_paladine_condition;
	information = dia_rethon_paladine_info;
	description = "�������� �� ������ ����, ��� �� �����?";
};


func int dia_rethon_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_paladine_info()
{
	AI_Output(other,self,"DIA_Rethon_PALADINE_15_00");	//�������� �� ������ ����, ��� �� �����?
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_01");	//����. � ��� ������ ������ ��������. ����������� �� ��� ����, ��� ������ ����.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_02");	//������ ��� � ��� �� � �����. ��� ������ �� �����.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_03");	//� ���� �������, �� ������ �������� �� ��� �� ������ ����������� ������, ������� ��� ��������� �����.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_04");	//����� �������� ���� ����� �� ������ ������.
};


instance DIA_RETHON_WOGRUPPE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 7;
	condition = dia_rethon_wogruppe_condition;
	information = dia_rethon_wogruppe_info;
	description = "�� ������ �� ����� ������?";
};


func int dia_rethon_wogruppe_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_wogruppe_info()
{
	AI_Output(other,self,"DIA_Rethon_WOGRUPPE_15_00");	//�� ������ �� ����� ������?
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_01");	//���� ������? � ���� ��� ������. � ������� �� ��������.
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_02");	//���� � ������� ����� ��� ������, ����� �� ������, ����� � ����� ����. ������� � �� ���� �� � ��� ��������.
};


instance DIA_RETHON_DRACHENGESEHEN(C_INFO)
{
	npc = djg_709_rethon;
	nr = 8;
	condition = dia_rethon_drachengesehen_condition;
	information = dia_rethon_drachengesehen_info;
	description = "�� ��� ����� �������?";
};


func int dia_rethon_drachengesehen_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_kampf))
	{
		return TRUE;
	};
};

func void dia_rethon_drachengesehen_info()
{
	AI_Output(other,self,"DIA_Rethon_DRACHENGESEHEN_15_00");	//�� ��� ����� �������?
	AI_Output(self,other,"DIA_Rethon_DRACHENGESEHEN_12_01");	//���. � ���� �������� ���� ������ � �������, ������ ��� ���������� ��������� �� ����.
};


instance DIA_RETHON_ANGST(C_INFO)
{
	npc = djg_709_rethon;
	nr = 9;
	condition = dia_rethon_angst_condition;
	information = dia_rethon_angst_info;
	description = "� �� �� �������, ��� ���-������ ����� ���� ���������?";
};


func int dia_rethon_angst_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_wogruppe))
	{
		return TRUE;
	};
};

func void dia_rethon_angst_info()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_15_00");	//� �� �� �������, ��� ���-������ ����� ���� ���������?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_01");	//���? ���? �������?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rethon_ANGST_12_02");	//���� ���� ������������� ������, ��� ��� ����� ���-�� ������, ��?
		AI_Output(other,self,"DIA_Rethon_ANGST_15_03");	//� �� �� ����� �������. � ������� ��� �� ����.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_04");	//��. ��� ������. ������ � ���, ��� � �������.
	};
	AI_Output(self,other,"DIA_Rethon_ANGST_12_05");	//�� ����� ���� ������ ������, ��� �� ������ � �����?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_06");	//������� ������ ����������, ���� ��� ������� ��������� ������ �����.
	if(Npc_IsDead(djg_sylvio))
	{
		AI_Output(other,self,"DIA_Rethon_ANGST_15_07");	//�� �������. �� �����.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_08");	//� ���.
	}
	else
	{
		Info_AddChoice(dia_rethon_angst,DIALOG_BACK,dia_rethon_angst_weiter);
		Info_AddChoice(dia_rethon_angst,"������, �� �� ��������-�� ������ ���.",dia_rethon_angst_sylviomoegen);
		Info_AddChoice(dia_rethon_angst,"� ��� ������ �������?",dia_rethon_angst_wosylvio);
		Info_AddChoice(dia_rethon_angst,"������� ��� �����?",dia_rethon_angst_sylviohier);
	};
};

func void dia_rethon_angst_weiter()
{
	Info_ClearChoices(dia_rethon_angst);
};

func void dia_rethon_angst_sylviohier()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviohier_15_00");	//������� ��� �����?
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_01");	//�����, � �����, �� ������ �������? ��, ���. �� ����� �������.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_02");	//�� �������� � ����������� ������� �����, � ����� ����� �����.
};

func void dia_rethon_angst_sylviomoegen()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviomoegen_15_00");	//������, �� �� ��������-�� ������ ���.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_01");	//��� �� ������ ���� ������� - ������? ���� �� �����, ���� �� � ��� ������ �� ����.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_02");	//� ������� ��� ������. ��� ����� ����, ������� ���� �� ��� � �� ������ ��������.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_03");	//��� �� �� ���. � ������� ����.
};

func void dia_rethon_angst_wosylvio()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_woSylvio_15_00");	//� ��� ������ �������?
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_01");	//�������� ��������, ���-�� � ������� ������� �� ������. ��, �� ������, ����� ������� � ������� �� ���� ��������.
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_02");	//�� �� ����� ����� � ������ �������, ����� �� ������� �� ����. ���� ������ �� �����, ���� �� �����.
	b_logentry(TOPIC_DRACHENJAGD,"������� �� �������� ����� �������� ���-�� � ������� �������.");
	b_logentry(TOPIC_DRAGONHUNTER,"������� ��� � �����, � ����� ���������� �� ������ �������� �������.");
};


instance DIA_RETHON_MEINEWAFFE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 10;
	condition = dia_rethon_meinewaffe_condition;
	information = dia_rethon_meinewaffe_info;
	description = "�� ������ ������ ��� �������� ��� ������?";
};


func int dia_rethon_meinewaffe_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_paladine))
	{
		return TRUE;
	};
};

func void dia_rethon_meinewaffe_info()
{
	AI_Output(other,self,"DIA_Rethon_MEINEWAFFE_15_00");	//�� ������ ������ ��� �������� ��� ������?
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_01");	//��������? ����� ���� ���-������ ����� � ������� ���� ����, ��� �� ������ � �����.
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_02");	//��������, � ���� �������� ���-������ ��� ����. ���� ��� ���������?
};


instance DIA_RETHON_TRADE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 11;
	condition = dia_rethon_trade_condition;
	information = dia_rethon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "��� �� ������ ������� ���?";
};


func int dia_rethon_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_meinewaffe))
	{
		return TRUE;
	};
};

func void dia_rethon_trade_info()
{
	AI_Output(other,self,"DIA_Rethon_TRADE_15_00");	//��� �� ������ ������� ���?
	b_givetradeinv(self);
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_01");	//��, ��� ����� � ���������! ������ � ���� ������ ��� ������ ��������!
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_02");	//� ���� ���� ��� ���� ��� ����, �� ��� �� �� ������ ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_03");	//�����, � ���� ���� ������ ��, ��� ���� �����, ��������.
	};
};


instance DIA_RETHON_PICKPOCKET(C_INFO)
{
	npc = djg_709_rethon;
	nr = 900;
	condition = dia_rethon_pickpocket_condition;
	information = dia_rethon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_rethon_pickpocket_condition()
{
	return c_beklauen(78,230);
};

func void dia_rethon_pickpocket_info()
{
	Info_ClearChoices(dia_rethon_pickpocket);
	Info_AddChoice(dia_rethon_pickpocket,DIALOG_BACK,dia_rethon_pickpocket_back);
	Info_AddChoice(dia_rethon_pickpocket,DIALOG_PICKPOCKET,dia_rethon_pickpocket_doit);
};

func void dia_rethon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rethon_pickpocket);
};

func void dia_rethon_pickpocket_back()
{
	Info_ClearChoices(dia_rethon_pickpocket);
};

