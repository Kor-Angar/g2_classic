
instance DIA_BRONKO_EXIT(C_INFO)
{
	npc = bau_935_bronko;
	nr = 999;
	condition = dia_bronko_exit_condition;
	information = dia_bronko_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bronko_exit_condition()
{
	return TRUE;
};

func void dia_bronko_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRONKO_HALLO(C_INFO)
{
	npc = bau_935_bronko;
	nr = 1;
	condition = dia_bronko_hallo_condition;
	information = dia_bronko_hallo_info;
	important = TRUE;
};


func int dia_bronko_hallo_condition()
{
	return TRUE;
};

func void dia_bronko_hallo_info()
{
	AI_Output(self,other,"DIA_Bronko_HALLO_06_00");	//(��������) � ���� ��� �� ������������, �?
	AI_Output(other,self,"DIA_Bronko_HALLO_15_01");	//� �� ���, ����� �������?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_06_02");	//������ � ����� ��������, ��������.
	};
	AI_Output(self,other,"DIA_Bronko_HALLO_06_03");	//���� �� ������ �������� ������ �� ���� �����, �� ������ ��������� ��� 5 �������, ��� ���� �� ���� �������!
	Info_ClearChoices(dia_bronko_hallo);
	Info_AddChoice(dia_bronko_hallo,"������ �� ����. �� ������ �� �������� �� ����.",dia_bronko_hallo_vergisses);
	Info_AddChoice(dia_bronko_hallo,"������, � ���� ��� ������ - ��� ���� ������.",dia_bronko_hallo_hiergeld);
	Info_AddChoice(dia_bronko_hallo,"����� �����? �� ���, ������� ������?",dia_bronko_hallo_deinland);
};

func void dia_bronko_hallo_deinland()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_deinland_15_00");	//����� �����? �� ���, ������� ������?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_01");	//�����������. � ������ ��� �� ������ ������� ��� �������?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_02");	//� �� ��������, ���� �� ������������� ��������� ��� ���. ��-��!
};

func void dia_bronko_hallo_hiergeld()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_hiergeld_15_00");	//������, � ���� ��� ������ - ��� ���� ������.
	if(Npc_HasItems(other,itmi_gold) >= 5)
	{
		b_giveinvitems(other,self,itmi_gold,5);
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_01");	//(���������) �������. �������� ����.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_02");	//� ���� ��� ���� 5 �����. �� ������ ������ ����?
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void dia_bronko_hallo_vergisses()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_vergisses_15_00");	//������ �� ����. �� ������ �� �������� �� ����.
	if((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_01");	//�����, �����, ��� �������� ������ ���� �����.
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_02");	//� ���, ������ �� ��������� ������, ����� � ���������, ��?
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_03");	//���� �� �������, ��� �� ���. ���� �������� ���������. �������?
		};
	};
	Info_ClearChoices(dia_bronko_hallo);
	Info_AddChoice(dia_bronko_hallo,"������, � ���� ��� ������ - ��� ���� ������.",dia_bronko_hallo_hiergeld);
	Info_AddChoice(dia_bronko_hallo,"����� ��������, ������ �� ���.",dia_bronko_hallo_attack);
};

func void dia_bronko_hallo_attack()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_attack_15_00");	//����� ��������, ������ �� ���.
	AI_Output(self,other,"DIA_Bronko_HALLO_attack_06_01");	//��, ��� �� ���...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BRONKO_KEINBAUER(C_INFO)
{
	npc = bau_935_bronko;
	nr = 2;
	condition = dia_bronko_keinbauer_condition;
	information = dia_bronko_keinbauer_info;
	permanent = TRUE;
	description = "��?! ������?! �� ����� ����.";
};


var int dia_bronko_keinbauer_noperm;

