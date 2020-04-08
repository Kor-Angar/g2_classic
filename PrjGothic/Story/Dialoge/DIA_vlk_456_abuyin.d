
instance DIA_ABUYIN_EXIT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 999;
	condition = dia_abuyin_exit_condition;
	information = dia_abuyin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_abuyin_exit_condition()
{
	return TRUE;
};

func void dia_abuyin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ABUYIN_PICKPOCKET(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 900;
	condition = dia_abuyin_pickpocket_condition;
	information = dia_abuyin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_abuyin_pickpocket_condition()
{
	return c_beklauen(75,200);
};

func void dia_abuyin_pickpocket_info()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_BACK,dia_abuyin_pickpocket_back);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_PICKPOCKET,dia_abuyin_pickpocket_doit);
};

func void dia_abuyin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_abuyin_pickpocket);
};

func void dia_abuyin_pickpocket_back()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
};


instance DIA_ABUYIN_HALLO(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_hallo_condition;
	information = dia_abuyin_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_abuyin_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_abuyin_hallo_info()
{
	AI_Output(self,other,"DIA_Abuyin_Hallo_13_00");	//����������� ���� ��� ����. ������� �� ��� �������� ������ � ��������� ����� �� ���� ������.
};


instance DIA_ABUYIN_DU(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_du_condition;
	information = dia_abuyin_du_info;
	permanent = FALSE;
	description = "��� ��?";
};


func int dia_abuyin_du_condition()
{
	return TRUE;
};

func void dia_abuyin_du_info()
{
	AI_Output(other,self,"DIA_Abuyin_du_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Abuyin_du_13_01");	//���� ����� ����� ��� ������ ��� ���� ����� ��� ����� ��� ������. � ������ � �������������, �������� � �������� �������.
};


instance DIA_ABUYIN_KRAUT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_kraut_condition;
	information = dia_abuyin_kraut_info;
	permanent = FALSE;
	description = "��� �� ����� �� �����������?";
};


func int dia_abuyin_kraut_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du))
	{
		return TRUE;
	};
};

func void dia_abuyin_kraut_info()
{
	AI_Output(other,self,"DIA_Abuyin_Kraut_15_00");	//��� �� ����� �� �����������?
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_01");	//��� ������ ������ ������, ���������� �������� �������.
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_02");	//�������, ��� ������, ��� �����������.
};


instance DIA_ABUYIN_ANDEREN(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_anderen_condition;
	information = dia_abuyin_anderen_info;
	permanent = FALSE;
	description = "� � ���� ���� ������ �����?";
};


func int dia_abuyin_anderen_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_kraut))
	{
		return TRUE;
	};
};

func void dia_abuyin_anderen_info()
{
	AI_Output(other,self,"DIA_Abuyin_anderen_15_00");	//� � ���� ���� ������ �����?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_01");	//� ��������� ������ ������ �����. ��� �������� ����� - �������� ���� ������ - ����� ��������.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_02");	//��, ������� ��, � ������ ����� ����������� ������ ���� ������ - ���� ���-������ ������ ����������� ������������� ������� �����.
	AI_Output(other,self,"DIA_Abuyin_anderen_15_03");	//� ��� ��� ��������?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_04");	//������ �� ������ �������� �����. � �������� ��������� � ���� ��������� �����������.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_05");	//��� �������� �� ������������ �����, ����, ������� �� ������ ������ � �������.
};


instance DIA_ABUYIN_WOHER(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_woher_condition;
	information = dia_abuyin_woher_info;
	permanent = FALSE;
	description = "��� ��� ����� �������� �����?";
};


func int dia_abuyin_woher_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen))
	{
		return TRUE;
	};
};

func void dia_abuyin_woher_info()
{
	AI_Output(other,self,"DIA_Abuyin_Woher_15_00");	//��� ��� ����� �������� �����?
	AI_Output(self,other,"DIA_Abuyin_Woher_13_01");	//� ��� ���� ��� ������. � ��� ����� � ����, ��� ���� ���������.
	AI_Output(self,other,"DIA_Abuyin_Woher_13_02");	//���� ���� ����������� ��� �����, �� ������� ���� ����� � ������, ������� �����. �� ���������� ��� ����� � ������� ���.
	b_giveinvitems(self,other,itmi_apfeltabak,2);
};

