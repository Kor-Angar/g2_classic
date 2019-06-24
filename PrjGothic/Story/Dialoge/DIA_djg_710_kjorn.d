
instance DIA_KJORN_EXIT(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 999;
	condition = dia_kjorn_exit_condition;
	information = dia_kjorn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kjorn_exit_condition()
{
	return TRUE;
};

func void dia_kjorn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KJORN_HELLO(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 4;
	condition = dia_kjorn_hello_condition;
	information = dia_kjorn_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_kjorn_hello_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return TRUE;
	};
};

func void dia_kjorn_hello_info()
{
	AI_Output(self,other,"DIA_Kjorn_Hello_06_00");	//��, ��� ����!
	AI_Output(other,self,"DIA_Kjorn_Hello_15_01");	//���� ����?
	AI_Output(self,other,"DIA_Kjorn_Hello_06_02");	//��� ������ - ������� �����, � ��� ����������� ���������� �� ����� ������ ������� ���� ������.
	AI_Output(other,self,"DIA_Kjorn_Hello_15_03");	//� �������, ��� � ���� ��� ��� ���������� ����������.
	AI_Output(self,other,"DIA_Kjorn_Hello_06_04");	//������. � � ���� ���� ������� ��� ����.
};


instance DIA_KJORN_TRADE(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 4;
	condition = dia_kjorn_trade_condition;
	information = dia_kjorn_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "��� �� ������ ���������� ���?";
};


func int dia_kjorn_trade_condition()
{
	return TRUE;
};

func void dia_kjorn_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Kjorn_TRADE_15_00");	//��� �� ������ ���������� ���?
};


instance DIA_KJORN_SELLINFOS(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_sellinfos_condition;
	information = dia_kjorn_sellinfos_info;
	permanent = FALSE;
	description = "� ����������� �� �� ��������?";
};


func int dia_kjorn_sellinfos_condition()
{
	return TRUE;
};

func void dia_kjorn_sellinfos_info()
{
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_00");	//� ����������� �� �� ��������?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_01");	//����� ����. ���� ���� ����������, � �������� ���� ���, ��� � ����.
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_02");	//������� �� ������?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_03");	//���... ������ �������. ��, �����, 50 ������� �� ������ ����������, ��� �� ��������, ����� ���������.
};


instance DIA_KJORN_BUYINFOS(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_buyinfos_condition;
	information = dia_kjorn_buyinfos_info;
	permanent = TRUE;
	description = "��� ����� ���-����� ����������.";
};


func int dia_kjorn_buyinfos_condition()
{
	if(Npc_KnowsInfo(other,dia_kjorn_sellinfos))
	{
		return TRUE;
	};
};

func void dia_kjorn_buyinfos_info()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_15_00");	//��� ����� ����������.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_06_01");	//50 �������!
	Info_ClearChoices(dia_kjorn_buyinfos);
	Info_AddChoice(dia_kjorn_buyinfos,"��� ������� ������ ��� ����.",dia_kjorn_buyinfos_holdmoney);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"��, �����.",dia_kjorn_buyinfos_givemoney);
	};
};

func void dia_kjorn_buyinfos_holdmoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_HoldMoney_15_00");	//��� ������� ������ ��� ����.
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_givemoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_00");	//���, �����.
	b_giveinvitems(other,self,itmi_gold,50);
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_01");	//������ ����� ���...
	Info_ClearChoices(dia_kjorn_buyinfos);
	Info_AddChoice(dia_kjorn_buyinfos,DIALOG_BACK,dia_kjorn_buyinfos_back);
	if(KJORNTOLDDRAGON == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... ������ ��������.",dia_kjorn_buyinfos_dragon1);
	}
	else if(KJORNTOLDDRAGON == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... ��� � ��������.",dia_kjorn_buyinfos_dragon2);
	};
	if(KJORNTOLDCOLONY == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... � ������ ��������.",dia_kjorn_buyinfos_colony1);
	}
	else if(KJORNTOLDCOLONY == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... ��� � ������ ��������.",dia_kjorn_buyinfos_colony2);
	};
	if(KJORNTOLDOLDCAMP == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... � �����.",dia_kjorn_buyinfos_oldcamp1);
	};
	if(KJORNTOLDORKS == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... �� �����.",dia_kjorn_buyinfos_orks1);
	}
	else if(KJORNTOLDORKS == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... ��� �� �����.",dia_kjorn_buyinfos_orks2);
	};
};

