
instance DIA_SYLVIO_EXIT(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 999;
	condition = dia_sylvio_exit_condition;
	information = dia_sylvio_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sylvio_exit_condition()
{
	return TRUE;
};

func void dia_sylvio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_HALLO(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 1;
	condition = dia_sylvio_hallo_condition;
	information = dia_sylvio_hallo_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_sylvio_hallo_condition()
{
	return TRUE;
};

func void dia_sylvio_hallo_info()
{
	AI_Output(other,self,"DIA_Sylvio_Hallo_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Sylvio_Hallo_09_01");	//����� � ����� ���� ���������� ���������� �� ���?
	SYLVIO_ANGEQUATSCHT = SYLVIO_ANGEQUATSCHT + 1;
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_THEKLA(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 2;
	condition = dia_sylvio_thekla_condition;
	information = dia_sylvio_thekla_info;
	permanent = FALSE;
	description = "����� �������, ��� � ��� �������� � �����.";
};


func int dia_sylvio_thekla_condition()
{
	if(Npc_KnowsInfo(other,dia_thekla_problem))
	{
		return TRUE;
	};
};

func void dia_sylvio_thekla_info()
{
	AI_Output(other,self,"DIA_Sylvio_Thekla_15_00");	//����� �������, ��� � ��� �������� � �����.
	AI_Output(self,other,"DIA_Sylvio_Thekla_09_01");	//��? � ��� �� �������� � ���� ����� ����? � ������ ��� �� ������ ����?
	AI_Output(other,self,"DIA_Sylvio_Thekla_15_02");	//�� ��������� ������, ���� ������...
	AI_Output(self,other,"DIA_Sylvio_Thekla_09_03");	//(�������-����������) ������ �� ���� �� �������� ���� ������ � ���� ������ �����?
	SYLVIO_ANGEQUATSCHT = SYLVIO_ANGEQUATSCHT + 1;
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_GOSSIP(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 3;
	condition = dia_sylvio_gossip_condition;
	information = dia_sylvio_gossip_info;
	permanent = FALSE;
	description = "� ���� ������ �������...";
};


func int dia_sylvio_gossip_condition()
{
	return TRUE;
};

func void dia_sylvio_gossip_info()
{
	AI_Output(other,self,"DIA_Sylvio_Gossip_15_00");	//� ���� ������ �������...
	AI_Output(self,other,"DIA_Sylvio_Gossip_09_01");	//��� ������ ������� ������� �����.
	SYLVIO_ANGEQUATSCHT = SYLVIO_ANGEQUATSCHT + 1;
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_ABOUTLEE(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 4;
	condition = dia_sylvio_aboutlee_condition;
	information = dia_sylvio_aboutlee_info;
	permanent = FALSE;
	description = "��� �� ������� � ��?";
};


func int dia_sylvio_aboutlee_condition()
{
	return TRUE;
};

func void dia_sylvio_aboutlee_info()
{
	AI_Output(other,self,"DIA_Sylvio_AboutLee_15_00");	//��� �� ������� � ��?
	AI_Output(self,other,"DIA_Sylvio_AboutLee_09_01");	//(������ ��������) ��, �� ������� ����. � �� �� ���� �������� � ������� � ���.
	AI_Output(self,other,"DIA_Sylvio_AboutLee_09_02");	//(�������) ���� �������, �� ����� ���� �� ��������.
	SYLVIO_ANGEQUATSCHT = SYLVIO_ANGEQUATSCHT + 1;
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_MENDEFEATED(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 5;
	condition = dia_sylvio_mendefeated_condition;
	information = dia_sylvio_mendefeated_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sylvio_mendefeated_condition()
{
	var int victories;
	victories = 0;
	if(rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		victories = victories + 1;
	};
	if(sentenza.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		victories = victories + 1;
	};
	if(fester.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		victories = victories + 1;
	};
	if(raoul.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		victories = victories + 1;
	};
	if(bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		victories = victories + 1;
	};
	if((MIS_JARVIS_SLDKO != FALSE) && (victories >= 2))
	{
		return TRUE;
	};
};

func void dia_sylvio_mendefeated_info()
{
	AI_Output(self,other,"DIA_Sylvio_MenDefeated_09_00");	//��� �������, �� ������ ��� �� ���� ������!
	AI_Output(self,other,"DIA_Sylvio_MenDefeated_09_01");	//��������� � ����, �� ���� �� ������� ��.
	AI_Output(self,other,"DIA_Sylvio_MenDefeated_09_02");	//� ������������ ����! ����� ����� ������ �����������, � ����� �� �������� � ����� ���������!
	SYLVIO_MENDEFEATED = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_ASSHOLE(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 2;
	condition = dia_sylvio_asshole_condition;
	information = dia_sylvio_asshole_info;
	permanent = FALSE;
	description = "��, ������...";
};


func int dia_sylvio_asshole_condition()
{
	if(SYLVIO_ANGEQUATSCHT >= 1)
	{
		return TRUE;
	};
};

func void dia_sylvio_asshole_info()
{
	AI_Output(other,self,"DIA_Sylvio_Asshole_15_00");	//��, ������...
	AI_Output(self,other,"DIA_Sylvio_Asshole_09_01");	//�� ���, ������������� �������, ��� � ������ ���� �� �����?
	AI_Output(self,other,"DIA_Sylvio_Asshole_09_02");	//���������� ����, ������ �� ������.
	SYLVIO_ANGEQUATSCHT = SYLVIO_ANGEQUATSCHT + 1;
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIOSLD_PICKPOCKET(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 900;
	condition = dia_sylviosld_pickpocket_condition;
	information = dia_sylviosld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_sylviosld_pickpocket_condition()
{
	return c_beklauen(80,210);
};

func void dia_sylviosld_pickpocket_info()
{
	Info_ClearChoices(dia_sylviosld_pickpocket);
	Info_AddChoice(dia_sylviosld_pickpocket,DIALOG_BACK,dia_sylviosld_pickpocket_back);
	Info_AddChoice(dia_sylviosld_pickpocket,DIALOG_PICKPOCKET,dia_sylviosld_pickpocket_doit);
};

func void dia_sylviosld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sylviosld_pickpocket);
};

func void dia_sylviosld_pickpocket_back()
{
	Info_ClearChoices(dia_sylviosld_pickpocket);
};

