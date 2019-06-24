
instance DIA_MARDUK_KAP1_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap1_exit_condition;
	information = dia_marduk_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_marduk_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_JOB(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_job_condition;
	information = dia_marduk_job_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_marduk_job_condition()
{
	return TRUE;
};

func void dia_marduk_job_info()
{
	AI_Output(other,self,"DIA_Marduk_JOB_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Marduk_JOB_05_01");	//� ������� ��������� � �������� ������ ���.
};


instance DIA_MARDUK_ARBEIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_arbeit_condition;
	information = dia_marduk_arbeit_info;
	permanent = FALSE;
	description = "���� � ������� ���-������ ��� ����, ������?";
};


func int dia_marduk_arbeit_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_marduk_arbeit_info()
{
	AI_Output(other,self,"DIA_Marduk_Arbeit_15_00");	//���� � ������� ���-������ ��� ����, ������?
	AI_Output(self,other,"DIA_Marduk_Arbeit_05_01");	//��� ����? ���, ��� �� ����� ���� ������. ����� �������� �� ������ ������, ������������� � ������ ��������.
	MIS_MARDUKBETEN = LOG_RUNNING;
	b_startotherroutine(sergio,"WAIT");
	Log_CreateTopic(TOPIC_MARDUKBETEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MARDUKBETEN,LOG_RUNNING);
	b_logentry(TOPIC_MARDUKBETEN,"� ������� ������� ��� ������� ��� ����. �� ������, ��� ��� ����� ����� ���������� �� ���������.");
};


instance DIA_MARDUK_GEBETET(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_gebetet_condition;
	information = dia_marduk_gebetet_info;
	permanent = FALSE;
	description = "� ��������� �� ���������.";
};


func int dia_marduk_gebetet_condition()
{
	if((MIS_MARDUKBETEN == LOG_RUNNING) && Npc_KnowsInfo(other,pc_prayshrine_paladine))
	{
		return TRUE;
	};
};

func void dia_marduk_gebetet_info()
{
	AI_Output(other,self,"DIA_Marduk_Gebetet_15_00");	//� ��������� �� ���������.
	AI_Output(self,other,"DIA_Marduk_Gebetet_05_01");	//��� ������. � ������ ����������� � ����� ������.
	MIS_MARDUKBETEN = LOG_SUCCESS;
	b_giveplayerxp(XP_MARDUKBETEN);
	b_startotherroutine(sergio,"START");
};


instance DIA_MARDUK_EVIL(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_evil_condition;
	information = dia_marduk_evil_info;
	permanent = TRUE;
	description = "��� ����� '���'?";
};


func int dia_marduk_evil_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_evil_info()
{
	AI_Output(other,self,"DIA_Marduk_Evil_15_00");	//��� ����� '���'?
	AI_Output(self,other,"DIA_Marduk_Evil_05_01");	//��� �������. ��� ���������� �������, ��������� ���������� ������.
	AI_Output(self,other,"DIA_Marduk_Evil_05_02");	//��� �������������� ����, ������� �������� �������� ������� �� ��� ���� ������.
	AI_Output(self,other,"DIA_Marduk_Evil_05_03");	//������ - ���������� ����, ��������� � ����������.
	AI_Output(self,other,"DIA_Marduk_Evil_05_04");	//������ �� �� ���, ��� ������ ����� ������ ����� ������, ����� ������� ���� ������ � ��� ��� � �������� ����.
};


instance DIA_MARDUK_PAL(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_pal_condition;
	information = dia_marduk_pal_info;
	permanent = FALSE;
	description = "�� � ��������� ����� ������ ���� � ����������.";
};


func int dia_marduk_pal_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_pal_info()
{
	AI_Output(other,self,"DIA_Marduk_Pal_15_00");	//�� � ��������� ����� ������ ���� � ����������.
	AI_Output(self,other,"DIA_Marduk_Pal_05_01");	//���������. � ������� �� ����� ������, ������� ���� ����� ������...
	AI_Output(self,other,"DIA_Marduk_Pal_05_02");	//...�������� ���� ������� ����� ���� ������ �������.
	AI_Output(self,other,"DIA_Marduk_Pal_05_03");	//�� ��� - ������������� ������, �� �������� - ��� �����, ������ � ��� � ��� ������ �� ����� � ���������� ��� �������.
};


instance DIA_MARDUK_BEFORETEACH(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_beforeteach_condition;
	information = dia_marduk_beforeteach_info;
	permanent = FALSE;
	description = "�� ������ ����-������ ������� ����?";
};