func void dia_kjorn_buyinfos_back()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Back_15_00");	//������, ����� ��� ��� ������, � ���������.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Back_06_01");	//��� ������.
	b_giveinvitems(self,other,itmi_gold,50);
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_dragon1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon1_15_00");	//�������� ��� � ��������.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01");	//������� - ��� ������� ���������� ������� ��������. �����-�� �� ���� ������ ������.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02");	//�� ��� ������ ����� ��� �� ������ �� ��� �� ���� �����.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03");	//�� ����� ������, ��� ������� �����. ���� ��� ��������� � ���� �����, ���� ������ ��������� � ������. ��, ��� � ������...
	KJORNTOLDDRAGON = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_dragon2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon2_15_00");	//�������� ��� ��������� � ��������.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01");	//��� ������� ������.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02");	//��������� �� ��� ����� ������� ����� ����� ���� ��������� ����� ��������.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03");	//������ �� ������������ ���� � ���������� ��������� ��� � ��������.
	b_logentry(TOPIC_DRACHENJAGD,"������� �� �������� ����� ��������, ��� ������� ������ ��������� �����. ��������� �� ��� ������������ ��������, ����� �����, � ������, �� ��� ������, ������ �������� �����.");
	KJORNTOLDDRAGON = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_colony1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony1_15_00");	//�������� ��� � ������ ��������.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_01");	//������ �������� �������� �������� ���� ������ ��-�� ����� ���������� ����.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_02");	//��� ���� - ������������ �����, ��� ����������� ���������� ����.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_03");	//������, ���������� �� ���� ����, ������� �� �������� � ����� ������� ���� ����� ������� �����.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_04");	//�� ���������� ������� ��� ������ ���� �������� ���������� ��������. �� ��� �����������, � ����� �� ��� ����� ������.
	KJORNTOLDCOLONY = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_colony2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony2_15_00");	//�������� ��� ��������� � ������ ��������.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_01");	//������ ������ ���������� �� ��������� ��������� ����.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_02");	//����� ������ ����, ������ � ���� ��������� � ������ ������� ��������, ������ �� ������� ������ ������� ����� �� ������.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_03");	//�������, ��� ��������� ���������-�������� ��� ��� ��������� � ������, �� � �� ������, ��� ��� ��� ����.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_04");	//��������� �����������, ��� ��� �������� ������� ����� ������� �������� � ��� ������.
	KJORNTOLDCOLONY = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_oldcamp1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_OldCamp1_15_00");	//�������� ��� � �����.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01");	//�� ��������� � ����� ������ ������ ��������.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02");	//����� ������ ��� ���� �������, ������ ������ �������������� ��� �������� ����� ������.
	KJORNTOLDOLDCAMP = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_orks1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks1_15_00");	//�������� ��� �� �����.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_01");	//���� ��������� ����� �������. �� ������� ����, �� ����, ��� ������ ����� ������.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_02");	//�� ��� �����������, ��� ������������� ��� ���� �����. ���� ������ ������� �����, �� ������ �� �� ���.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_03");	//� ��� ���� �������� ����������� �������. ��� ����, �� �� �� ����� ����.
	KJORNTOLDORKS = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_orks2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks2_15_00");	//�������� ��� ��������� �� �����.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_01");	//����� ����������� ������� �����. ��� ����� ����� ������ � �������� � ������� �������. �� ����� ���������� �����.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_02");	//� ���-�� �����, ��� ���� �� ��� ������ ������� ��� ����� ������ ������ ������.
	KJORNTOLDORKS = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};


instance DIA_KJORN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_alldragonsdead_condition;
	information = dia_kjorn_alldragonsdead_info;
	permanent = FALSE;
	description = "� ���� ���� ��������!";
};


func int dia_kjorn_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_kjorn_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Kjorn_AllDragonsDead_15_00");	//� ���� ���� ��������!
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_01");	//(�������) �������, � � �������.
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_02");	//��������, �� ���� ������, �� ����� ����? ���, ����� ������, ������� ������� ����.
};


instance DIA_KJORN_PICKPOCKET(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 900;
	condition = dia_kjorn_pickpocket_condition;
	information = dia_kjorn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_kjorn_pickpocket_condition()
{
	return c_beklauen(47,75);
};

func void dia_kjorn_pickpocket_info()
{
	Info_ClearChoices(dia_kjorn_pickpocket);
	Info_AddChoice(dia_kjorn_pickpocket,DIALOG_BACK,dia_kjorn_pickpocket_back);
	Info_AddChoice(dia_kjorn_pickpocket,DIALOG_PICKPOCKET,dia_kjorn_pickpocket_doit);
};

func void dia_kjorn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kjorn_pickpocket);
};

func void dia_kjorn_pickpocket_back()
{
	Info_ClearChoices(dia_kjorn_pickpocket);
};

