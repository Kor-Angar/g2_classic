
instance DIA_PEPE_EXIT(C_INFO)
{
	npc = bau_912_pepe;
	nr = 999;
	condition = dia_pepe_exit_condition;
	information = dia_pepe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pepe_exit_condition()
{
	return TRUE;
};

func void dia_pepe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEPE_HALLO(C_INFO)
{
	npc = bau_912_pepe;
	nr = 1;
	condition = dia_pepe_hallo_condition;
	information = dia_pepe_hallo_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_pepe_hallo_condition()
{
	return TRUE;
};

func void dia_pepe_hallo_info()
{
	AI_Output(other,self,"DIA_Pepe_Hallo_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Pepe_Hallo_03_01");	//(������) ������� ����! (��������) �, �� �����������, �������� ��������� �������� �� �������������.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pepe_Hallo_15_02");	//��� �� ������ ��������, ��?
		AI_Output(self,other,"DIA_Pepe_Hallo_03_03");	//�� ��, �������� ����� ���� �������� ���������. � ����� ���, ��� ������� �����, �� ��������, �������� �� ���. ���� � ����� �� ������ ���������.
	};
};


instance DIA_PEPE_DANGER(C_INFO)
{
	npc = bau_912_pepe;
	nr = 2;
	condition = dia_pepe_danger_condition;
	information = dia_pepe_danger_info;
	permanent = FALSE;
	description = "� ��� �������� �� ��������?";
};


func int dia_pepe_danger_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_danger_info()
{
	AI_Output(other,self,"DIA_Pepe_Danger_15_00");	//� ��� �������� �� ��������?
	AI_Output(self,other,"DIA_Pepe_Danger_03_01");	//���������� ������ ��������� ���� ������. ��� ��������� ����� ����� ������ ���� ���������� ���� �� ���� ����.
	AI_Output(self,other,"DIA_Pepe_Danger_03_02");	//��������� ���� ����� � ���� ���� � ��� ���� ������ ����. ��� �� ������� ���� ������, ��� ���� ������� �� ����, ����� ������ �� ����.
};


instance DIA_PEPE_WHYNOTSLD(C_INFO)
{
	npc = bau_912_pepe;
	nr = 3;
	condition = dia_pepe_whynotsld_condition;
	information = dia_pepe_whynotsld_info;
	permanent = FALSE;
	description = "������ �� �� ������� ��������� � ������? ��� ��������, ��� �� ������.";
};


func int dia_pepe_whynotsld_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_danger) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_pepe_whynotsld_info()
{
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_00");	//������ �� �� ������� ��������� � ������? ��� ��������, ��� �� ������.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_01");	//��, � ����. � ������ ��� ������� ���. �� �� ������, ����!
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_02");	//� ������, ����� ������� ���� �������, � ����� ����-������ �������� �� ����.
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_03");	//�� �� ������ ��� ������ ���...
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_04");	//(�������) � ��� ������� �� ����.
};


instance DIA_PEPE_KILLWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 4;
	condition = dia_pepe_killwolves_condition;
	information = dia_pepe_killwolves_info;
	permanent = FALSE;
	description = "��� ���� � ���� ���� ������?";
};


func int dia_pepe_killwolves_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_danger))
	{
		return TRUE;
	};
};