func int dia_marduk_beforeteach_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_beforeteach_info()
{
	AI_Output(other,self,"DIA_Marduk_BEFORETEACH_15_00");	//�� ������ ����-������ ������� ����?
	AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_01");	//� ������� � ����� ���� � �����. � ���� ������� ���� ���� �����������.
	if(other.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_02");	//������ � ������ ������ �����.
	};
};


instance DIA_MARDUK_TEACH(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 10;
	condition = dia_marduk_teach_condition;
	information = dia_marduk_teach_info;
	permanent = TRUE;
	description = "����� ���� (�������� ���).";
};


func int dia_marduk_teach_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_beforeteach) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_marduk_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Marduk_TEACH_15_00");	//����� ����.
	Info_ClearChoices(dia_marduk_teach);
	Info_AddChoice(dia_marduk_teach,DIALOG_BACK,dia_marduk_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_ZAP] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_marduk_teach_zap);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_marduk_teach_icebolt);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_ICECUBE] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICECUBE,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_marduk_teach_icecube);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_CHARGEZAP] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_CHARGEZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_marduk_teach_thunderball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_marduk_teach_lightningflash);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_marduk_teach_icewave);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Marduk_TEACH_05_01");	//������ � �� ���� ������� ����.
		Info_ClearChoices(dia_marduk_teach);
	};
};

func void dia_marduk_teach_back()
{
	Info_ClearChoices(dia_marduk_teach);
};

func void dia_marduk_teach_zap()
{
	b_teachplayertalentrunes(self,other,SPL_ZAP);
};

func void dia_marduk_teach_icebolt()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};

func void dia_marduk_teach_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void dia_marduk_teach_icecube()
{
	b_teachplayertalentrunes(self,other,SPL_ICECUBE);
};

func void dia_marduk_teach_thunderball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEZAP);
};

func void dia_marduk_teach_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};


instance DIA_MARDUK_KAP2_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap2_exit_condition;
	information = dia_marduk_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_marduk_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP3_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap3_exit_condition;
	information = dia_marduk_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP3_HELLO(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 30;
	condition = dia_marduk_kap3_hello_condition;
	information = dia_marduk_kap3_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_marduk_kap3_hello_condition()
{
	if((KAPITEL == 3) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_hello_info()
{
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_00");	//����� ����������, ��� ���.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_01");	//� ����� ��� ��� �� ���� ���������?
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_02");	//������ �� ������?
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
	Info_AddChoice(dia_marduk_kap3_hello,"��� �� ���� ����.",dia_marduk_kap3_hello_notyourconcern);
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"������ �������.",dia_marduk_kap3_hello_soon);
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"� ������ � �����.",dia_marduk_kap3_hello_djg);
	};
};

func void dia_marduk_kap3_hello_notyourconcern()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00");	//��� �� ���� ����.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01");	//(��������) ������� ������ ������ ���� �������� � ��������. �� ������ �������� ���, ��� �� ����� �������� ���� ���.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02");	//(��������) ��� ����������, � �� ������ ���� ����������, ��� ����� ���� ���� ����� �����������. ������� �� ����!
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03");	//(���) ��, ������ ������ ����� �� ������� � ���������. ���� ��������� ����������, ��� ��� ���� ������� �������.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04");	//(��������������) � ������������ ����, �� ����� ����� ��� ����� - �� ������ ���������� �������. �� �� ����� ��������� ��������� �����������.
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_soon()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_Soon_15_00");	//������ �������.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_01");	//����� ����� ����������. � ���� ����� ��� ����� ���, � ���� ���� �������� ������������� ���.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_02");	//������ ���� ��� ����� � ����� ����� ����� ����. �� ������� ���� ����� ��� ����������� ���� ��������.
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_djg()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_DJG_15_00");	//� ������ � �����.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_01");	//����� ����� ���������� �� ��� ��������������. �������, �� ������� ���.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_02");	//�� �� �������, ��� �� � ������, ����� � ���� ����� ������� ��������.
	Info_ClearChoices(dia_marduk_kap3_hello);
};


instance DIA_MARDUK_TRAINPALS(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 32;
	condition = dia_marduk_trainpals_condition;
	information = dia_marduk_trainpals_info;
	permanent = TRUE;
	description = "���� �� ������ ������� ����?";
};


var int marduk_trainpals_permanent;