func int dia_bronko_keinbauer_condition()
{
	if(((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING) || (BABERA_BRONKOKEINBAUER == TRUE)) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST) && (DIA_BRONKO_KEINBAUER_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_bronko_keinbauer_info()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_15_00");	//��?! ������?! �� ����� ����. �� �� ������ �����.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_06_01");	//������? ������ �������� �� �����?
	Info_ClearChoices(dia_bronko_keinbauer);
	if(hero.guild == GIL_NONE)
	{
		if(BABERA_BRONKOKEINBAUER == TRUE)
		{
			Info_AddChoice(dia_bronko_keinbauer,"(���������� ������ ����������)",dia_bronko_keinbauer_sld);
		};
		if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING)
		{
			Info_AddChoice(dia_bronko_keinbauer,"������ ����� - �����, � �� ������ ������ �����.",dia_bronko_keinbauer_sekobderbauer);
		};
	};
	Info_AddChoice(dia_bronko_keinbauer,"��... ����� ���������, ��� �� ������.",dia_bronko_keinbauer_attack);
	Info_AddChoice(dia_bronko_keinbauer,"������!",dia_bronko_keinbauer_schongut);
};

func void dia_bronko_keinbauer_attack()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_attack_15_00");	//��... ����� ���������, ��� �� ������.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_attack_06_01");	//� ��������, ��� �� ������� ���.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bronko_keinbauer_sekobderbauer()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_00");	//������ ����� - �����, � �� ������ ������ �����, ������� �������� ������� �������� ������ �� ��������� ������� �����.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_01");	//��� ��� ������?
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_02");	//� ������. ����� �����, ����� �� �������� � ������, � �� ������ ����� ��� ����.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_03");	//� ���? ��� �� ������ ������ ������?
};

func void dia_bronko_keinbauer_schongut()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_schongut_15_00");	//������!
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_schongut_06_01");	//����������!
	AI_StopProcessInfos(self);
};

func void dia_bronko_keinbauer_sld()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_00");	//������, �����, �������, ��� �������� ������� �����, ��� ����� ���� ������ ������, ������� ������������ ������� �����.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_01");	//����. ������� �������. ���� ������ ���� ���������.
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_02");	//� ���?
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_03");	//������, ������. � ��� ���� ���, ��� �� ��������, �� ������ �� �������� � ��� ���� ���������, ������?
	if(b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold)))
	{
		AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_04");	//���, � ���� ����� ���� ��� ��� ������.
	};
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_05");	//� � ������� � ���� � ���� ��������. ���, ��� ������, ������ �� ���� ���������.
	AI_StopProcessInfos(self);
	DIA_BRONKO_KEINBAUER_NOPERM = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BRONKO_FLEISSIG(C_INFO)
{
	npc = bau_935_bronko;
	nr = 3;
	condition = dia_bronko_fleissig_condition;
	information = dia_bronko_fleissig_info;
	permanent = TRUE;
	description = "(���������� ������)";
};


func int dia_bronko_fleissig_condition()
{
	if((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void dia_bronko_fleissig_info()
{
	if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_00");	//��� ����? ��������� ��� ������, ��?
	}
	else
	{
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_01");	//��� ����? ������� ��������� ��� �� �������?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_02");	//�� �������, ��? � ��� �� ����������.
	}
	else if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_03");	//(� ������) �� ���� �� ��������� ���� ���� ���������, ��?
	};
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_04");	//�� ��� ����, ����������.
	};
	AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_05");	//� ���� ������� � ������, ������?
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BRONKO_PICKPOCKET(C_INFO)
{
	npc = bau_935_bronko;
	nr = 900;
	condition = dia_bronko_pickpocket_condition;
	information = dia_bronko_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_bronko_pickpocket_condition()
{
	return c_beklauen(54,80);
};

func void dia_bronko_pickpocket_info()
{
	Info_ClearChoices(dia_bronko_pickpocket);
	Info_AddChoice(dia_bronko_pickpocket,DIALOG_BACK,dia_bronko_pickpocket_back);
	Info_AddChoice(dia_bronko_pickpocket,DIALOG_PICKPOCKET,dia_bronko_pickpocket_doit);
};

func void dia_bronko_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bronko_pickpocket);
};

func void dia_bronko_pickpocket_back()
{
	Info_ClearChoices(dia_bronko_pickpocket);
};

