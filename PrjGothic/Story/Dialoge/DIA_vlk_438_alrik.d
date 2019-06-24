
instance DIA_ALRIK_EXIT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 999;
	condition = dia_alrik_exit_condition;
	information = dia_alrik_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alrik_exit_condition()
{
	return TRUE;
};

func void dia_alrik_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALRIK_PICKPOCKET(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 900;
	condition = dia_alrik_pickpocket_condition;
	information = dia_alrik_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_alrik_pickpocket_condition()
{
	return c_beklauen(55,50);
};

func void dia_alrik_pickpocket_info()
{
	Info_ClearChoices(dia_alrik_pickpocket);
	Info_AddChoice(dia_alrik_pickpocket,DIALOG_BACK,dia_alrik_pickpocket_back);
	Info_AddChoice(dia_alrik_pickpocket,DIALOG_PICKPOCKET,dia_alrik_pickpocket_doit);
};

func void dia_alrik_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alrik_pickpocket);
};

func void dia_alrik_pickpocket_back()
{
	Info_ClearChoices(dia_alrik_pickpocket);
};


instance DIA_ALRIK_HALLO(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_hallo_condition;
	information = dia_alrik_hallo_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_alrik_hallo_condition()
{
	return TRUE;
};

func void dia_alrik_hallo_info()
{
	AI_Output(other,self,"DIA_Alrik_Hallo_15_00");	//��� �� ������� �����?
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_01");	//(�������) ��� ��� ���!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_02");	//� ��� ��� ��� ������ �����? � ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_03");	//� ��������� ������� �����������.
	};
	AI_Output(self,other,"DIA_Alrik_Hallo_09_04");	//�� ���� �� ������ � ����, ��� � ����� ���� - �� � ��������� ���.
};


instance DIA_ALRIK_YOUFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_youfight_condition;
	information = dia_alrik_youfight_info;
	permanent = FALSE;
	description = "�� ����������� ���?";
};


func int dia_alrik_youfight_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_hallo))
	{
		return TRUE;
	};
};

func void dia_alrik_youfight_info()
{
	AI_Output(other,self,"DIA_Alrik_YouFight_15_00");	//�� ����������� ���?
	AI_Output(self,other,"DIA_Alrik_YouFight_09_01");	//������ ����, � ������� �� ������.
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_YouFight_09_02");	//� ����� �����!
	};
	AI_Output(self,other,"DIA_Alrik_YouFight_09_03");	//�� ������� � �������� �������� - ����� ��� ���!
};


instance DIA_ALRIK_REGELN(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_regeln_condition;
	information = dia_alrik_regeln_info;
	permanent = FALSE;
	description = "������ ������� ����?";
};


func int dia_alrik_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_youfight))
	{
		return TRUE;
	};
};

func void dia_alrik_regeln_info()
{
	AI_Output(other,self,"DIA_Alrik_Regeln_15_00");	//������ ������� ����?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_01");	//��� ������: ��������� ��� ������� ������. ������� �����, ��������� � ������� �����!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_02");	//�� ���������, ���� ���� �� ��� �� ������. ��� ������ ���� �� ��� �������� ������������� �� �����, ��� �������, �������?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_03");	//��� ������ - ��� ��������! �� ����, ���� �� ����� �� ���, �� � �������!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_04");	//������ - 50 �������. ���� �� ��������, �� �������� 100 �����. ���� ��� - ��, ����� ���� ������ ��������� � ����. (����������)
	AI_Output(self,other,"DIA_Alrik_Regeln_09_05");	//�����?
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//��!
};

func void b_alrik_again()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_03");	//��� ����? �� ������ ��������� �� ���� ��� ���? � �����, �� ��� ����� � ���� �����...
};