func int dia_marduk_trainpals_condition()
{
	if((hero.guild == GIL_PAL) && (MARDUK_TRAINPALS_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_marduk_trainpals_info()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_00");	//���� �� ������ ������� ����?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_01");	//�����������, � �� ���� ������� ���� ������ ����������.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_02");	//�� � ����, �������, ������� �������� ������ � ��� ���� �� ����.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_03");	//����� ����, � ��� ����������� ������ ����������� ���� � ��������� ����.
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_04");	//� �����?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_05");	//����� �� ���� ������ ����� �����. �� ������ ������� ����� ��������� � ������.
	Info_ClearChoices(dia_marduk_trainpals);
	Info_AddChoice(dia_marduk_trainpals,"����� ����, �����.",dia_marduk_trainpals_later);
	Info_AddChoice(dia_marduk_trainpals,"��� �� ������ ���� �������?",dia_marduk_trainpals_meaning);
	Info_AddChoice(dia_marduk_trainpals,"��� ����� ��������� ����?",dia_marduk_trainpals_blessing);
};

func void dia_marduk_trainpals_later()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Later_15_00");	//����� ����, �����.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Later_05_01");	//����� ���������� � ����� �����.
	Info_ClearChoices(dia_marduk_trainpals);
};

func void dia_marduk_trainpals_meaning()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_00");	//��� �� ������ ������� ����?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_01");	//����� ����� ������� ��� ���, �� ������� ������������ ������� ����� ������������ ����.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_02");	//������ �������� �� ����� ��������� ������������ ��� ���� � ����� � ��� ���������� �� ��� �����.
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_03");	//� ��� �� ������ ������� �� ����?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_04");	//� ���� ��������� ���� �� ���������� ����, ����� �� ������ �������� ������ � �������� �� ����� ����.
};

func void dia_marduk_trainpals_blessing()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Blessing_15_00");	//��� ����� ��������� ����?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_01");	//��������� ���� - ��� ���� �� ����� ��������� �������� ���������.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_02");	//�� ����� ���� ��������� ������ ���� ������ ��������� ����� ��� �������� � ������� ���� ������������� ����.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_03");	//���, ���������� ����� �������, - ����� ������, ��� ���� � ��������, � �� �� ���������� � ��� �� ����� ����� ����.
	MARDUK_TRAINPALS_PERMANENT = TRUE;
};


instance DIA_MARDUK_SWORDBLESSING(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 33;
	condition = dia_marduk_swordblessing_condition;
	information = dia_marduk_swordblessing_info;
	permanent = TRUE;
	description = "� ���� �������� ��� ���.";
};


func int dia_marduk_swordblessing_condition()
{
	if(MARDUK_TRAINPALS_PERMANENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_marduk_swordblessing_info()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_15_00");	//� ���� �������� ��� ���.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_01");	//���� �� ������ ����� ������� ���� ���, ���� ������� ����� ����� ���������� ���.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_02");	//����� �� ������ ��������� � ��� ������� � ��������.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_03");	//�� ����� ������� � ����� ��������� ������������� ������ ������� ������ �� ������ ��������� � ������ ������������ � ������ � ����� ������ ���.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_04");	//���� ����� ����� ������������ � ����, ���� ��� � ��� �� ������ ����� ������� ����� ��������.
	Info_ClearChoices(dia_marduk_swordblessing);
	Info_AddChoice(dia_marduk_swordblessing,DIALOG_BACK,dia_marduk_swordblessing_back);
	Info_AddChoice(dia_marduk_swordblessing,"��� �� �������������?",dia_marduk_swordblessing_donation);
	Info_AddChoice(dia_marduk_swordblessing,"��� ��� ����� ���������� ���?",dia_marduk_swordblessing_oreblade);
};

func void dia_marduk_swordblessing_back()
{
	Info_ClearChoices(dia_marduk_swordblessing);
};

func void dia_marduk_swordblessing_donation()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_Donation_15_00");	//��� �� �������������?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_01");	//��, �������� �������, ��� ����� ������� ����, ����� � 5000 ����� ����� ����� ��� ����������.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_02");	//�������, �� ������ ������������ ������.
};

func void dia_marduk_swordblessing_oreblade()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_00");	//��� ��� ����� ���������� ���?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01");	//�������� ���������� � ������ � �������� �������.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02");	//�� ������������ ��������� ����������� ��������, ���� ��� ��������� �� �������.
	if(Npc_IsDead(harad) == TRUE)
	{
		AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_03");	//����� �����.
		AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04");	//��� ����� ����, �� ����� ���� �������� ����� ����������� �� ������� ������ � ������� ����������.
	};
};


instance DIA_MARDUK_KAP3_PERM(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 39;
	condition = dia_marduk_kap3_perm_condition;
	information = dia_marduk_kap3_perm_info;
	permanent = TRUE;
	description = "���� �������?";
};


