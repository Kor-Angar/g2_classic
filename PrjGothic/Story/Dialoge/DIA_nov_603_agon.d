
instance DIA_AGON_EXIT(C_INFO)
{
	npc = nov_603_agon;
	nr = 999;
	condition = dia_agon_exit_condition;
	information = dia_agon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_agon_exit_condition()
{
	return TRUE;
};

func void dia_agon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AGON_HELLO(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_hello_condition;
	information = dia_agon_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_hello_info()
{
	AI_Output(self,other,"DIA_Agon_Hello_07_00");	//(������������) ��� ���� �����?
};


instance DIA_AGON_WURST(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_wurst_condition;
	information = dia_agon_wurst_info;
	permanent = FALSE;
	description = "���, � ���� ���� ������� ������� ��� ����.";
};


func int dia_agon_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_agon_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//���, � ���� ���� ������� ������� ��� ����.
	AI_Output(self,other,"DIA_Agon_Wurst_07_01");	//������ �������, ������ ���... ������ ������... ���� ��� ������ �� ������ �� ����.
	AI_Output(other,self,"DIA_Agon_Wurst_15_02");	//��� �� ������ ������� ��� ���?
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//�����, ����� �� ����!
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
};


instance DIA_AGON_NEW(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_new_condition;
	information = dia_agon_new_info;
	permanent = FALSE;
	description = "� ������� �����.";
};


func int dia_agon_new_condition()
{
	if((MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_new_info()
{
	AI_Output(other,self,"DIA_Agon_New_15_00");	//� ������� �����.
	AI_Output(self,other,"DIA_Agon_New_07_01");	//� ����.
	AI_Output(self,other,"DIA_Agon_New_07_02");	//���� � ���� ��� ��� ������, �������� � ��������. �� ������� ���� ���-������.
};


instance DIA_AGON_YOUANDBABO(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_youandbabo_condition;
	information = dia_agon_youandbabo_info;
	permanent = FALSE;
	description = "��� ��������� ����� ����� � ����?";
};


func int dia_agon_youandbabo_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_youandbabo_info()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_15_00");	//��� ��������� ����� ����� � ����?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_01");	//���� �� ����� ������ �����, ��� �� �������.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_02");	//(����������) ����� �������� ���-���: � ���� ��������� ���, ��� ����� ������. ���, ��� ������������� ��� �����.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_03");	//� ������ �� ������� ������ � ���� �� ����, � �� ������� �� ����� ���������� ����.
	Info_ClearChoices(dia_agon_youandbabo);
	Info_AddChoice(dia_agon_youandbabo,"����� ��, ����������, �� ������ ������������ ���� �����?",dia_agon_youandbabo_alltogether);
	Info_AddChoice(dia_agon_youandbabo,"������ ������ ������, ����� ����� ������ �� ����.",dia_agon_youandbabo_innosway);
	Info_AddChoice(dia_agon_youandbabo,"� �����, �� �������.",dia_agon_youandbabo_understand);
};

func void dia_agon_youandbabo_alltogether()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_AllTogether_15_00");	//����� ��, ����������, �� ������ ������������ ���� �����?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_01");	//��, ���������, ������ ������������ ���� ����� ������� ������.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_02");	//��, ����������, �� ����� ��� �����. (�������) ����� �� ����� ������ � ���� �� ����.
	Info_ClearChoices(dia_agon_youandbabo);
};

func void dia_agon_youandbabo_innosway()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_InnosWay_15_00");	//������ ������ ������, ����� ����� ������ �� ����.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_InnosWay_07_01");	//��� ����� ������ ������������ ���������������� ������, � ����� �� ������� ���.
	Info_ClearChoices(dia_agon_youandbabo);
};

func void dia_agon_youandbabo_understand()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_Understand_15_00");	//� �����, �� �������.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_Understand_07_01");	//�������. ����� � ����� �����, � �������� �� ���� ��������.
	Info_ClearChoices(dia_agon_youandbabo);
};


instance DIA_AGON_GETHERB(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_getherb_condition;
	information = dia_agon_getherb_info;
	permanent = TRUE;
	description = "��� �� ����������� �����?";
};


func int dia_agon_getherb_condition()
{
	if(MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};
};

func void dia_agon_getherb_info()
{
	AI_Output(other,self,"DIA_Agon_GetHerb_15_00");	//��� �� ����������� �����?
	AI_Output(self,other,"DIA_Agon_GetHerb_07_01");	//�� �������� ��������� �������� �����, �� ������� ������ ������ ������� �����.
};


