
instance DIA_REGA_EXIT(C_INFO)
{
	npc = bau_933_rega;
	nr = 999;
	condition = dia_rega_exit_condition;
	information = dia_rega_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rega_exit_condition()
{
	return TRUE;
};

func void dia_rega_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_REGA_HALLO(C_INFO)
{
	npc = bau_933_rega;
	nr = 3;
	condition = dia_rega_hallo_condition;
	information = dia_rega_hallo_info;
	description = "��� ����?";
};


func int dia_rega_hallo_condition()
{
	return TRUE;
};

func void dia_rega_hallo_info()
{
	AI_Output(other,self,"DIA_Rega_HALLO_15_00");	//��� ����?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_01");	//�� �� ������, ��?
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_02");	//�� ���� �� ��������� �����, ��?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_03");	//�� ���, ��?
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_04");	//�� ���������, ��?
	};
	AI_Output(self,other,"DIA_Rega_HALLO_17_05");	//�� ����� �����, � �� ��������� ������ ���������.
	AI_Output(other,self,"DIA_Rega_HALLO_15_06");	//������?
	AI_Output(self,other,"DIA_Rega_HALLO_17_07");	//��� ����� � ������-�� �� ���� ����, �� ���� �� �� ���� � ���� � �����������, ���� �������� �� ������.
	AI_Output(self,other,"DIA_Rega_HALLO_17_08");	//�� ��������� ����� ���� ����� ����� ������ ����������.
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_09");	//������� �������, ������� ������� ���������� ��� ������, � �������� ������ �������.
	};
};


instance DIA_REGA_ONAR(C_INFO)
{
	npc = bau_933_rega;
	nr = 4;
	condition = dia_rega_onar_condition;
	information = dia_rega_onar_info;
	description = "�� ������� ���������?";
};


func int dia_rega_onar_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_rega_onar_info()
{
	AI_Output(other,self,"DIA_Rega_ONAR_15_00");	//�� ������� ���������?
	AI_Output(self,other,"DIA_Rega_ONAR_17_01");	//�������. ���� ��������� ���-�� �� ����������, �� �������� ����� ���������, � ������ ����� �������� ����� �� �����.
	AI_Output(self,other,"DIA_Rega_ONAR_17_02");	//��� ��� �� ������������ �����������.
};


instance DIA_REGA_SLD(C_INFO)
{
	npc = bau_933_rega;
	nr = 5;
	condition = dia_rega_sld_condition;
	information = dia_rega_sld_info;
	description = "����� �������� �� ������ ���������� ������� ��������?";
};


func int dia_rega_sld_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_rega_sld_info()
{
	AI_Output(other,self,"DIA_Rega_SLD_15_00");	//����� �������� �� ������ ���������� ������� ��������?
	AI_Output(self,other,"DIA_Rega_SLD_17_01");	//� �� ����, �� ��� �� ��� ������, �� �� ����� �� �� ��, ����� ��� �������� ������� �����.
	AI_Output(self,other,"DIA_Rega_SLD_17_02");	//� �������� � �������� ��������� ������ ��������, ���������� � ���� �����, ���������� ������ �����.
};


instance DIA_REGA_BANDITEN(C_INFO)
{
	npc = bau_933_rega;
	nr = 6;
	condition = dia_rega_banditen_condition;
	information = dia_rega_banditen_info;
	description = "��� �� ����������� �� ��������?";
};


func int dia_rega_banditen_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo))
	{
		return TRUE;
	};
};

func void dia_rega_banditen_info()
{
	AI_Output(other,self,"DIA_Rega_BANDITEN_15_00");	//��� �� ����������� �� ��������?
	AI_Output(self,other,"DIA_Rega_BANDITEN_17_01");	//�� �� ����������. �� �����. � ��� ��� ��� ��������?
};


instance DIA_REGA_BRONKO(C_INFO)
{
	npc = bau_933_rega;
	nr = 7;
	condition = dia_rega_bronko_condition;
	information = dia_rega_bronko_info;
	description = "(�������� � ������)";
};


func int dia_rega_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_bronko_hallo) && (MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_rega_bronko_info()
{
	AI_Output(other,self,"DIA_Rega_BRONKO_15_00");	//� ��� ���� ��������� ��� ��� ���?
	AI_Output(self,other,"DIA_Rega_BRONKO_17_01");	//�� ����� ���� �����������, �� ��� �� ����� ��������. ������ ����-������ ���.
	AI_StopProcessInfos(self);
};


instance DIA_REGA_PERMKAP1(C_INFO)
{
	npc = bau_933_rega;
	nr = 7;
	condition = dia_rega_permkap1_condition;
	information = dia_rega_permkap1_info;
	permanent = TRUE;
	description = "���� ���.";
};


func int dia_rega_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo))
	{
		return TRUE;
	};
};

func void dia_rega_permkap1_info()
{
	AI_Output(other,self,"DIA_Rega_PERMKAP1_15_00");	//���� ���.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_01");	//���� ����� ��������. �� ���� ������ � ������.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_02");	//���� �� ��, ��������, �� ���������� ��� ������� �������, ����� ����� ���� �� �� ����� �� ������.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_03");	//����� ������ ���������� ��� ������ � ������. �������, �� �� ��������� �� ���. �� ����� ��� - � ������ ��� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_04");	//��� �� ���-�� �����, ������� �� ����� �������� ������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_REGA_PICKPOCKET(C_INFO)
{
	npc = bau_933_rega;
	nr = 900;
	condition = dia_rega_pickpocket_condition;
	information = dia_rega_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_rega_pickpocket_condition()
{
	return c_beklauen(25,40);
};

func void dia_rega_pickpocket_info()
{
	Info_ClearChoices(dia_rega_pickpocket);
	Info_AddChoice(dia_rega_pickpocket,DIALOG_BACK,dia_rega_pickpocket_back);
	Info_AddChoice(dia_rega_pickpocket,DIALOG_PICKPOCKET,dia_rega_pickpocket_doit);
};

func void dia_rega_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rega_pickpocket);
};

func void dia_rega_pickpocket_back()
{
	Info_ClearChoices(dia_rega_pickpocket);
};