func void b_tabakprobieren()
{
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_00");	//������� ��� ����������� ���� �����.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_01");	//���, ���� ������ ��� �� ����� ��������. ��, ����� ����, �� ������� ����-������, ��� ������ ���... �-�... ������������.
};


instance DIA_ABUYIN_MISCHUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 10;
	condition = dia_abuyin_mischung_condition;
	information = dia_abuyin_mischung_info;
	permanent = TRUE;
	description = "� ������ ����� ���� ������...";
};


func int dia_abuyin_mischung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen) && (ABUYIN_HONIGTABAK == FALSE) && ((Npc_HasItems(other,itmi_sumpftabak) >= 1) || (Npc_HasItems(other,itmi_pilztabak) >= 1) || (Npc_HasItems(other,itmi_doppeltabak) >= 1) || (Npc_HasItems(other,itmi_honigtabak) >= 1)))
	{
		return TRUE;
	};
};

func void dia_abuyin_mischung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Mischung_15_00");	//� ������ ����� ���� ������...
	Info_ClearChoices(dia_abuyin_mischung);
	Info_AddChoice(dia_abuyin_mischung,DIALOG_BACK,dia_abuyin_mischung_back);
	if(Npc_HasItems(other,itmi_sumpftabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,"�������� �����",dia_abuyin_mischung_sumpf);
	};
	if(Npc_HasItems(other,itmi_pilztabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,"������� �����",dia_abuyin_mischung_pilz);
	};
	if(Npc_HasItems(other,itmi_doppeltabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,"������� ������",dia_abuyin_mischung_doppel);
	};
	if(Npc_HasItems(other,itmi_honigtabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,"������� �����",dia_abuyin_mischung_super);
	};
};

