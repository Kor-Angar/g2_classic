
instance DIA_VINO_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_exit_condition;
	information = dia_vino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_vino_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_HALLO(C_INFO)
{
	npc = bau_952_vino;
	nr = 1;
	condition = dia_vino_hallo_condition;
	information = dia_vino_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vino_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_hallo_info()
{
	AI_Output(other,self,"DIA_Vino_HALLO_15_00");	//��� ���� ������?
	AI_Output(self,other,"DIA_Vino_HALLO_05_01");	//��� ��, ��� � ������. ������ �����, ����� ����, � ���� ��� ������ �� �������, �� ������ ������ ���� � ������ ���� ����� �����.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_HALLO_05_02");	//����������� �������� ������ ���� �����. �� � ����� ���������� � ���, ��� ��� �������� ���� ������� � ������ ����, ���� ���� ������� �� ���.
	};
};


instance DIA_VINO_SEEKWORK(C_INFO)
{
	npc = bau_952_vino;
	nr = 1;
	condition = dia_vino_seekwork_condition;
	information = dia_vino_seekwork_info;
	permanent = FALSE;
	description = "���� � ���-������ ������? � ��� ������.";
};


func int dia_vino_seekwork_condition()
{
	if((Npc_KnowsInfo(other,dia_lobart_worknow) || Npc_KnowsInfo(other,dia_lobart_kleidung)) && !Npc_IsDead(lobart) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_seekwork_info()
{
	AI_Output(other,self,"DIA_Vino_SeekWork_15_00");	//���� � ���-������ ������? � ��� ������.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_01");	//� �� ������ ���-������ ������ � ������� �������?
		AI_Output(other,self,"DIA_Vino_SeekWork_15_02");	//� ��� ��� ������ �����-��?
		AI_Output(self,other,"DIA_Vino_SeekWork_05_03");	//��! � ����� ������... � �����, �� � ���� ���������, �������.
		if(!Npc_IsDead(lobart))
		{
			AI_Output(self,other,"DIA_Vino_SeekWork_05_04");	//�� ���� �� ������ �������� �� ������� � �������� ��������� ��������, � ���� ������ ������������ ����. �� ������ ����� ����� ���� ����� �����!
			if(((Mob_HasItems("CHEST_LOBART",itar_bau_l) == TRUE) || (Npc_HasItems(lobart,itar_bau_l) > 0)) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (Npc_KnowsInfo(other,dia_lobart_kleidung) || Npc_KnowsInfo(other,dia_lobart_worknow)))
			{
				AI_Output(other,self,"DIA_Vino_SeekWork_15_05");	//�� ��������� ������ � ���� ������ ������ �������, ���� � ���� �������� �� �����.
				AI_Output(self,other,"DIA_Vino_SeekWork_05_06");	//���. � ���� ��� ��� ���� ������� ������, �� �� ������ �������� ��� � ������ ���-������ ������.
				AI_Output(self,other,"DIA_Vino_SeekWork_05_07");	//������� ��� ������� ����, � � ����� �������, ��� �� ����� ����� ��� (������� �������������).
				MIS_VINO_WEIN = LOG_RUNNING;
				Log_CreateTopic(TOPIC_VINO,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_VINO,LOG_RUNNING);
				b_logentry(TOPIC_VINO,"���� � ������� ���� ������� ����, �� ������ �������, ��� � ����� ���.");
			}
			else
			{
				AI_Output(self,other,"DIA_Vino_SeekWork_05_08");	//�� �� �� ������ ����� �� ����, �������?
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_09");	//� �� �����, ��� ���� ��� ����������. ������� ������ ��������� ���� �� ������� ������ ����� ������� ������, ��� � ���� ����������.
	};
};


instance DIA_VINO_BRINGWINE(C_INFO)
{
	npc = bau_952_vino;
	nr = 1;
	condition = dia_vino_bringwine_condition;
	information = dia_vino_bringwine_info;
	permanent = FALSE;
	description = "��� ���� ����.";
};


func int dia_vino_bringwine_condition()
{
	if((MIS_VINO_WEIN == LOG_RUNNING) && (Npc_HasItems(other,itfo_wine) > 0) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_bringwine_info()
{
	AI_Output(other,self,"DIA_Vino_BringWine_15_00");	//��� ���� ����.
	b_giveinvitems(other,self,itfo_wine,1);
	AI_Output(self,other,"DIA_Vino_BringWine_05_01");	//�, �������, �� ���� ����������, ��� �� ���� ���, ������? (�������) ���� ��� �������?
	if(!Npc_IsDead(lobart))
	{
		AI_Output(self,other,"DIA_Vino_BringWine_05_02");	//�� ��� �����, �������.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Vino_BringWine_05_03");	//������ ������� ������ ������� � ����.
		};
	};
	MIS_VINO_WEIN = LOG_SUCCESS;
	b_giveplayerxp(XP_VINOWEIN);
};


instance DIA_VINO_TOTHECITY(C_INFO)
{
	npc = bau_952_vino;
	nr = 3;
	condition = dia_vino_tothecity_condition;
	information = dia_vino_tothecity_info;
	permanent = FALSE;
	description = "� ����������� � �����.";
};


func int dia_vino_tothecity_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_vino_tothecity_info()
{
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_00");	//� ����������� � �����.
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_01");	//�?
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_02");	//�� ������ ���������� � ������ ���-������ ����������?
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_03");	//���. �� ����� ��������� ����� � �����. ��������, �� ���-������ �����... ��, ���-������, ��� ����� �������������� ����.
};


var int vino_gossip_orks;
var int vino_gossip_bugs;

instance DIA_VINO_PERM(C_INFO)
{
	npc = bau_952_vino;
	nr = 10;
	condition = dia_vino_perm_condition;
	information = dia_vino_perm_info;
	permanent = TRUE;
	description = "���� �����-������ ���������� �������?";
};


func int dia_vino_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_vino_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_perm_info()
{
	AI_Output(other,self,"DIA_Vino_PERM_15_00");	//���� �����-������ ���������� �������?
	if(VINO_GOSSIP_ORKS == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_01");	//� ���� ����������, ��� ����� ���� ��� ���, �� ���� ����, ��� ��� �����.
		AI_Output(self,other,"DIA_Vino_PERM_05_02");	//� ��� ��� � ���� ���� �� � ����� �������� ������.
		VINO_GOSSIP_ORKS = TRUE;
		KNOWS_ORK = TRUE;
	}
	else if((VINO_GOSSIP_BUGS == FALSE) && (MIS_ANDREHELPLOBART == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_03");	//��� �������� �������������� ��������� ��� ���� �������. ��� �������. ��� ������ ���, ��� �� ���������, ���� �� �� ������� ���-������.
		AI_Output(self,other,"DIA_Vino_PERM_05_04");	//��������� ���� ����� � ����� � �����, ��������� � �����, � ��������� ����������, ����� ���� �� ���� ������ ������� ��� �������!
		AI_Output(self,other,"DIA_Vino_PERM_05_05");	//�� �� �����, ��� � ����������. � ��� ��� � �� ���� ����� ��������.
		VINO_GOSSIP_BUGS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_06");	//����� ����, ��� � ��� ������ ����? ���.
	};
};


instance DIA_VINO_KAP3_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap3_exit_condition;
	information = dia_vino_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_vino_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_DMTAMSTART(C_INFO)
{
	npc = bau_952_vino;
	nr = 31;
	condition = dia_vino_dmtamstart_condition;
	information = dia_vino_dmtamstart_info;
	permanent = TRUE;
	description = "� ��� � ���� ����?";
};


func int dia_vino_dmtamstart_condition()
{
	if((KAPITEL == 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};


var int dia_vino_dmtamstart_onetime;

func void dia_vino_dmtamstart_info()
{
	AI_Output(other,self,"DIA_Vino_DMTAMSTART_15_00");	//� ��� � ���� ����?
	if((FOUNDVINOSKELLEREI == TRUE) && (DIA_VINO_DMTAMSTART_ONETIME == FALSE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_01");	//��������. ��������� ����� ��� ������ ������������ �������.
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_02");	//�������� ���������, ��� ��� ������� �� ������, ��� �� ����������� ���.
		b_giveplayerxp(XP_AMBIENTKAP3);
		DIA_VINO_DMTAMSTART_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_03");	//��� ������� � ������ ����� �������. ���-������ ������ �������� �� �������� �� � ������.
	};
};


instance DIA_VINO_OBESESSED(C_INFO)
{
	npc = bau_952_vino;
	nr = 32;
	condition = dia_vino_obesessed_condition;
	information = dia_vino_obesessed_info;
	permanent = TRUE;
	description = "��� � �����?";
};


func int dia_vino_obesessed_condition()
{
	if((NPCOBSESSEDBYDMT_VINO == FALSE) && (KAPITEL >= 3) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_vino_obesessed_info()
{
	if(Npc_IsDead(dmt_vino1) && Npc_IsDead(dmt_vino2) && Npc_IsDead(dmt_vino3) && Npc_IsDead(dmt_vino4))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Vino_Obesessed_15_00");	//��� � �����?
		AI_Output(self,other,"DIA_Vino_Obesessed_05_01");	//(�����) ����, ���� ��. ����� ��� ����� ����.
		AI_StopProcessInfos(self);
		dmt_vino1.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino2.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino3.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino4.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
};


instance DIA_VINO_HEILUNG(C_INFO)
{
	npc = bau_952_vino;
	nr = 55;
	condition = dia_vino_heilung_condition;
	information = dia_vino_heilung_info;
	permanent = TRUE;
	description = "�� ��� �� ����.";
};


func int dia_vino_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_VINO == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF) && ((Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000) == FALSE))
	{
		return TRUE;
	};
};


var int dia_vino_heilung_onetime;

func void dia_vino_heilung_info()
{
	AI_Output(other,self,"DIA_Vino_Heilung_15_00");	//�� ��� �� ����.
	AI_Output(self,other,"DIA_Vino_Heilung_05_01");	//��� ������... � �� ���� ������ �������� ���.
	if(DIA_VINO_HEILUNG_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Vino_Heilung_15_02");	//�� ������ ������� � ���������. �������, ������ ��� ����, ������ ������ ����.
		AI_Output(self,other,"DIA_Vino_Heilung_05_03");	//�� �������? ������. � ���������.
		b_npcclearobsessionbydmt(self);
		b_startotherroutine(vino,"Kloster");
		b_logentry(TOPIC_DEMENTOREN,"���� �������. � �������� ��� � ��������� �� �������. �������, �� ������ ��������� ���� �����.");
		b_giveplayerxp(XP_VINOFREEFROMDMT);
		DIA_VINO_HEILUNG_ONETIME = TRUE;
	};
};


instance DIA_VINO_KAP4_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap4_exit_condition;
	information = dia_vino_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_vino_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_PERM4OBSESSED(C_INFO)
{
	npc = bau_952_vino;
	nr = 41;
	condition = dia_vino_perm4obsessed_condition;
	information = dia_vino_perm4obsessed_info;
	permanent = TRUE;
	description = "��� ��?";
};


func int dia_vino_perm4obsessed_condition()
{
	if((hero.guild == GIL_KDF) && (NPCOBSESSEDBYDMT_VINO == TRUE) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000))
	{
		return TRUE;
	};
};


var int dia_vino_perm4obsessed_xp_onetime;

func void dia_vino_perm4obsessed_info()
{
	AI_Output(other,self,"DIA_Vino_PERM4OBSESSED_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_01");	//��, ��, ��� ��� ������. � �����, ����� ������ ������ ���. �� � ��� ��� �������� ���� �������� �������.
	if(DIA_VINO_PERM4OBSESSED_XP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_02");	//�� ������ ��������, �� ���� - ������ �� ����, ��� � ��������.
		b_giveplayerxp(XP_AMBIENT);
		DIA_VINO_PERM4OBSESSED_XP_ONETIME = TRUE;
	};
};


instance DIA_VINO_PERM45UND6(C_INFO)
{
	npc = bau_952_vino;
	nr = 42;
	condition = dia_vino_perm45und6_condition;
	information = dia_vino_perm45und6_info;
	permanent = TRUE;
	description = "���� �������?";
};


func int dia_vino_perm45und6_condition()
{
	if((KAPITEL >= 4) && (hero.guild != GIL_KDF) && (NPCOBSESSEDBYDMT_VINO == FALSE))
	{
		return TRUE;
	};
};

func void dia_vino_perm45und6_info()
{
	AI_Output(other,self,"DIA_Vino_PERM45UND6_15_00");	//���� �������?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_01");	//����� ��� ������ ����� ������.
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_02");	//��, ��������, ���� ���������� ��, ��?
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_03");	//�����, ��� ����� ��� �������� �������� ���� ����� � �������������� � ��������� �� ����� �����.
	};
	if((FOUNDVINOSKELLEREI == TRUE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_04");	//� ���������, ��������� ����� ��� ������������ �������. �������, ��� ��� ���� �� ���� �� �������.
	};
};


instance DIA_VINO_KAP5_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap5_exit_condition;
	information = dia_vino_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_vino_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_KAP6_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap6_exit_condition;
	information = dia_vino_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_vino_kap6_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_PICKPOCKET(C_INFO)
{
	npc = bau_952_vino;
	nr = 900;
	condition = dia_vino_pickpocket_condition;
	information = dia_vino_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_vino_pickpocket_condition()
{
	return c_beklauen(34,60);
};

func void dia_vino_pickpocket_info()
{
	Info_ClearChoices(dia_vino_pickpocket);
	Info_AddChoice(dia_vino_pickpocket,DIALOG_BACK,dia_vino_pickpocket_back);
	Info_AddChoice(dia_vino_pickpocket,DIALOG_PICKPOCKET,dia_vino_pickpocket_doit);
};

func void dia_vino_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_vino_pickpocket);
};

func void dia_vino_pickpocket_back()
{
	Info_ClearChoices(dia_vino_pickpocket);
};

