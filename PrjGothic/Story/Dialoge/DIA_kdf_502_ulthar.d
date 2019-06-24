
instance DIA_ULTHAR_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_exit_condition;
	information = dia_ulthar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_ulthar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_GREET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_greet_condition;
	information = dia_ulthar_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulthar_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && !Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulthar_greet_info()
{
	AI_Output(self,other,"DIA_Ulthar_GREET_05_00");	//��������, ����� ��������� ������ ��������� ����� ������ �������. �� �������� � ����� �����, ��� ���.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_01");	//� ������ ������ ������� ������?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_02");	//��� ��� ���� - ������������� ���� ������. �������� ��� ����, �� �������� ��������� �����������, ������� ������ ������ ��������� ������.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_03");	//���� �� ����� ���������� ����� �����, �� ������ �� ��������� � ����, ��� ��� ������� ������ ������������ ����� ������ ����� �� �����.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_04");	//��, ��� ��� ���������, ��� ���������� � ����...
	AI_Output(other,self,"DIA_Ulthar_GREET_15_05");	//� ��� �� ������� �� ���� ��������, ��� ���������� ������ �������� �� ����� ������, ��� ������ ���� ��� ���?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_06");	//� �������, ��� ������ ���� ����� ������, �� �� ������ ������� �������� ���� �����, ������ ��� ����������� �����-������ ����.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_07");	//���� �� �������� ���� �������� � ������ ����������� ��������, �� ������ �� ��������. ������� �������� ���� ������, � �� ���� �������, ��� ����� �������.
};


instance DIA_ULTHAR_MAGETEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_magetest_condition;
	information = dia_ulthar_magetest_info;
	description = "�������� ��� �� ��������� ������.";
};


func int dia_ulthar_magetest_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_greet))
	{
		return TRUE;
	};
};

func void dia_ulthar_magetest_info()
{
	AI_Output(other,self,"DIA_Ulthar_MAGETEST_15_00");	//�������� ��� �� ��������� ������.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_01");	//��� ���� ��� ���������� ���������� �������� � ������� �����. �� ������ ���� ����� ������ ��� ���������.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_02");	//� ����� ���� �������� ����������� ��� ����.
};


instance DIA_ULTHAR_WHEN(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 3;
	condition = dia_ulthar_when_condition;
	information = dia_ulthar_when_info;
	permanent = TRUE;
	description = "����� ������� ��� ���������?";
};


func int dia_ulthar_when_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_magetest) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulthar_when_info()
{
	AI_Output(other,self,"DIA_Ulthar_WHEN_15_00");	//����� ������� ��� ���������?
	AI_Output(self,other,"DIA_Ulthar_WHEN_05_01");	//��� ������ �� ������� ���� ������, �� ������� �� ���� ��������� ����������� � �������� ���������.
};


instance DIA_ULTHAR_TEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 10;
	condition = dia_ulthar_test_condition;
	information = dia_ulthar_test_info;
	permanent = FALSE;
	description = "� ����� ������ ���� ���������, ������.";
};


func int dia_ulthar_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire))
	{
		return TRUE;
	};
};

