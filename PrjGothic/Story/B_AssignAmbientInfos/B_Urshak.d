
var int urshak_sucked;

instance DIA_URSHAK_EXIT(C_INFO)
{
	npc = none_110_urshak;
	nr = 999;
	condition = dia_urshak_exit_condition;
	information = dia_urshak_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_urshak_exit_condition()
{
	return TRUE;
};

func void dia_urshak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HALLO(C_INFO)
{
	npc = none_110_urshak;
	nr = 5;
	condition = dia_urshak_hallo_condition;
	information = dia_urshak_hallo_info;
	important = TRUE;
};


func int dia_urshak_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hallo_info()
{
	AI_Output(self,other,"DIA_Urshak_HALLO_18_00");	//(����������) ������ �������!!!
	AI_Output(self,other,"DIA_Urshak_HALLO_18_01");	//����! ��� ����� ����. �� ���� ������� � ������ �������.
	AI_Output(self,other,"DIA_Urshak_HALLO_18_02");	//���� ������� ����� ������ �������.
	b_giveplayerxp(XP_URSHAKFOUND);
	Log_CreateTopic(TOPIC_URSHAK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_URSHAK,LOG_RUNNING);
	b_logentry(TOPIC_URSHAK,"� ����� ������ ������� �����-���� - ��-����.");
	Info_ClearChoices(dia_urshak_hallo);
	Info_AddChoice(dia_urshak_hallo,"��� �� ������� �����?",dia_urshak_hallo_freund);
	Info_AddChoice(dia_urshak_hallo,"��������� ���?",dia_urshak_hallo_wer);
};

func void dia_urshak_hallo_wer()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_wer_15_00");	//��������� ���?
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_01");	//���� �������� ��-���? ��� �������� ����.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_02");	//��-��� �������� ����� ����� ���� ������ �������� ���-���� ��� ������ � ��� �������. ���� ������� �����, � ���� �� ������� �� ���� �����.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_03");	//���� ����� ������ � ���� ����� � �������� ����� ������. ����� ���� ������. ���� �� �������?
};

func void dia_urshak_hallo_freund()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_freund_15_00");	//�� ������ �� ������ �����, ����� ������ � ���� �� ����. � ���� �� ���� ����. ��� �� ������� �����?
	AI_Output(self,other,"DIA_Urshak_HALLO_freund_18_01");	//��-��� �������� �� ����� � ������, ��� ����� � ������ � ��� �����.
	Info_ClearChoices(dia_urshak_hallo);
};


instance DIA_URSHAK_WASMACHENORKS(C_INFO)
{
	npc = none_110_urshak;
	nr = 6;
	condition = dia_urshak_wasmachenorks_condition;
	information = dia_urshak_wasmachenorks_info;
	description = "������ ���� �������� �� �����?";
};


func int dia_urshak_wasmachenorks_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_wasmachenorks_info()
{
	AI_Output(other,self,"DIA_Urshak_WASMACHENORKS_15_00");	//������ ���� �������� �� �����?
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_01");	//��-��� ������ �������� ����� �����, ��� ���� �� ��� � � ���� ���� �������.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_02");	//�� ����� �� ������� ��-���. ��-��� � ��������� � ���� �����.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_03");	//������� ��-��� �� ����� ����� � ������� ���� ����� ������ �����.
	b_logentry(TOPIC_URSHAK,"�� ��� ��� ����� �� ����� ��������� ���� ����� ��������� ���. �� ��� ��� ���������.");
};


instance DIA_URSHAK_SOVIELE(C_INFO)
{
	npc = none_110_urshak;
	nr = 7;
	condition = dia_urshak_soviele_condition;
	information = dia_urshak_soviele_info;
	description = "������ ��� ����� ��� �����?";
};


func int dia_urshak_soviele_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_soviele_info()
{
	AI_Output(other,self,"DIA_Urshak_SOVIELE_15_00");	//������ ��� ����� ��� �����?
	AI_Output(self,other,"DIA_Urshak_SOVIELE_18_01");	//���� ��������� � ���, �� ������ ���������� �� �������� � ������ ������� �����.
};


instance DIA_URSHAK_ZAUN(C_INFO)
{
	npc = none_110_urshak;
	nr = 8;
	condition = dia_urshak_zaun_condition;
	information = dia_urshak_zaun_info;
	description = "��� ���������� �� ���� ���������� ����� �� �������?";
};


func int dia_urshak_zaun_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_zaun_info()
{
	AI_Output(other,self,"DIA_Urshak_ZAUN_15_00");	//��� ���������� �� ���� ���������� ����� �� �������?
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_01");	//���� ������ ������ ������� ����� � �������� ������ � �����.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_02");	//����� ������ ��� �����. �������� ���� ����� � �������� �����.
};


instance DIA_URSHAK_WASHASTDUVOR(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_washastduvor_condition;
	information = dia_urshak_washastduvor_info;
	description = "��� �� ���������� ������ ������?";
};


