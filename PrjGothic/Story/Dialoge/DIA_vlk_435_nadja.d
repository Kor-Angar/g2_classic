
instance DIA_NADJA_EXIT(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 999;
	condition = dia_nadja_exit_condition;
	information = dia_nadja_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nadja_exit_condition()
{
	return TRUE;
};

func void dia_nadja_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_PICKPOCKET(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 900;
	condition = dia_nadja_pickpocket_condition;
	information = dia_nadja_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_nadja_pickpocket_condition()
{
	return c_beklauen(40,40);
};

func void dia_nadja_pickpocket_info()
{
	Info_ClearChoices(dia_nadja_pickpocket);
	Info_AddChoice(dia_nadja_pickpocket,DIALOG_BACK,dia_nadja_pickpocket_back);
	Info_AddChoice(dia_nadja_pickpocket,DIALOG_PICKPOCKET,dia_nadja_pickpocket_doit);
};

func void dia_nadja_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_nadja_pickpocket);
};

func void dia_nadja_pickpocket_back()
{
	Info_ClearChoices(dia_nadja_pickpocket);
};


instance DIA_NADJA_STANDARD(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_standard_condition;
	information = dia_nadja_standard_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_nadja_standard_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BROMOR_PAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_nadja_standard_info()
{
	AI_Output(self,other,"DIA_Nadja_STANDARD_16_00");	//��, � �� ���� �������� ����� ������, �����. ���� ������ ����������, �������� � ��������.
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_DANACH(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_danach_condition;
	information = dia_nadja_danach_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_nadja_danach_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BROMOR_PAY == FALSE) && (NADJA_NACHT == TRUE))
	{
		return TRUE;
	};
};

func void dia_nadja_danach_info()
{
	AI_Output(self,other,"DIA_Nadja_Danach_16_00");	//������ � ������ ���.
	NADJA_NACHT = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_HOCHGEHEN(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_hochgehen_condition;
	information = dia_nadja_hochgehen_info;
	important = FALSE;
	permanent = TRUE;
	description = "����� ������.";
};


func int dia_nadja_hochgehen_condition()
{
	if(BROMOR_PAY == 1)
	{
		return TRUE;
	};
};

func void dia_nadja_hochgehen_info()
{
	AI_Output(other,self,"DIA_Nadja_hochgehen_15_00");	//����� ������.
	AI_Output(self,other,"DIA_Nadja_hochgehen_16_01");	//������� ���� ����� ���������� �����, �����. ������.
	BROMOR_PAY = 2;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DANCE");
};


instance DIA_NADJA_POPPEN(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_poppen_condition;
	information = dia_nadja_poppen_info;
	permanent = TRUE;
	description = "(����������)";
};


func int dia_nadja_poppen_condition()
{
	if((BROMOR_PAY == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 200))
	{
		return TRUE;
	};
};

func void dia_nadja_poppen_info()
{
	AI_Output(self,other,"DIA_Nadja_Poppen_16_00");	//��������� ���� ����� ����������� ������ ���.
	AI_Output(self,other,"DIA_Nadja_Poppen_16_01");	//����������. ������ � ������� ������������.
	Info_ClearChoices(dia_nadja_poppen);
	Info_AddChoice(dia_nadja_poppen,"������ ...",dia_nadja_poppen_start);
};

func void dia_nadja_poppen_start()
{
	BROMOR_PAY = FALSE;
	NADJA_NACHT = NADJA_NACHT + 1;
	PlayVideo("LOVESCENE.BIK");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_NADJA_BUYHERB(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_buyherb_condition;
	information = dia_nadja_buyherb_info;
	permanent = TRUE;
	description = "���� � ����� ������ ������?";
};


func int dia_nadja_buyherb_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (Npc_KnowsInfo(other,dia_nadja_want_herb) == FALSE) && (NADJA_MONEY == FALSE))
	{
		return TRUE;
	};
};

func void dia_nadja_buyherb_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_BUYHERB_15_00");	//���� � ����� ������ ������?
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 200)
	{
		if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_01");	//������ ��� �����? �� � ���� �� �����, ��� ����� �� ������� �� ���������� ���������.
			UNDERCOVER_FAILED = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_02");	//������� ��������� �������, � � �����, ��� �� �������.
			AI_Output(other,self,"DIA_Nadja_BUYHERB_15_03");	//������� �� ������?
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_04");	//50 ������� ����� ����������.
			NADJA_MONEY = TRUE;
		};
	}
	else
	{
		b_say(self,other,"$NOTNOW");
	};
};


instance DIA_NADJA_WANT_HERB(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_want_herb_condition;
	information = dia_nadja_want_herb_info;
	permanent = FALSE;
	description = "� ������ ����� ���, ��� ����� ������ ������ (��������� 50 �������).";
};


func int dia_nadja_want_herb_condition()
{
	if((Npc_HasItems(other,itmi_gold) >= 50) && (NADJA_MONEY == TRUE) && (MIS_ANDRE_REDLIGHT == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_nadja_want_herb_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_WANT_HERB_15_00");	//� ������ ����� ���, ��� ����� ������ ������.
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_01");	//������, � ������.
	}
	else
	{
		b_giveinvitems(other,self,itmi_gold,50);
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_02");	//�������� � ������, �����. � ���� �������� ������ ��� ����.
		KNOWS_BORKA_DEALER = TRUE;
	};
};