instance DIA_ALRIK_NEWFIGHTS3(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_newfights3_condition;
	information = dia_alrik_newfights3_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alrik_newfights3_condition()
{
	if((KAPITEL >= 3) && (KAPITEL <= 4) && (ALRIK_ARENAKAMPFVERLOREN <= 6))
	{
		return TRUE;
	};
};

func void dia_alrik_newfights3_info()
{
	b_addfightskill(self,NPC_TALENT_1H,20);
	b_setattributestochapter(self,4);
	b_alrik_again();
};


instance DIA_ALRIK_NEWFIGHTS5(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_newfights5_condition;
	information = dia_alrik_newfights5_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alrik_newfights5_condition()
{
	if((KAPITEL >= 5) && (ALRIK_ARENAKAMPFVERLOREN <= 9))
	{
		return TRUE;
	};
};

func void dia_alrik_newfights5_info()
{
	b_addfightskill(self,NPC_TALENT_1H,20);
	b_setattributestochapter(self,6);
	b_alrik_again();
};

func void b_alrik_enough()
{
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_05");	//��� �������, �� ���������� ������� �����.
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_06");	//�� ����� ���� �������, �� ��� ����� ��� ��� ����� ����� �������� ����...
};

func void b_alrik_comebacklater()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_02");	//������ �����. � ���� � ������������...
};


instance DIA_ALRIK_WANNAFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_wannafight_condition;
	information = dia_alrik_wannafight_info;
	permanent = TRUE;
	description = "� ���� ��������� � �����!";
};


func int dia_alrik_wannafight_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_regeln) && (self.aivar[AIV_ARENAFIGHT] == AF_NONE))
	{
		return TRUE;
	};
};

func void dia_alrik_wannafight_info()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_15_00");	//� ���� ��������� � �����!
	Info_ClearChoices(dia_alrik_wannafight);
	if(((ALRIK_ARENAKAMPFVERLOREN > 0) && (Npc_HasItems(self,itmw_alrikssword_mis) == 0)) || (Npc_HasEquippedMeleeWeapon(self) == FALSE))
	{
		if(MIS_ALRIK_SWORD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_01");	//������� ����� ��� ��� ���. � ��� ���������...
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_02");	//���, ���. ������ ��� ����� ������ ���� ��� ���, ��� ��������� ����� ������ �������!
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_03");	//��� ��������� ���� ����� �������� ������� ���� ���.
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_04");	//� ��� � ���������! ���� �� ������� ��� ���, � ����� ����� ��������� � �����!
			ALRIK_VOMSCHWERTERZAEHLT = TRUE;
			Log_CreateTopic(TOPIC_ALRIKSCHWERT,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_ALRIKSCHWERT,LOG_RUNNING);
			b_logentry(TOPIC_ALRIKSCHWERT,"������ ������ ���� ��� �������� �����. �� ����� ��������� �� ����, ������ ���� � ����� ��� ��� ���.");
		};
	}
	else if((KAPITEL <= 2) && (ALRIK_ARENAKAMPFVERLOREN > 3))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_00");	//� �����, ���� ������...
		AI_Output(self,other,"DIA_Alrik_Add_09_01");	//��� ��� ������� �����������.
		b_alrik_comebacklater();
	}
	else if((KAPITEL >= 3) && (KAPITEL <= 4) && (ALRIK_ARENAKAMPFVERLOREN > 6))
	{
		b_alrik_enough();
		b_alrik_comebacklater();
	}
	else if((KAPITEL >= 5) && (ALRIK_ARENAKAMPFVERLOREN > 9))
	{
		b_alrik_enough();
		AI_Output(self,other,"DIA_Alrik_Add_09_04");	//����� ����, � ������� ��������� ��� ���������� �����.
		AI_Output(self,other,"DIA_Alrik_Add_09_05");	//� ���� ������. � ��������� ��������� ���� ������ �������� � ������...
		AI_Output(self,other,"DIA_Alrik_Add_09_06");	//��� �����, �����, � ������ ��������� �����...
	}
	else if(Wld_IsTime(11,0,19,0))
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_07");	//� ���� ���� 50 �������?
		Info_ClearChoices(dia_alrik_wannafight);
		Info_AddChoice(dia_alrik_wannafight,"���...",dia_alrik_wannafight_nogold);
		if(Npc_HasItems(other,itmi_gold) >= 50)
		{
			Info_AddChoice(dia_alrik_wannafight,"���, �����...",dia_alrik_wannafight_gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_08");	//� �������� ������ � ������� �� ������.
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_09");	//��� ����� �����, ������ ���� ���� ���������� ��������, �������� ������!
		if(Wld_IsTime(19,0,3,30))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_10");	//������ ������� ������. ������� ������ � �������!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_11");	//��� ��� ������� ����, ������ �����!
		};
	};
};