instance DIA_AGON_GOLEMDEAD(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_golemdead_condition;
	information = dia_agon_golemdead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_golemdead_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && Npc_IsDead(magic_golem))
	{
		return TRUE;
	};
};

func void dia_agon_golemdead_info()
{
	AI_Output(self,other,"DIA_Agon_GolemDead_07_00");	//(������������) �� �������!
	AI_Output(self,other,"DIA_Agon_GolemDead_07_01");	//� ��� ����� ������! � �������!
	Info_ClearChoices(dia_agon_golemdead);
	Info_AddChoice(dia_agon_golemdead,"(���������) ������ ���� ���� ������� ��������� ������ �����.",dia_agon_golemdead_noway);
	Info_AddChoice(dia_agon_golemdead,"��������!",dia_agon_golemdead_shutup);
	Info_AddChoice(dia_agon_golemdead,"����������, �� ������������� �������� ���.",dia_agon_golemdead_congrat);
};

func void dia_agon_golemdead_noway()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_NoWay_15_00");	//(���������) ������ ���� ���� ������� ��������� ������ �����.
	AI_Output(self,other,"DIA_Agon_GolemDead_NoWay_07_01");	//�� ������ ����� ����? � ���� ������ �� ���������.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_agon_golemdead_shutup()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_15_00");	//��������!
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_01");	//(����������) ��� ����������, �� ��������! ������� � ����.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_02");	//������ ��� ������� ����� �����.
	Info_ClearChoices(dia_agon_golemdead);
	Info_AddChoice(dia_agon_golemdead,"����� � ���. ���� ������ ���.",dia_agon_golemdead_shutup_mychest);
	Info_AddChoice(dia_agon_golemdead,"�� �������.",dia_agon_golemdead_shutup_youwin);
};

func void dia_agon_golemdead_shutup_mychest()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00");	//����� � ���. ���� ������ ���.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01");	//(� ������) ���, �� �� �������� �����. � ���� ����.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_agon_golemdead_shutup_youwin()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00");	//�� �������.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01");	//(� ������) ���, ���� �� �������� ����. �� ��������� ���������� �� ����.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02");	//� �� ������ �����!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_agon_golemdead_congrat()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_00");	//����������, �� ������������� �������� ���.
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_01");	//(�����������) ��� ��� ������? ��� �� �������?
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_02");	//�� � ��� ���?
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_03");	//(������) �� ������ �������� ��� ������. �� ������ ����� ���� � ������� ��� ����� ����!
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_04");	//� ���� ������ �� ������!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_AGON_GOLEMLIVES(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_golemlives_condition;
	information = dia_agon_golemlives_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_golemlives_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE))
	{
		return TRUE;
	};
};

func void dia_agon_golemlives_info()
{
	AI_Output(self,other,"DIA_Agon_GolemLives_07_00");	//(���������) �� ����� ��� ����� ������ ����. ����� �� ����� ����...
	AI_Output(self,other,"DIA_Agon_GolemLives_07_01");	//(����������) ����� �� ����� ����! � �� ������� ���.
	AI_Output(self,other,"DIA_Agon_GolemLives_07_02");	//���� ���� ������� ����� �� ������.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,0);
};


instance DIA_AGON_PERM(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_perm_condition;
	information = dia_agon_perm_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_agon_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_agon_perm_info()
{
	AI_Output(other,self,"DIA_Agon_Perm_15_00");	//��� ����?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_01");	//��, ������� �� ���� ������, �, �������. � ����������� �������, � � ������, ��� ����� ���� ������� � ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_02");	//(��������) �� ����� ���� ����� �����, � ��������� ������. ������� �� ������ ����� ���� �������������� � �� �������� ���� �� ������. ������.
	};
};


instance DIA_AGON_PICKPOCKET(C_INFO)
{
	npc = nov_603_agon;
	nr = 900;
	condition = dia_agon_pickpocket_condition;
	information = dia_agon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_agon_pickpocket_condition()
{
	return c_beklauen(23,12);
};

func void dia_agon_pickpocket_info()
{
	Info_ClearChoices(dia_agon_pickpocket);
	Info_AddChoice(dia_agon_pickpocket,DIALOG_BACK,dia_agon_pickpocket_back);
	Info_AddChoice(dia_agon_pickpocket,DIALOG_PICKPOCKET,dia_agon_pickpocket_doit);
};

func void dia_agon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_agon_pickpocket);
};

func void dia_agon_pickpocket_back()
{
	Info_ClearChoices(dia_agon_pickpocket);
};