func int dia_urshak_washastduvor_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_washastduvor_info()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_00");	//��� �� ���������� ������ ������?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_01");	//��-��� �����, ���� ���������� ����� ��������� ��-��� � ���-���.
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_02");	//��� ����� ���-���?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_03");	//����� ������� �����. ����� ������� ������� �� ������ � ������ ������� ����� ��� �����.
	b_logentry(TOPIC_URSHAK,"��-��� ����� ����������� � ������� ����� ���-����� � ������� ��� ������� ��-���� ����� � ����� �������.");
	Info_ClearChoices(dia_urshak_washastduvor);
	Info_AddChoice(dia_urshak_washastduvor,DIALOG_BACK,dia_urshak_washastduvor_weiter);
	Info_AddChoice(dia_urshak_washastduvor,"��� � ���� ����� ����� ���-����?",dia_urshak_washastduvor_);
	Info_AddChoice(dia_urshak_washastduvor,"������ �� ����� �� ������� � ����?",dia_urshak_washastduvor_hoshpak);
};

func void dia_urshak_washastduvor_hoshpak()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_hoshpak_15_00");	//������ �� ����� �� ������� � ����?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_01");	//��-��� �������� � �������� �������� ����� ����� � ������ ����� � ����� �������.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_02");	//�� ���� ���-��� �� ������� ��-���. ���� ������� ��-��� ���� ������ ��� ��� �����������. ��-��� ������ �������� � ���-���.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_03");	//����� ����, ��� ��������� �������.
};

func void dia_urshak_washastduvor_()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_Urshak_15_00");	//��� � ���� ����� ����� ���-����?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_Urshak_18_01");	//�� ��� ��� ����� ��������� �� ����� ����� � �������� � ������� ������, ����� ���-��� ���� �������������� �����.
};

func void dia_urshak_washastduvor_weiter()
{
	Info_ClearChoices(dia_urshak_washastduvor);
};


instance DIA_URSHAK_HOSHPAKDEAD(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_hoshpakdead_condition;
	information = dia_urshak_hoshpakdead_info;
	description = "���-��� �����.";
};


func int dia_urshak_hoshpakdead_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_washastduvor) && Npc_IsDead(hosh_pak) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakdead_info()
{
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_00");	//���-��� �����.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_01");	//���-��� �����? ��������!
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_02");	//��� ������ ������� ������. ��-��� ������� �� �������� ������� ��� ������ ��-��� �����.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_03");	//� �������. ���-��� ��� ����� ��������.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_04");	//��-��� ������ ������ ������ ���� ����, ������ ���� ���-��� ��������� �����. ��-��� ���� ����.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_05");	//���� ����� ������� ������. ������� ������ �����.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_06");	//��-��� ���������� ���� ������� ���� �������.
	b_logentry(TOPIC_URSHAK,"���-��� �����. ��� ���� ��� ������������ � ������� ���-����. �� ������� �� ������ ����������. � ������ ��������� ���.");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	Npc_ExchangeRoutine(self,"Start");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_01");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_02");
};


instance DIA_URSHAK_GEH(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_geh_condition;
	information = dia_urshak_geh_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_geh_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && ((Npc_GetDistToWP(self,"OW_HOSHPAK_04") < 1000) == FALSE) && (Npc_RefuseTalk(self) == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_geh_info()
{
	AI_Output(self,other,"DIA_Urshak_GEH_18_00");	//���� ����� ������� ������.
	Npc_SetRefuseTalk(self,10);
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HOSHPAKRACHE(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_hoshpakrache_condition;
	information = dia_urshak_hoshpakrache_info;
	important = TRUE;
};


func int dia_urshak_hoshpakrache_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && (Npc_GetDistToWP(self,"OW_HOSHPAK_04") <= 1000) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakrache_info()
{
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_00");	//(����������) �������! � ��������, ��� �� ���� ����� ����� ���-��� �������. ���� ������ ������� ������, �����.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_01");	//� ����, �� ����� ���� ����� �����. �� ������� ����.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_02");	//���� ��������� ����� ����� ����� ����, ��� �� ��� �������. ������ �� ��� �� ����� ��� ���������� � ����� �������
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_03");	//����� ����. ��-��� ����������� ������ ��������� � ����� ������.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_04");	//��-��� ������ ������� ������ �������� ���� �������. ��-��� �������� ����� ������� ������ � �������� ��� �� ���� ����.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_05");	//����� ������ �������� ������ � ���� ������. ��-��� �� ����� ������� ����� ������. ����� ������ ������� ��-��� �� �������.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_06");	//��������� ��� �� ����������� �� �����. ���� ����� ������� ������.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
	b_logentry(TOPIC_URSHAK,"��-��� ��� ������ �����, � ����� ������� �����. ������ �� �� ������� ����� � ������� ��������. ����� ��� �� �������� � ���� �� ����, ���� � �� ���� ��� ���� � ������. � ���� �������, �� ������ �����������.");
	b_giveplayerxp(XP_URSHAKBECOMESSHAMAN);
};


instance DIA_URSHAK_KEINEWAHL(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_keinewahl_condition;
	information = dia_urshak_keinewahl_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_keinewahl_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakrache) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_urshak_keinewahl_info()
{
	AI_Output(self,other,"DIA_Urshak_KEINEWAHL_18_00");	//���� �������. ��� ������ �� �������� � �����.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
};