func void dia_alrik_wannafight_gold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//���, �����...
	b_giveinvitems(other,self,itmi_gold,50);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_01");	//(������) � ��� ����� ����!
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_02");	//������ �������...
	Npc_RemoveInvItems(self,itmi_gold,Npc_HasItems(self,itmi_gold));
	CreateInvItems(self,itmi_gold,100);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_03");	//�� �����?
	self.aivar[AIV_ARENAFIGHT] = AF_RUNNING;
	ALRIK_KAEMPFE = ALRIK_KAEMPFE + 1;
	Info_ClearChoices(dia_alrik_wannafight);
	Info_AddChoice(dia_alrik_wannafight,"������� ����������...",dia_alrik_wannafight_moment);
	Info_AddChoice(dia_alrik_wannafight,"��� ����!",dia_alrik_wannafight_now);
};

func void dia_alrik_wannafight_nogold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//���...
	AI_Output(self,other,"DIA_Alrik_WannaFight_NoGold_09_01");	//����� ����� ��! ��� ������ ��� �� �����!
	Info_ClearChoices(dia_alrik_wannafight);
};

func void dia_alrik_wannafight_now()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NOW_15_00");	//��� ����!
	AI_Output(self,other,"DIA_Alrik_WannaFight_NOW_09_01");	//���������, �� ��� �� ��������!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,itpo_health_03,1);
		b_useitem(self,itpo_health_03);
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_alrik_wannafight_moment()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Moment_15_00");	//������� ����������...
	AI_Output(self,other,"DIA_Alrik_WannaFight_Moment_09_01");	//��� ������... � � ������� ������!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,itpo_health_03,1);
		b_useitem(self,itpo_health_03);
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ALRIK_AFTERFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_afterfight_condition;
	information = dia_alrik_afterfight_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_alrik_afterfight_condition()
{
	if((self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		if(self.aivar[AIV_ARENAFIGHT] != AF_NONE)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,zs_talk))
		{
			return TRUE;
		};
	};
};