func int dia_marduk_kap3_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_00");	//���� �������?
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_01");	//��, ����� ������� �������� ��������� � ���� ����.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_02");	//�� ����� ���� ������, ���� �� ����� ������ ����� ����������. � ��� ������ ������� ��������.
	};
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_04");	//(����������) ����, ��-��������, ��� ����� � �����.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_05");	//�� �� ������ � ����?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_06");	//���� �� ���������, �����, ��� ���� �� �����.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_07");	//(���) ����� ����� ���� ���! ��� ����� ������� ������, �� � �����, ��� ��� ������ ������.
	Info_ClearChoices(dia_marduk_kap3_perm);
	Info_AddChoice(dia_marduk_kap3_perm,DIALOG_BACK,dia_marduk_kap3_perm_back);
	Info_AddChoice(dia_marduk_kap3_perm,"��� ����� ������?",dia_marduk_kap3_perm_andnow);
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"������ �� �������.",dia_marduk_kap3_perm_bennetisnotguilty);
	}
	else
	{
		Info_AddChoice(dia_marduk_kap3_perm,"������ ��� ������?",dia_marduk_kap3_perm_murderer);
	};
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"���� ������� ���?",dia_marduk_kap3_perm_thief);
	};
};

func void dia_marduk_kap3_perm_back()
{
	Info_ClearChoices(dia_marduk_kap3_perm);
};

func void dia_marduk_kap3_perm_andnow()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_00");	//��� ����� ������?
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01");	//�� ����� ������������ ����, ���� �� �� �� �������. �� ������ ���, � �� ������� ����������� ���������.
		AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_02");	//��� ����� ������� ����� �����, ��� ���� ���.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03");	//�� ����� ������� ���. � �� �����, ������� ������� �� ��� �����������, �� �� ������ ���.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04");	//������� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05");	//��������, � ��� ����� ��������, ����������, ���� �� ����� ������� ������������.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06");	//������ ��������� ����� ���������� � ������.
	};
};

func void dia_marduk_kap3_perm_bennetisnotguilty()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00");	//������ �� �������. ��������� ������.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01");	//������ �� ��� ������?
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02");	//� ����� ��������������.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03");	//������ ��� �������, ��� ������������� � �������� - ���� ����� ���������� �����.
};

func void dia_marduk_kap3_perm_murderer()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_00");	//������ ��� ������?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01");	//�� �������, ��. �� �������� ���� �� ����������� � ����� �����.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_02");	//���?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03");	//� �� ���� ��� �����. �� ����� ���������, �����������, ���� ��������, �� ������� ����� ������� ���������.
};

func void dia_marduk_kap3_perm_thief()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_thief_15_00");	//���� ������� ���?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_01");	//� �� ����, �� ������� �� ����� ��� ��������� � �����.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_02");	//�� �����, ��� �� ����������, ��� ����� ������ �� ���������, ���� ������ ������� ��� � ������ ��� ������ ������.
};


instance DIA_MARDUK_KAP4_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap4_exit_condition;
	information = dia_marduk_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_marduk_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP4U5_PERM(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 49;
	condition = dia_marduk_kap4u5_perm_condition;
	information = dia_marduk_kap4u5_perm_info;
	permanent = TRUE;
	description = "���� �������?";
};


func int dia_marduk_kap4u5_perm_condition()
{
	if((KAPITEL == 4) || (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_marduk_kap4u5_perm_info()
{
	AI_Output(other,self,"DIA_Marduk_Kap4U5_PERM_15_00");	//���� �������?
	AI_Output(self,other,"DIA_Marduk_Kap4U5_PERM_05_01");	//���, �, ����, �������� ��� ��� ����� �����������.
};


instance DIA_MARDUK_KAP5_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap5_exit_condition;
	information = dia_marduk_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_marduk_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_PICKPOCKET(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 900;
	condition = dia_marduk_pickpocket_condition;
	information = dia_marduk_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_marduk_pickpocket_condition()
{
	return c_beklauen(36,40);
};

func void dia_marduk_pickpocket_info()
{
	Info_ClearChoices(dia_marduk_pickpocket);
	Info_AddChoice(dia_marduk_pickpocket,DIALOG_BACK,dia_marduk_pickpocket_back);
	Info_AddChoice(dia_marduk_pickpocket,DIALOG_PICKPOCKET,dia_marduk_pickpocket_doit);
};

func void dia_marduk_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_marduk_pickpocket);
};

func void dia_marduk_pickpocket_back()
{
	Info_ClearChoices(dia_marduk_pickpocket);
};

