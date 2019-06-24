
instance DIA_CORAGON_EXIT(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 999;
	condition = dia_coragon_exit_condition;
	information = dia_coragon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_coragon_exit_condition()
{
	return TRUE;
};

func void dia_coragon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORAGON_PICKPOCKET(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 900;
	condition = dia_coragon_pickpocket_condition;
	information = dia_coragon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_coragon_pickpocket_condition()
{
	return c_beklauen(40,45);
};

func void dia_coragon_pickpocket_info()
{
	Info_ClearChoices(dia_coragon_pickpocket);
	Info_AddChoice(dia_coragon_pickpocket,DIALOG_BACK,dia_coragon_pickpocket_back);
	Info_AddChoice(dia_coragon_pickpocket,DIALOG_PICKPOCKET,dia_coragon_pickpocket_doit);
};

func void dia_coragon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_coragon_pickpocket);
};

func void dia_coragon_pickpocket_back()
{
	Info_ClearChoices(dia_coragon_pickpocket);
};


instance DIA_CORAGON_HALLO(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_hallo_condition;
	information = dia_coragon_hallo_info;
	permanent = FALSE;
	description = "���� � ������ �����?";
};


func int dia_coragon_hallo_condition()
{
	return TRUE;
};

func void dia_coragon_hallo_info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//���� � ������ �����?
	AI_Output(self,other,"DIA_Coragon_Add_05_00");	//���� � ���� ���� ������, �� ���� ������ ������ �����, ���� ������, �������.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"� ���� �������� ��� � ����� � ����������� ��������.");
};


instance DIA_CORAGON_TRADE(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_trade_condition;
	information = dia_coragon_trade_info;
	permanent = TRUE;
	description = "������ ��� ���� ������.";
	trade = TRUE;
};


func int dia_coragon_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo))
	{
		return TRUE;
	};
};

func void dia_coragon_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//������ ��� ���� ������.
};


instance DIA_CORAGON_WHATSUP(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 3;
	condition = dia_coragon_whatsup_condition;
	information = dia_coragon_whatsup_info;
	permanent = FALSE;
	description = "��� ���� ����?";
};


func int dia_coragon_whatsup_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo))
	{
		return TRUE;
	};
};

func void dia_coragon_whatsup_info()
{
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_Coragon_Add_05_01");	//���, �� ��������� ���. ���� ����� ������� ���������� ���� �� ������� ������.
	AI_Output(self,other,"DIA_Coragon_Add_05_02");	//������ ����� ����� �� ������� ����, �� ����������� ������� �� �������� ��������.
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//� ��� � ���� �� ���?
	AI_Output(self,other,"DIA_Coragon_Add_05_04");	//(�������) ��������� �� ���� ����������� ����� ��������� �� �����.
	AI_Output(self,other,"DIA_Coragon_Add_05_05");	//������� ����� ���������, ��������, � ��� �� ��� �� ������.
	AI_Output(self,other,"DIA_Coragon_Add_05_06");	//�� � �� ���� �������� ��������. ��� ����� ������ ����, ��� � �����������.
	AI_Output(self,other,"DIA_Coragon_Add_05_07");	//� �� ��������, ��� ��� ������� �������, ���� �������� ������ � ���� ��������.
};


instance DIA_CORAGON_BESTOHLEN(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 4;
	condition = dia_coragon_bestohlen_condition;
	information = dia_coragon_bestohlen_info;
	permanent = FALSE;
	description = "���� ��������?";
};


func int dia_coragon_bestohlen_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup))
	{
		return TRUE;
	};
};

func void dia_coragon_bestohlen_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//���� ��������?
	AI_Output(self,other,"DIA_Coragon_Add_05_09");	//��, ��� ���� ��� �������� �����. ��� ����� ���� �������� ����� ������, � � ����� �������� ���� �� ������.
	AI_Output(self,other,"DIA_Coragon_Add_05_10");	//� ��������� ��-�� �������� ������ ���������, �� ����� ��������� ������ ���������� ��� ���� ��������.
	AI_Output(self,other,"DIA_Coragon_Add_05_11");	//� ��������� �� ������� � ���������, �� ���, ������� ��, ������ �� �����. ��� ������������ ��������� � ����� � ���������� �����.
	MIS_CORAGON_SILBER = LOG_RUNNING;
};


var int coragon_bier;

func void b_coragon_bier()
{
	CORAGON_BIER = CORAGON_BIER + 1;
	AI_Output(self,other,"DIA_Coragon_Add_05_14");	//��� - ������ ��� � �������� �������.
	b_giveinvitems(self,other,itfo_coragonsbeer,1);
	if(CORAGON_BIER < 2)
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_21");	//����� ������� ����. ��� ��� ��������� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_22");	//����� ��������� �����!
	};
};


instance DIA_CORAGON_BRINGSILBER(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 5;
	condition = dia_coragon_bringsilber_condition;
	information = dia_coragon_bringsilber_info;
	permanent = FALSE;
	description = "� ������ ���� �������.";
};


func int dia_coragon_bringsilber_condition()
{
	if((MIS_CORAGON_SILBER == LOG_RUNNING) && (Npc_HasItems(other,itmi_coragonssilber) >= 8))
	{
		return TRUE;
	};
};