func void dia_alrik_afterfight_info()
{
	if((self.aivar[AIV_LASTPLAYERAR] == AR_NONE) && (self.aivar[AIV_ARENAFIGHT] != AF_NONE) && (self.aivar[AIV_ARENAFIGHT] != AF_AFTER_PLUS_DAMAGE))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_00");	//��, ������! �� � ����� � ����.
			if(Npc_HasItems(self,itmi_gold) >= 100)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_01");	//��� ���� 100 �������! �� ��������� ��!
				b_giveinvitems(self,other,itmi_gold,100);
			}
			else if(Npc_HasItems(self,itmi_gold) == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_02");	//� ����, �� ��� ������ ���� ������.
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_03");	//�� ��� �� ���������, ���� � ��� �� ����� ��� ���� - � ����� ���� �����!
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_04");	//�� ������� � ���� ��������, ���� � ��� ��� ��������!
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_05");	//��� ������ ���! �� �����, ��� ������ ��� ����� ���� ������! ��� ���������.
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
			};
			ALRIK_ARENAKAMPFVERLOREN = ALRIK_ARENAKAMPFVERLOREN + 1;
		}
		else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_06");	//�� ������ ������. �� ���� ������ ������� - �� ������������� ��������, ��� ������ �� ������ ����! (����������)
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_07");	//��, � �� ������������, ���, ��� ������ �� ���� �����������! ���� ������ ����������� ��� ���, � � ����� �������!
		};
		if(ALRIK_KAEMPFE == 1)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_08");	//� ��� ����: ����� �� ������� � ���, ��� ���������� �� �������.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_09");	//��������� ������ �� �������� ����������� �������� ���� �� �������. � ��� ����� �� ����� ����� �������� ������ �� ���.
			};
		};
		self.aivar[AIV_ARENAFIGHT] = AF_NONE;
		self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	}
	else
	{
		if(self.aivar[AIV_ARENAFIGHT] == AF_AFTER_PLUS_DAMAGE)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_10");	//��� ��� �������, ��, ������!
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_11");	//� �� �����, ����� ���-������ �� ����������� ���� ��������.
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_12");	//�������� ������!
		}
		else
		{
			if(ALRIK_KAEMPFE == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_13");	//���� �� ����� ��������� �� ����, ���� ����� ���� ������� ����.
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_14");	//���� �� ����� ��������� ��� ���, ���� ����� ���� ������� ����!
			};
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_15");	//� �� ���� ����� ���� � ����� �������, ��� ��! ����������!
		};
		self.aivar[AIV_ARENAFIGHT] = AF_NONE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_ALRIK_DUWOHNST(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_duwohnst_condition;
	information = dia_alrik_duwohnst_info;
	permanent = FALSE;
	description = "�� '������' �� ���� �������?";
};


func int dia_alrik_duwohnst_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_youfight))
	{
		return TRUE;
	};
};

func void dia_alrik_duwohnst_info()
{
	AI_Output(other,self,"DIA_Alrik_DuWohnst_15_00");	//(���������) �� '������' �� ���� �������?
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_01");	//������ ��������. (����������) ����� ������ ������� �����, ��� � ����, ����� ��������� ���� ������� �������!
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_02");	//� ��� ������������ � �����, �� � ������ ��� ������� � ������ ������ �������� �����������.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_03");	//� ��� � ������� � ���� ����. ��� ��������� 100 ������� ���� � ������ ���������� � ��������� �����.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_04");	//� ��� � ������� ����� �����������. ��� ���� �������� ������� ��� ���.
	ALRIK_VOMSCHWERTERZAEHLT = TRUE;
};


instance DIA_ALRIK_WERSCHWERT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_werschwert_condition;
	information = dia_alrik_werschwert_info;
	permanent = FALSE;
	description = "���� �� ������ ���� ���?";
};


