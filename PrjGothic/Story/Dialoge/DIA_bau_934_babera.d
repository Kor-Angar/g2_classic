
instance DIA_BABERA_EXIT(C_INFO)
{
	npc = bau_934_babera;
	nr = 999;
	condition = dia_babera_exit_condition;
	information = dia_babera_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babera_exit_condition()
{
	return TRUE;
};

func void dia_babera_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABERA_HALLO(C_INFO)
{
	npc = bau_934_babera;
	nr = 1;
	condition = dia_babera_hallo_condition;
	information = dia_babera_hallo_info;
	description = "������, ���������.";
};


func int dia_babera_hallo_condition()
{
	return TRUE;
};

func void dia_babera_hallo_info()
{
	AI_Output(other,self,"DIA_Babera_HALLO_15_00");	//������, ���������.
	AI_Output(self,other,"DIA_Babera_HALLO_16_01");	//������ �������� �� ���. ����� ����� �����, ��� ���� �����. � ������.
};


instance DIA_BABERA_WIESIEHTSAUS(C_INFO)
{
	npc = bau_934_babera;
	nr = 2;
	condition = dia_babera_wiesiehtsaus_condition;
	information = dia_babera_wiesiehtsaus_info;
	description = "��� ���� ������ � ����?";
};


func int dia_babera_wiesiehtsaus_condition()
{
	if(Npc_KnowsInfo(other,dia_babera_hallo))
	{
		return TRUE;
	};
};

func void dia_babera_wiesiehtsaus_info()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_15_00");	//��� ���� ������ � ����?
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_01");	//�������� �� ��� �������� ����, ������� �� ����� ����������, � �� ��� ��� �������.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_02");	//�� ������ ���������� �� ����?
	Info_ClearChoices(dia_babera_wiesiehtsaus);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_babera_wiesiehtsaus,"������-�� ���. � ���� ����� ���������.",dia_babera_wiesiehtsaus_nein);
		Info_AddChoice(dia_babera_wiesiehtsaus,"����� ����.",dia_babera_wiesiehtsaus_vielleicht);
	};
};

func void dia_babera_wiesiehtsaus_vielleicht()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00");	//����� ����.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01");	//����� ���� ����� ���������� � ����� ��������, �������. �����, � ���� �������� ������ ��� ����.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02");	//��, ��� �������� ����� ������ �� ����� �����. ��� ��������� � ����� ���� ������.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03");	//�� ������ ���� ���������� � ����������. ��� �� ����� �������.
	Info_ClearChoices(dia_babera_wiesiehtsaus);
};

func void dia_babera_wiesiehtsaus_nein()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Nein_15_00");	//������-�� ���. � ���� ����� ���������.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Nein_16_01");	//����� �� ��� ���� ������. ��� �������� �� ����� �����.
	Info_ClearChoices(dia_babera_wiesiehtsaus);
};


instance DIA_BABERA_BRONKO(C_INFO)
{
	npc = bau_934_babera;
	nr = 3;
	condition = dia_babera_bronko_condition;
	information = dia_babera_bronko_info;
	description = "(�������� � ������)";
};


func int dia_babera_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_bronko_hallo) && Npc_KnowsInfo(other,dia_babera_wiesiehtsaus))
	{
		return TRUE;
	};
};

func void dia_babera_bronko_info()
{
	AI_Output(other,self,"DIA_Babera_BRONKO_15_00");	//�����, ��� ��� ���, ��� ����� ���...
	AI_Output(self,other,"DIA_Babera_BRONKO_16_01");	//��� ������. ����� �� ����?
	AI_Output(other,self,"DIA_Babera_BRONKO_15_02");	//��� ��� ������?
	AI_Output(self,other,"DIA_Babera_BRONKO_16_03");	//(�������) ��� �� ������ ����? ��� ������ �����. � ������ ������ ������ � ����������. �� ������� ��� ���.
	AI_Output(self,other,"DIA_Babera_BRONKO_16_04");	//��� ������ ����� �� ���������� ������ ����, ��� �� �� ��������.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_05");	//�� ������ �� ������. ������ ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_06");	//������ �������� ����� ��������� ��� ��������. �� ����� ������ ��.
	};
	BABERA_BRONKOKEINBAUER = TRUE;
};


instance DIA_BABERA_ROSI(C_INFO)
{
	npc = bau_934_babera;
	nr = 3;
	condition = dia_babera_rosi_condition;
	information = dia_babera_rosi_info;
	description = "� ��� ����?";
};


func int dia_babera_rosi_condition()
{
	if((MIS_BRINGROSIBACKTOSEKOB == LOG_RUNNING) && (KAPITEL >= 5) && (ROSIFOUNDKAP5 == FALSE))
	{
		return TRUE;
	};
};

func void dia_babera_rosi_info()
{
	AI_Output(other,self,"DIA_Babera_Rosi_15_00");	//� ��� ����?
	AI_Output(self,other,"DIA_Babera_Rosi_16_01");	//��� ������ �� ����� �������� ����� ����� � ���� �� �����, � ���.
	b_logentry(TOPIC_ROSISFLUCHT,"���� ������� � ����� ������. ������ �������, ��� ��� ����������� �� �����, � ���.");
	b_logentry(TOPIC_BRINGROSIBACKTOSEKOB,"���� ������� � ����� ������. ������ �������, ��� ��� ����������� �� �����, � ���.");
};


instance DIA_BABERA_DUSTOERST(C_INFO)
{
	npc = bau_934_babera;
	nr = 10;
	condition = dia_babera_dustoerst_condition;
	information = dia_babera_dustoerst_info;
	permanent = TRUE;
	description = "� ����� �����?";
};


func int dia_babera_dustoerst_condition()
{
	if(Npc_KnowsInfo(other,dia_babera_bronko))
	{
		return TRUE;
	};
};

func void dia_babera_dustoerst_info()
{
	AI_Output(other,self,"DIA_Babera_DUSTOERST_15_00");	//���� ���-������ ���?
	AI_Output(self,other,"DIA_Babera_DUSTOERST_16_01");	//� ������.
	AI_StopProcessInfos(self);
};


instance DIA_BABERA_PICKPOCKET(C_INFO)
{
	npc = bau_934_babera;
	nr = 900;
	condition = dia_babera_pickpocket_condition;
	information = dia_babera_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20_FEMALE;
};


func int dia_babera_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_babera_pickpocket_info()
{
	Info_ClearChoices(dia_babera_pickpocket);
	Info_AddChoice(dia_babera_pickpocket,DIALOG_BACK,dia_babera_pickpocket_back);
	Info_AddChoice(dia_babera_pickpocket,DIALOG_PICKPOCKET,dia_babera_pickpocket_doit);
};

func void dia_babera_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_babera_pickpocket);
};

func void dia_babera_pickpocket_back()
{
	Info_ClearChoices(dia_babera_pickpocket);
};