func void dia_ulthar_test_info()
{
	AI_Output(other,self,"DIA_Ulthar_TEST_15_00");	//� ����� ������ ���� ���������, ������.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_01");	//� �� �������, ��� �� ������ ���� ������ �����.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_02");	//�� � ����������, ��� �� �� ���������, ������ ����� �� ���� �����������. �����, ��� ������������ ��� �� �������� ��������� �����.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_03");	//��� ����� ����� ����� �� ����������� ����� ���������. � ������ ��� � �������� � ����� ������ ������� ������ ������ ��������.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_04");	//����� ��� ��� ������� � ����������� ���������, � ������ ��� ������ � ���������� ���� ������� ������ - � ������ � ����������.
	AI_Output(other,self,"DIA_Ulthar_TEST_15_05");	//������� ��� �������� ���� ������������, ��� ����� ��� ���������.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_06");	//����� � �� ���� ������ ���������� ���� ��������. ��� ��� ��������� ��� ����:
	AI_Output(self,other,"DIA_Ulthar_TEST_05_07");	//������ ���� '�������� ������'. ��� ��� - �� ������� ���� �����.
	MIS_RUNE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RUNE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUNE,LOG_RUNNING);
	b_logentry(TOPIC_RUNE,"������ ��� ��� ���������. � ������ ������� ���� �������� ������.");
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_RUNNING(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 10;
	condition = dia_ulthar_running_condition;
	information = dia_ulthar_running_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_ulthar_running_condition()
{
	if((MIS_RUNE == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (Npc_HasItems(other,itru_firebolt) == 0))
	{
		return TRUE;
	};
};

func void dia_ulthar_running_info()
{
	AI_Output(self,other,"DIA_Ulthar_RUNNING_05_00");	//�� ������ ���� ������. ��������� ��.
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SUCCESS(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_success_condition;
	information = dia_ulthar_success_info;
	permanent = FALSE;
	description = "� ������ ����!";
};


func int dia_ulthar_success_condition()
{
	if((MIS_RUNE == LOG_RUNNING) && (Npc_HasItems(hero,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulthar_success_info()
{
	AI_Output(other,self,"DIA_Ulthar_SUCCESS_15_00");	//� ������ ����!
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_01");	//�������, ���������. ����� �� - ���� ������ ����.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_02");	//����� �� ���������� ������� ����� ����, �� ������� ������������ ��.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_03");	//�� ������ ��� ��������� � ����� ������� ��������������.
	if((MIS_GOLEM == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE))
	{
		AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_04");	//�� ������� ���������, ��� ���������� ���������, ��� ������� ����!
	};
	MIS_RUNE = LOG_SUCCESS;
	b_giveplayerxp(XP_RUNE);
};


instance DIA_ULTHAR_KAP3_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap3_exit_condition;
	information = dia_ulthar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_PERMABKAP3(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 99;
	condition = dia_ulthar_permabkap3_condition;
	information = dia_ulthar_permabkap3_info;
	permanent = TRUE;
	description = "���� �������?";
};


func int dia_ulthar_permabkap3_condition()
{
	if((KAPITEL >= 3) || Npc_KnowsInfo(other,dia_ulthar_success))
	{
		return TRUE;
	};
};

func void dia_ulthar_permabkap3_info()
{
	AI_Output(other,self,"DIA_Ulthar_PermAbKap3_15_00");	//���� �������?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_01");	//���� ���. ��� � ��������� ������ ��������. ���� ��� ������ ����� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_02");	//���. ������ ������, ���� �� �� ��� �� ����, ����.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SCHREINEVERGIFTET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinevergiftet_condition;
	information = dia_ulthar_schreinevergiftet_info;
	important = TRUE;
};


func int dia_ulthar_schreinevergiftet_condition()
{
	if(PEDRO_TRAITOR == TRUE)
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinevergiftet_info()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_00");	//��� ����. ��������� ����������� ������, ����������� ������, ���� ���������� ������. ��� �������� ���� ���������� ��������.
		AI_Output(other,self,"DIA_Ulthar_SCHREINEVERGIFTET_15_01");	//�������, � ��� ������?
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_02");	//�� ������ �������� ��� ������, ����� �������� �� �����������.
		CreateInvItems(self,itmi_ultharsholywater_mis,1);
		b_giveinvitems(self,other,itmi_ultharsholywater_mis,1);
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_03");	//������ ��� ������ ���� � ������ �� ��������� ������.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_04");	//�� ������� ������� �������� � ������ �������� ��� ����� ����.
		if(Npc_HasItems(other,itwr_map_shrine_mis) == FALSE)
		{
			if(Npc_HasItems(gorax,itwr_map_shrine_mis) && (Npc_IsDead(gorax) == FALSE))
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_05");	//������ ����� ������� ���� �����, �� ������� �������� ���� ������.
			}
			else
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_06");	//��� �����. �� ��� �������� ������, ����������� ����.
				CreateInvItems(self,itwr_map_shrine_mis,1);
				b_giveinvitems(self,other,itwr_map_shrine_mis,1);
			};
		};
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_07");	//������ ��� � �������� ���� ���������.
		MIS_ULTHAR_HEILESCHREINE_PAL = LOG_RUNNING;
		Log_CreateTopic(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_RUNNING);
		b_logentry(TOPIC_ULTHAR_HEILESCHREINE_PAL,"������ ��� ��� ������� �������� ��� ������ ������ ���� ��� ������, ������������ ������.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_08");	//��� ����. ������� �������� �� ����������� �������. �� �������, ��� ��������� �� ��� ���� ����������.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_09");	//����� �� �����, ��� ������ ��� ���������.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_10");	//���� �� ������ ��������� ��� ��������. � ��� ����������� ��������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ULTHAR_SCHREINEGEHEILT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinegeheilt_condition;
	information = dia_ulthar_schreinegeheilt_info;
	description = "� ������� ��� ������.";
};


func int dia_ulthar_schreinegeheilt_condition()
{
	if(MIS_ULTHAR_HEILESCHREINE_PAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinegeheilt_info()
{
	AI_Output(other,self,"DIA_Ulthar_SchreineGeheilt_15_00");	//� ������� ��� ������.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_01");	//�����������, ��� ���. � ������� �����. �� �� ������� ���� �������� ������.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_02");	//������ ���� ������ ����, �� ����� ����������� ���� � ����� ��������� � ������.
	CreateInvItems(self,itam_dex_strg_01,1);
	b_giveinvitems(self,other,itam_dex_strg_01,1);
	b_giveplayerxp(XP_ULTHAR_SCHREINEGEREINIGT);
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP4_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap4_exit_condition;
	information = dia_ulthar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SCHREINEGEHEILTNOPAL(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinegeheiltnopal_condition;
	information = dia_ulthar_schreinegeheiltnopal_info;
	important = TRUE;
};


func int dia_ulthar_schreinegeheiltnopal_condition()
{
	if(((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinegeheiltnopal_info()
{
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_00");	//������� �������. ����������� ������ �������. ���� ������ ������� ��������� ����� ��� ��������.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_01");	//�� ����� ������ ��������� ���� ������ ��� ����� ���� �������� ��� �����������.
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP5_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap5_exit_condition;
	information = dia_ulthar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP6_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap6_exit_condition;
	information = dia_ulthar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_PICKPOCKET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 900;
	condition = dia_ulthar_pickpocket_condition;
	information = dia_ulthar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_ulthar_pickpocket_condition()
{
	return c_beklauen(74,320);
};

func void dia_ulthar_pickpocket_info()
{
	Info_ClearChoices(dia_ulthar_pickpocket);
	Info_AddChoice(dia_ulthar_pickpocket,DIALOG_BACK,dia_ulthar_pickpocket_back);
	Info_AddChoice(dia_ulthar_pickpocket,DIALOG_PICKPOCKET,dia_ulthar_pickpocket_doit);
};

func void dia_ulthar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ulthar_pickpocket);
};

func void dia_ulthar_pickpocket_back()
{
	Info_ClearChoices(dia_ulthar_pickpocket);
};