func int dia_alrik_werschwert_condition()
{
	if((ALRIK_VOMSCHWERTERZAEHLT == TRUE) && (MIS_ALRIK_SWORD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_alrik_werschwert_info()
{
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_00");	//���� �� ������ ���� ���?
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_01");	//� ������� ��� � �������� � �������� ������� �� ���-����� ����.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_02");	//��� ����� �����. ������ � ����, ��� �� ��� ���, ����� �����������.
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_03");	//�� ���� �� ������ ��� ���� ��� ������ ���...
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_04");	//��� ������ ���. �� ���� �� ����� �� ���� ��������. ������ ����� �� ���� �������, ��� � �������������� ������. (����������)
	MIS_ALRIK_SWORD = LOG_RUNNING;
};


var int alrik_einmalschwertbonus;

instance DIA_ALRIK_HAVESWORD(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_havesword_condition;
	information = dia_alrik_havesword_info;
	permanent = TRUE;
	description = "� ������ ���� ���!";
};


func int dia_alrik_havesword_condition()
{
	if(Npc_HasItems(other,itmw_alrikssword_mis) > 0)
	{
		return TRUE;
	};
};

func void dia_alrik_havesword_info()
{
	AI_Output(other,self,"DIA_Alrik_HaveSword_15_00");	//� ������ ���� ���!
	b_giveinvitems(other,self,itmw_alrikssword_mis,1);
	if(MIS_ALRIK_SWORD != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_01");	//��! �� ����������� ������� ���������, ��� ������!
		MIS_ALRIK_SWORD = LOG_SUCCESS;
		b_giveplayerxp(XP_ALRIKSSWORD);
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_02");	//�������! ���������, ���������� �� �� ������� ���� ������!
	};
	if(ALRIK_EINMALSCHWERTBONUS == FALSE)
	{
		b_addfightskill(self,NPC_TALENT_1H,20);
		ALRIK_EINMALSCHWERTBONUS = TRUE;
	};
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_ALRIK_KRIEG(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_krieg_condition;
	information = dia_alrik_krieg_info;
	permanent = FALSE;
	description = "��� �� ������ � ����� � ������?";
};


func int dia_alrik_krieg_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_duwohnst) || (hero.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_alrik_krieg_info()
{
	AI_Output(other,self,"DIA_Alrik_Krieg_15_00");	//��� �� ������ � ����� � ������?
	AI_Output(self,other,"DIA_Alrik_Krieg_09_01");	//��� ����� ������ �������. ��� ����� ���� ��� ����� �����.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_02");	//����� ��������. ������� ����������� ������������ ���������, ������� ����������� ����������� �������.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_03");	//�� �� ������� �����. ���� ����� ������ �� ����������, ����������� ����������.
};


var int alrik_vorauserzaehlt;

instance DIA_ALRIK_AUSBILDEN(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_ausbilden_condition;
	information = dia_alrik_ausbilden_info;
	permanent = TRUE;
	description = "�� ������ ������� ����?";
};


func int dia_alrik_ausbilden_condition()
{
	if((Npc_KnowsInfo(other,dia_alrik_duwohnst) || (hero.guild != GIL_NONE)) && (ALRIK_TEACH1H == FALSE))
	{
		return TRUE;
	};
};

func void dia_alrik_ausbilden_info()
{
	AI_Output(other,self,"DIA_Alrik_Ausbilden_15_00");	//�� ������ ������� ����?
	if((ALRIK_KAEMPFE == 0) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Alrik_Ausbilden_09_01");	//���� �� ������������� ������ ��������� ���������, �� ������ ������ ����. (����������) �� ���� ���� � �� ������ �������������� �����.
		ALRIK_VORAUSERZAEHLT = TRUE;
	}
	else
	{
		if(ALRIK_VORAUSERZAEHLT == TRUE)
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_02");	//� ����� ���� �����. � ����� ���� �����, ��� � ���� - ���� � ���� ���������� �����.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_03");	//��� ������ � ���� ����� ����������� ���� - ����������.
		};
		ALRIK_TEACH1H = TRUE;
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"������ ����� ������� ���� ��������� �������� ���������� �������. �� ��������� �� ������� � �������� ��������.");
	};
};


var int alrik_merke_1h;

instance DIA_ALRIK_TEACH(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_teach_condition;
	information = dia_alrik_teach_info;
	permanent = TRUE;
	description = "����� ���� ���������� � �����!";
};


func int dia_alrik_teach_condition()
{
	if(ALRIK_TEACH1H == TRUE)
	{
		return TRUE;
	};
};

func void dia_alrik_teach_info()
{
	AI_Output(other,self,"DIA_Alrik_Teach_15_00");	//����� ���� ���������� � �����!
	ALRIK_MERKE_1H = other.hitchance[NPC_TALENT_1H];
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_alrik_teach_1h_5);
};

func void dia_alrik_teach_back()
{
	if(other.hitchance[NPC_TALENT_1H] >= 30)
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_00");	//�� ������ �� �������!
	}
	else if(other.hitchance[NPC_TALENT_1H] > ALRIK_MERKE_1H)
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_01");	//� ���� ��� ����� ����������. ����� �� ������� ��������� ������!
	};
	Info_ClearChoices(dia_alrik_teach);
};

func void dia_alrik_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,30);
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_alrik_teach_1h_5);
};

func void dia_alrik_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,30);
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_alrik_teach_1h_5);
};