func void dia_abuyin_mischung_back()
{
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_sumpf()
{
	b_giveinvitems(other,self,itmi_sumpftabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_pilz()
{
	b_giveinvitems(other,self,itmi_pilztabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_doppel()
{
	b_giveinvitems(other,self,itmi_doppeltabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_super()
{
	b_giveinvitems(other,self,itmi_honigtabak,1);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_00");	//����� � �������� ���� �����.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_01");	//��� ����������! � ����� ������ ��������� �� ��������!
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_02");	//��� �� ���������� ���?
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_03");	//� ������ ������� ����� � �����.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_04");	//�� ������ ���������, �, ���� ��������� ��������. � � ���������� ������������� ����� �� ���� ���������� ������.
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_05");	//��, �����.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_06");	//������� ����, �, ��� �����������. �� ���� ������ ����� �� ��������� � ����� ���������. � ����� �������� ���, ��� �� ������� �������� ���.
	ABUYIN_HONIGTABAK = TRUE;
	b_giveplayerxp(XP_AMBIENT * 2);
	Info_ClearChoices(dia_abuyin_mischung);
};


instance DIA_ABUYIN_TRADE(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_trade_condition;
	information = dia_abuyin_trade_info;
	permanent = TRUE;
	description = "� ������ ���� �������� ������.";
};


func int dia_abuyin_trade_condition()
{
	if((ABUYIN_HONIGTABAK == TRUE) && (Npc_HasItems(other,itmi_honigtabak) >= 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_trade_info()
{
	ABUYIN_SCORE = 0;
	ABUYIN_SCORE = Npc_HasItems(other,itmi_honigtabak) * VALUE_ITMI_HONIGTABAK;
	AI_Output(other,self,"DIA_Abuyin_Trade_15_00");	//� ������ ���� �������� ������.
	b_giveinvitems(other,self,itmi_honigtabak,Npc_HasItems(other,itmi_honigtabak));
	b_giveinvitems(self,other,itmi_gold,ABUYIN_SCORE);
	AI_Output(self,other,"DIA_Abuyin_Trade_13_01");	//��� ���� �������� ������������ ����� � ����� ����.
};


instance DIA_ABUYIN_HERB(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_herb_condition;
	information = dia_abuyin_herb_info;
	permanent = FALSE;
	description = "���� �� ������������ ���� ��� �����?";
};


func int dia_abuyin_herb_condition()
{
	if(Npc_HasItems(other,itmi_herbpaket) >= 1)
	{
		return TRUE;
	};
};

func void dia_abuyin_herb_info()
{
	AI_Output(other,self,"DIA_Abuyin_Herb_15_00");	//���� �� ������������ ���� ��� �����?
	AI_Output(self,other,"DIA_Abuyin_Herb_13_01");	//��� ���� - ��� �� �������� �����, ���? ��, ����� ��, �, ��� ����������������.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_02");	//���� ��������� ������ ������ �� � ����, ��� ������ ���� � ������ - � ���� ����� ����� �� ������ ������!
	AI_Output(self,other,"DIA_Abuyin_Herb_13_03");	//���� ���� ��� ������� ������� ��� �����, �������� ����� ������ - ������ ���� �����.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_04");	//�������� ���������� �� ��� ���-������ �� ��������� ��������� ����. � ����� ���� ���� � ��� ���� �������� ����.
};


instance DIA_ABUYIN_WEISSAGUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung_condition;
	information = dia_abuyin_weissagung_info;
	permanent = FALSE;
	description = "�� ������ ������� �����������?";
};


func int dia_abuyin_weissagung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_00");	//�� ������ ������� �����������?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_01");	//� � ����� ������� �� �������� ��������������, �, ���� ��������.
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_02");	//������� �� ������?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_03");	//�� �����-�� 25 �����, � ������ ��������� ��� ���� � �������.
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_04");	//�� ����� - ������� ������ �������������. ���, ��� � ���� ����� - ��� ������� ���� ��������� ��������� �������.
};


instance DIA_ABUYIN_ZUKUNFT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft_condition;
	information = dia_abuyin_zukunft_info;
	permanent = TRUE;
	description = "�������� ��� � ������� (��������� 25 �������).";
};


var int dia_abuyin_zukunft_permanent;

func int dia_abuyin_zukunft_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung) && (DIA_ABUYIN_ZUKUNFT_PERMANENT == FALSE) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft_15_00");	//�������� ��� � �������.
	if(b_giveinvitems(other,self,itmi_gold,25))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_01");	//������, �, �������� ������. � ������ ����� � ��������� ������. �� �����?
		Info_ClearChoices(dia_abuyin_zukunft);
		Info_AddChoice(dia_abuyin_zukunft,"� �����!",dia_abuyin_zukunft_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_02");	//�, ���� �����, � ����� � ���� 25 ������� � ����� �� ������ � �������� �������.
	};
};

func void dia_abuyin_zukunft_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_00");	//(� ������) ����... ��� �������� ����... ������ �������... ������ ��������...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_01");	//(� ������) ���� � ���������� ��������... ���... ���� ���� � ����... �� ���� ����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_02");	//(� ������) �����! ���������... �������� ��������... �����... ������... ��������...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_03");	//... ������ - ������� ���������. ������ � ������ �� ���� �������.
	DIA_ABUYIN_ZUKUNFT_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 1;
	Info_ClearChoices(dia_abuyin_zukunft);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_NOCHMAL(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_nochmal_condition;
	information = dia_abuyin_nochmal_info;
	permanent = TRUE;
	description = "�� ������ ���� ��� ��� ���� �����������?";
};


func int dia_abuyin_nochmal_condition()
{
	if(KAPITEL == ABUYIN_ZUKUNFT)
	{
		return TRUE;
	};
};