func void dia_coragon_bringsilber_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_12");	//� ������ ���� �������.
	b_giveinvitems(other,self,itmi_coragonssilber,8);
	AI_Output(self,other,"DIA_Coragon_Add_05_13");	//�� ��?!
	b_giveplayerxp(XP_CORAGONSSILBER);
	b_coragon_bier();
	MIS_CORAGON_SILBER = LOG_SUCCESS;
};


instance DIA_CORAGON_SCHULDENBUCH(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 6;
	condition = dia_coragon_schuldenbuch_condition;
	information = dia_coragon_schuldenbuch_info;
	permanent = FALSE;
	description = "��������, ��� � ���� ����...";
};


func int dia_coragon_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_coragon_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_15");	//��������, ��� � ���� ����...
	AI_Output(self,other,"DIA_Coragon_Add_05_16");	//����? (���������) ��� �� �������� ������!
	AI_Output(self,other,"DIA_Coragon_Add_05_17");	//��� �� ����������� ������ � ���?
};


instance DIA_CORAGON_GIVEBOOK(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 7;
	condition = dia_coragon_givebook_condition;
	information = dia_coragon_givebook_info;
	permanent = FALSE;
	description = "��� ���� �����.";
};


func int dia_coragon_givebook_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_coragon_givebook_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//��� ���� �����.
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_Coragon_Add_05_19");	//�������! �� ���� ��� �������. ����� ����� ���� ����� �������, ���� �������.
	b_giveplayerxp(XP_SCHULDENBUCH);
	b_coragon_bier();
};


instance DIA_CORAGON_TOOV(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 9;
	condition = dia_coragon_toov_condition;
	information = dia_coragon_toov_info;
	permanent = FALSE;
	description = "��� ��� ������� � ������� �������?";
};


func int dia_coragon_toov_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup) && (other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_coragon_toov_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//��� ��� ������� � ������� �������?
	AI_Output(self,other,"DIA_Coragon_Add_05_24");	//�� ������ ���� ����������� ������. ���, ����� ���� ������.
	AI_Output(self,other,"DIA_Coragon_Add_05_25");	//����� ����� � �������� � ������ ����� ������. ��� ������� ���� �����������.
	AI_Output(self,other,"DIA_Coragon_Add_05_26");	//��, � ���� ����� ����� ������������, �������� � ������ ����� � ��������.
	AI_Output(self,other,"DIA_Coragon_Add_05_27");	//����� ����, �� ������ ���� � ��������� ������. ��� ���� ����� ������ � ������� �������.
};


instance DIA_CORAGON_VALENTINO(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 8;
	condition = dia_coragon_valentino_condition;
	information = dia_coragon_valentino_info;
	permanent = FALSE;
	description = "� ��� ��� ������ ���������?";
};


func int dia_coragon_valentino_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup))
	{
		return TRUE;
	};
};

func void dia_coragon_valentino_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_28");	//� ��� ��� ������ ���������?
	AI_Output(self,other,"DIA_Coragon_Add_05_29");	//�� ������ �����, � ��� �� ����� ��������. � �� ���������� ���� ����� �����.
	AI_Output(self,other,"DIA_Coragon_Add_05_30");	//������ �� ��� ������� ��� ���.
	AI_Output(self,other,"DIA_Coragon_Add_05_31");	//�� ����� ���� � ������ �������� ����� �� ��������. � �����, ���� �����, ������ � ����, � ������� �������.
	AI_Output(self,other,"DIA_Coragon_Add_05_32");	//� ��� ��� ��� � ����.
};


instance DIA_CORAGON_NEWS(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 1;
	condition = dia_coragon_news_condition;
	information = dia_coragon_news_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_coragon_news_condition()
{
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		if(REGIS_RING == TRUE)
		{
			return TRUE;
		};
	};
};

func void dia_coragon_news_info()
{
	AI_Output(self,other,"DIA_Coragon_Add_05_33");	//��������� �� ���� ��������� �� ������� ������� �����.
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_34");	//�� �������� ���-�� � ���, ��� ��� �������� � ��� �� �������� ��� �����... ���� �����!
	}
	else
	{
		AI_Output(self,other,"DIA_Coragon_Add_05_35");	//� �� ���� ����� �� ����� �� ����������, ��� � ���� ����� ���� �� �����.
		AI_Output(self,other,"DIA_Coragon_Add_05_36");	//����� �� ����� ���� � ������ � ������ ���������� ����. �� ������, ��� � ���� ������ �������...
	};
	AI_Output(other,self,"DIA_Coragon_Add_15_37");	//�? ��� �� ������?
	AI_Output(self,other,"DIA_Coragon_Add_05_38");	//��, � ����� ��� ������� ������, ��� �� ���?
};


instance DIA_CORAGON_RING(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 10;
	condition = dia_coragon_ring_condition;
	information = dia_coragon_ring_info;
	permanent = FALSE;
	description = "��� - ������ ��� ������.";
};


func int dia_coragon_ring_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_news) && (Npc_HasItems(other,itri_valentinosring) > 0))
	{
		return TRUE;
	};
};

func void dia_coragon_ring_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//��� - ������ ��� ������.
	b_giveinvitems(other,self,itri_valentinosring,1);
	AI_Output(self,other,"DIA_Coragon_Add_05_40");	//���? � �� �������...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//��� ������������ ���������.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//�� ������ �������� ��� ����������, ��� ��������� ���...
	b_giveplayerxp(300);
	AI_StopProcessInfos(self);
};