func void dia_pepe_killwolves_info()
{
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_00");	//��� ���� � ���� ���� ������?
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_01");	//(����������) ��, ���? �� ��. � �� ���� � ���. � ������ ������, ��� ��� �����-����� ����������� � ����.
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_02");	//������ �� ����. ��� ���� ����� ���� �������������. � ����� � ������, � ���������, ��� ��� ������ ������ �����...
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_03");	//(���������) ������� �������. ������, ������! ���... �� ���������� ����, � �� ������ ������� ����� ������ ����� �����. ��� �������!
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_04");	//������ ��� ������� � ���� ����� ��������. (��� �� ����� ������) � �����, �� ����� �������...
	AI_StopProcessInfos(self);
	Wld_InsertNpc(pepes_ywolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01");
	Wld_InsertNpc(pepes_ywolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02");
	Wld_InsertNpc(pepes_ywolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03");
	Wld_InsertNpc(pepes_ywolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04");
	MIS_PEPE_KILLWOLVES = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PEPEWOLVES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PEPEWOLVES,LOG_RUNNING);
	b_logentry(TOPIC_PEPEWOLVES,"���� ���� �������� �� ������. � ������ �������� ��.");
};


instance DIA_PEPE_KILLEDWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_killedwolves_condition;
	information = dia_pepe_killedwolves_info;
	permanent = TRUE;
	description = "� ����������� � �������.";
};


func int dia_pepe_killedwolves_condition()
{
	if(MIS_PEPE_KILLWOLVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_pepe_killedwolves_info()
{
	AI_Output(other,self,"DIA_Pepe_KilledWolves_15_00");	//� ����������� � �������.
	if(Npc_IsDead(pepes_ywolf1) && Npc_IsDead(pepes_ywolf2) && Npc_IsDead(pepes_ywolf3) && Npc_IsDead(pepes_ywolf4))
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_01");	//(���������) �� ������ ���! ����� ������!
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_02");	//�� � ��� ����� �� ����, ��� ������� �����, ��� ��� ���� �������.
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_03");	//(���� ��� ���) ��� ��� ���� ������ ����� �������!
		MIS_PEPE_KILLWOLVES = LOG_SUCCESS;
		b_giveplayerxp(XP_PEPEWOLVES);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_04");	//�� ���� �������� �� ������? ��� ����� ��� �� ��� ������.
	};
};


instance DIA_PEPE_BULLCO(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullco_condition;
	information = dia_pepe_bullco_info;
	permanent = FALSE;
	description = "��� �� ������ ������ �����?";
};


func int dia_pepe_bullco_condition()
{
	if((MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && !Npc_IsDead(bullco) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_pepe_bullco_info()
{
	AI_Output(other,self,"DIA_Pepe_Bullco_15_00");	//��� �� ������ ������ �����?
	AI_Output(self,other,"DIA_Pepe_Bullco_03_01");	//��� ���� �� ���������. ��� ��� ������ �������� ��������.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_02");	//�� ������ ����� �� � ��� �������� ������� ���� �������� ��������� � ����� � �����.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_03");	//��� ���� ������� ����� �������, ���� ��� �� �������� �� ������ ������ ������ ��-�� ������ ����.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_04");	//��� � ����� �� ������ ��� �����. �� ������ ��� �� �� �����. ���� ������ - ������.
	MIS_PEPE_KICKBULLCO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KICKBULLCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KICKBULLCO,LOG_RUNNING);
	b_logentry(TOPIC_KICKBULLCO,"����� ����� �������� ���� ����. ���� �����, ����� ���-������ ������� ���.");
};


instance DIA_PEPE_BULLCODEFEATED(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullcodefeated_condition;
	information = dia_pepe_bullcodefeated_info;
	permanent = FALSE;
	description = "����� ������� �� ��������.";
};


func int dia_pepe_bullcodefeated_condition()
{
	if(MIS_PEPE_KICKBULLCO == LOG_RUNNING)
	{
		if((bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (djg_bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_pepe_bullcodefeated_info()
{
	AI_Output(other,self,"DIA_Pepe_BullcoDefeated_15_00");	//����� ������� �� ��������. � �������� ��� ����.
	AI_Output(self,other,"DIA_Pepe_BullcoDefeated_03_01");	//��� ������ ��������� ���.
	MIS_PEPE_KICKBULLCO = LOG_SUCCESS;
	b_giveplayerxp(XP_KICKBULLCO);
};


instance DIA_PEPE_PERM(C_INFO)
{
	npc = bau_912_pepe;
	nr = 6;
	condition = dia_pepe_perm_condition;
	information = dia_pepe_perm_info;
	permanent = TRUE;
	description = "��� ����, ��� ���� ����?";
};


func int dia_pepe_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_perm_info()
{
	AI_Output(other,self,"DIA_Pepe_PERM_15_00");	//��� ����, ��� ���� ����?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_01");	//���������. � � ������ ��� � �������. ��, � ����, ��� ��� �������� � ����, ��� � �������.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_02");	//������. �� ����� ������ ������ �����. �, ��������, � ������� ����������!
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_03");	//� ������ �������� ����. �������, ��� �� ����� ������ ��������� �������� ��������. ��� ������ ��� ���.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_04");	//� ������, ��� �����-�� ������� ���������� �� ����� �������. ���-������ ������ ������ ���.
	};
};


instance DIA_PEPE_LIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 7;
	condition = dia_pepe_liesel_condition;
	information = dia_pepe_liesel_info;
	permanent = FALSE;
	description = "���� � ������ ����?";
};


func int dia_pepe_liesel_condition()
{
	if(Npc_KnowsInfo(hero,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_liesel_info()
{
	AI_Output(other,self,"DIA_Pepe_Liesel_15_00");	//���� � ������ ����?
	AI_Output(self,other,"DIA_Pepe_Liesel_03_01");	//����� ��������, ���� � ���� ���� ������. ���� ����� 100 ������� �����.
	AI_Output(self,other,"DIA_Pepe_Liesel_03_02");	//���� �� ���������, ������ ������� ���� ����. �� �� ������ ��������� ������ � ��� ����������.
};


var int pepe_schafgekauft;

instance DIA_PEPE_BUYLIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 8;
	condition = dia_pepe_buyliesel_condition;
	information = dia_pepe_buyliesel_info;
	permanent = TRUE;
	description = "��� 100 ������� �����. ����� ��� ����.";
};


func int dia_pepe_buyliesel_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_liesel))
	{
		return TRUE;
	};
};

func void dia_pepe_buyliesel_info()
{
	AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_00");	//��� 100 ������� �����. ����� ��� ����.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(PEPE_SCHAFGEKAUFT == 0)
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_01");	//������. ������ ����� - �� ������� �� �� ��������.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_02");	//������ ����� ��, ��� ��� ������ ���� �� �����. ��� ����� ���� ��� ����. �� ������ ��!
		}
		else
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_03");	//�����? ������. ������ �����.
			AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_04");	//�����? �� ��������� ����, ��� � ���� � ����, ���� ����� �����...
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_05");	//���� ���� ����� �����.
			if(PEPE_SCHAFGEKAUFT == 3)
			{
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_06");	//�� ����������� �������, ������� ��.
				AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_07");	//� ��� �� �����?
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_08");	//����.
			};
		};
		PEPE_SCHAFGEKAUFT = PEPE_SCHAFGEKAUFT + 1;
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_09");	//� ���� ������������ ������. � � �� ���� ������� ���� �������.
	};
};


instance DIA_PEPE_PICKPOCKET(C_INFO)
{
	npc = bau_912_pepe;
	nr = 900;
	condition = dia_pepe_pickpocket_condition;
	information = dia_pepe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_pepe_pickpocket_condition()
{
	return c_beklauen(15,25);
};

func void dia_pepe_pickpocket_info()
{
	Info_ClearChoices(dia_pepe_pickpocket);
	Info_AddChoice(dia_pepe_pickpocket,DIALOG_BACK,dia_pepe_pickpocket_back);
	Info_AddChoice(dia_pepe_pickpocket,DIALOG_PICKPOCKET,dia_pepe_pickpocket_doit);
};

func void dia_pepe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pepe_pickpocket);
};

func void dia_pepe_pickpocket_back()
{
	Info_ClearChoices(dia_pepe_pickpocket);
};