func void dia_abuyin_nochmal_info()
{
	AI_Output(other,self,"DIA_Abuyin_Nochmal_15_00");	//�� ������ ���� ��� ��� ���� �����������?
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_01");	//�, ��� ����������� ��������, ������ � �� � ����� ���������� ������ �������.
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_02");	//������ ����� ����� ������ ��� ��������� ����, � ����� ������ ���� ��� ���.
	if(ABUYIN_ERZAEHLT == FALSE)
	{
		AI_Output(other,self,"DIA_Abuyin_Nochmal_15_03");	//� ����� ��� �����?
		AI_Output(self,other,"DIA_Abuyin_Nochmal_13_04");	//����� ������� ������ ���������, � �� ���������� ���� ����.
		ABUYIN_ERZAEHLT = TRUE;
	};
};

func void b_abuyin_weissagung()
{
	AI_Output(other,self,"B_Abuyin_Weissagung_15_00");	//�� ������ ������� �����������?
	AI_Output(self,other,"B_Abuyin_Weissagung_13_01");	//��, ����� ���� ������, � � ���� ������� ��� ���� �����������, ���� � ���� �������� ��������� �����.
	AI_Output(other,self,"B_Abuyin_Weissagung_15_02");	//�������?
};


instance DIA_ABUYIN_WEISSAGUNG2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung2_condition;
	information = dia_abuyin_weissagung2_info;
	permanent = FALSE;
	description = "�� ������ ������� �����������?";
};


func int dia_abuyin_weissagung2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung2_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung2_13_00");	//�� �����-�� 100 �����, � ������ ��������� ��� ���� � �������.
};


instance DIA_ABUYIN_ZUKUNFT2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft2_condition;
	information = dia_abuyin_zukunft2_info;
	permanent = TRUE;
	description = "�������� ��� � ������� (��������� 100 �������).";
};


var int dia_abuyin_zukunft2_permanent;

func int dia_abuyin_zukunft2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung2) && (DIA_ABUYIN_ZUKUNFT2_PERMANENT == FALSE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft2_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft2_15_00");	//�������� ��� � �������.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_01");	//������, �, ��� ��������. � ������ ����� � ��������� ������. �� �����?
		Info_ClearChoices(dia_abuyin_zukunft2);
		Info_AddChoice(dia_abuyin_zukunft2,"� �����!",dia_abuyin_zukunft2_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_02");	//�, ���� �����, � ����� � ���� 100 ������� � ����� �� ������ � �������� �������.
	};
};

func void dia_abuyin_zukunft2_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_00");	//(� ������) �������... ��� ����� ��... ������� ��������... ����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_01");	//(� ������) �������� �����������... ��� ����... ���� ����... ����� �����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_02");	//(� ������) ...�� ���� ������ ������������... ������ ����� �� �������� ��, ��� ������ ������������ ����...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_03");	//��� ���. ������ � ������ �� ���� �������.
	DIA_ABUYIN_ZUKUNFT2_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 2;
	Info_ClearChoices(dia_abuyin_zukunft2);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung3_condition;
	information = dia_abuyin_weissagung3_info;
	permanent = FALSE;
	description = "�� ������ ������� �����������?";
};


func int dia_abuyin_weissagung3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung3_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung3_13_00");	//�� �����-�� 250 �����, � ������ ��������� ��� ���� � �������.
};


instance DIA_ABUYIN_ZUKUNFT3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft3_condition;
	information = dia_abuyin_zukunft3_info;
	permanent = TRUE;
	description = "�������� ��� � ������� (��������� 250 �������).";
};


var int dia_abuyin_zukunft3_permanent;

func int dia_abuyin_zukunft3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung3) && (DIA_ABUYIN_ZUKUNFT3_PERMANENT == FALSE) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft3_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft3_15_00");	//�������� ��� � �������.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_01");	//������, �, ��� ������. � ������ ����� � ��������� ������. �� �����?
		Info_ClearChoices(dia_abuyin_zukunft3);
		Info_AddChoice(dia_abuyin_zukunft3,"� �����!",dia_abuyin_zukunft3_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_02");	//�, ���� �����, � ����� � ���� 250 ������� � ����� �� ������ � �������� �������.
	};
};

func void dia_abuyin_zukunft3_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_00");	//(� ������) �� ������ ���������... ��� ������� ������ ����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_01");	//(� ������) ...������ ����� � ����... ������ ��� � �����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_02");	//(� ������) ���� � �������� ��������... ������... �����... ��� ���� ����...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_03");	//��� ���. ������ � ������ �� ���� �������.
	DIA_ABUYIN_ZUKUNFT3_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 3;
	Info_ClearChoices(dia_abuyin_zukunft3);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung4_condition;
	information = dia_abuyin_weissagung4_info;
	permanent = FALSE;
	description = "�� ������ ������� �����������?";
};


func int dia_abuyin_weissagung4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung4_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung4_13_00");	//�� �����-�� 500 �����, � ������ ��������� ��� ���� � �������.
};


instance DIA_ABUYIN_ZUKUNFT4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft4_condition;
	information = dia_abuyin_zukunft4_info;
	permanent = TRUE;
	description = "�������� ��� � ������� (��������� 500 �������).";
};


var int dia_abuyin_zukunft4_permanent;

func int dia_abuyin_zukunft4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung4) && (DIA_ABUYIN_ZUKUNFT4_PERMANENT == FALSE) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft4_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft4_15_00");	//�������� ��� � �������.
	if(b_giveinvitems(other,self,itmi_gold,500))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_01");	//������, �, ��� ������. � ������ ����� � ��������� ������. �� �����?
		Info_ClearChoices(dia_abuyin_zukunft4);
		Info_AddChoice(dia_abuyin_zukunft4,"� �����!",dia_abuyin_zukunft4_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_02");	//�, ���� �����, � ����� � ���� 500 ������� � ����� �� ������ � �������� �������.
	};
};

func void dia_abuyin_zukunft4_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_00");	//(� ������) ����� ������... ������ ������... ������ ����� ������-������...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_01");	//(� ������) ������������ ��������... �� ������ ������� �����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_02");	//(� ������) ����... ����� ������� � ������� �������... �������� �������...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_03");	//��� ���. ������ � ������ �� ���� �������.
	DIA_ABUYIN_ZUKUNFT4_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 4;
	Info_ClearChoices(dia_abuyin_zukunft4);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung5_condition;
	information = dia_abuyin_weissagung5_info;
	permanent = FALSE;
	description = "�� ������ ������� �����������?";
};


func int dia_abuyin_weissagung5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung5_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung5_13_00");	//�� �����-�� 1000 �����, � ������ ��������� ��� ���� � �������.
};


instance DIA_ABUYIN_ZUKUNFT5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft5_condition;
	information = dia_abuyin_zukunft5_info;
	permanent = TRUE;
	description = "�������� ��� � ������� (��������� 1000 �������).";
};


var int dia_abuyin_zukunft5_permanent;

func int dia_abuyin_zukunft5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung5) && (DIA_ABUYIN_ZUKUNFT5_PERMANENT == FALSE) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft5_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft5_15_00");	//�������� ��� � �������.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_01");	//������, �, ��� ������. � ������ ����� � ��������� ������. �� �����?
		Info_ClearChoices(dia_abuyin_zukunft5);
		Info_AddChoice(dia_abuyin_zukunft5,"� �����!",dia_abuyin_zukunft5_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_02");	//�, ���� �����, � ����� � ���� 1000 ������� � ����� �� ������ � �������� �������.
	};
};

func void dia_abuyin_zukunft5_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_00");	//(� ������) ���� ���������� �� �����... ��� �����������...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_01");	//(� ������) ������ ��������� ����� ������ �����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_02");	//(� ������) �� ���������, �� �� ������� �����...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_03");	//��� ���. ������ � ������ �� ���� �������.
	DIA_ABUYIN_ZUKUNFT5_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 5;
	Info_ClearChoices(dia_abuyin_zukunft5);
	b_giveplayerxp(XP_AMBIENT * 4);
};

