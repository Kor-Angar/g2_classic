
instance DIA_PARLAN_KAP1_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap1_exit_condition;
	information = dia_parlan_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_parlan_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


var int parlan_hammer;

func void b_parlan_hammer()
{
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_00");	//(������) ������� �������, ��� ���, ��� ���.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_01");	//����� �����, ��� ������ �������� '�����' �� ������ ���������.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_02");	//� �� ���� ������ ���� ������� �� ���� - � ���, ��� �� �������� �� ���� �������� �����.
	PARLAN_HAMMER = TRUE;
};


var int parlan_lastpetzcounter;
var int parlan_lastpetzcrime;

instance DIA_PARLAN_PMSCHULDEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_pmschulden_condition;
	information = dia_parlan_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (PARLAN_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= PARLAN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_parlan_pmschulden_info()
{
	var int diff;
	if((PARLAN_HAMMER == FALSE) && (HAMMER_TAKEN == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(garwig) == FALSE))
	{
		b_parlan_hammer();
	};
	AI_Output(self,other,"DIA_Parlan_PMSchulden_05_00");	//�� ������� ������ ����� ������.
	if(b_gettotalpetzcounter(self) > PARLAN_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_01");	//� ���� �� ��� ��� �������, �� ���� ����������� ���� ����.
		if(PARLAN_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_02");	//���� ���� ����� ���� ������� ������ ����������� ������������� ������� ����� ���������.
			AI_Output(other,self,"DIA_Parlan_PMAdd_15_00");	//�������?
			diff = b_gettotalpetzcounter(self) - PARLAN_LASTPETZCOUNTER;
			if(diff > 0)
			{
				PARLAN_SCHULDEN = PARLAN_SCHULDEN + (diff * 50);
			};
			if(PARLAN_SCHULDEN > 1000)
			{
				PARLAN_SCHULDEN = 1000;
			};
			b_say_gold(self,other,PARLAN_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_03");	//�� ���� �� ���� ����������? ������ ������, ����� �� ������� �������� ����� ������!
		};
	}
	else if(b_getgreatestpetzcrime(self) < PARLAN_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_04");	//���� �������� ����������.
		if(PARLAN_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_05");	//������ ��� ���������� ��������, ������������ �����!
		};
		if((PARLAN_LASTPETZCRIME == CRIME_THEFT) || ((PARLAN_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_06");	//����� �� ����� �������������������, ��� �� �������!
		};
		if((PARLAN_LASTPETZCRIME == CRIME_ATTACK) || ((PARLAN_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_07");	//����� ������ �� ����� �������������������, ��� �� �������� ������� � �����!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_08");	//��� ��������� ������ ���� �� ������� �������������!
		};
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_09");	//��������, ���� ������� �������� ����, �� ����� ��� �����!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_10");	//���� ����� ������.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_11");	//� ����������, ����� �� ������ �� ������������ � ����� ���������!
			PARLAN_SCHULDEN = 0;
			PARLAN_LASTPETZCOUNTER = 0;
			PARLAN_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_12");	//�� ������ ��������� �����. ������ ���� ������!
			b_say_gold(self,other,PARLAN_SCHULDEN);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_13");	//���������� �� ����� ����!
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_parlan_pmschulden);
		Info_ClearChoices(dia_parlan_petzmaster);
		Info_AddChoice(dia_parlan_pmschulden,"� ���� ������������ ������!",dia_parlan_petzmaster_paylater);
		Info_AddChoice(dia_parlan_pmschulden,"������� ��� �����?",dia_parlan_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
		{
			Info_AddChoice(dia_parlan_pmschulden,"� ���� ��������� �����!",dia_parlan_petzmaster_paynow);
		};
	};
};

func void dia_parlan_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Parlan_PMSchulden_HowMuchAgain_15_00");	//������� ��� �����?
	b_say_gold(self,other,PARLAN_SCHULDEN);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	Info_AddChoice(dia_parlan_pmschulden,"� ���� ������������ ������!",dia_parlan_petzmaster_paylater);
	Info_AddChoice(dia_parlan_pmschulden,"������� ��� �����?",dia_parlan_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
	{
		Info_AddChoice(dia_parlan_pmschulden,"� ���� ��������� �����!",dia_parlan_petzmaster_paynow);
	};
};


instance DIA_PARLAN_PETZMASTER(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_petzmaster_condition;
	information = dia_parlan_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > PARLAN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_parlan_petzmaster_info()
{
	if((PARLAN_HAMMER == FALSE) && (HAMMER_TAKEN == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(garwig) == FALSE))
	{
		b_parlan_hammer();
	};
	PARLAN_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_00");	//�� ��� �� ������ ���� ����������, � �� ��� ������� �� ���� ���� ����!
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_01");	//�� ����������� � ������ �� ���� ������������! ��������!
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		PARLAN_SCHULDEN = PARLAN_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_02");	//� �� ������� �� ���� ���� ����� ����!
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_03");	//���� �� ���� ������ ���, �� ��� �� ������� �� �����, �� ������!
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_04");	//�� ���� �� ��������� ����� �� ���� ������������, �������, �� ������� ���� ���� �����.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_05");	//��������� - ��������� ������� ���������!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_06");	//����� ����, �� ������� � ������ ������.
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_07");	//��� ����������� ������ ���� ��������. ����� ����� ������.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_08");	//�� ������ ��������� ����� ���������.
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_09");	//�� �� ������ ���� � ���������. ����� ��������� �������� ���� �������.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_10");	//� ����� �� ���� ���� ����?
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_11");	//�� ����� ����� � ������������ � ��������. ��� �������� � ����.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_12");	//�� ���� ������������, �� ������ ������� ������������� ���������.
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_13");	//�� ���� ���� ����. �� ������ ��������� ����������� �� ���!
		PARLAN_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_15_14");	//�������?
	if(PARLAN_SCHULDEN > 1000)
	{
		PARLAN_SCHULDEN = 1000;
	};
	b_say_gold(self,other,PARLAN_SCHULDEN);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	Info_AddChoice(dia_parlan_petzmaster,"� ���� ������������ ������!",dia_parlan_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
	{
		Info_AddChoice(dia_parlan_petzmaster,"� ���� ��������� �����!",dia_parlan_petzmaster_paynow);
	};
};

func void dia_parlan_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayNow_15_00");	//� ���� ��������� �����!
	b_giveinvitems(other,self,itmi_gold,PARLAN_SCHULDEN);
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayNow_05_01");	//� �������� ���� �������������. ���� ����������� ������. � �������, ����� ���� ���� �������� �� ��������� ������ �������� ������.
	b_grantabsolution(LOC_MONASTERY);
	PARLAN_SCHULDEN = 0;
	PARLAN_LASTPETZCOUNTER = 0;
	PARLAN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
};

func void dia_parlan_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayLater_15_00");	//� ���� ������������ ������!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_01");	//���� ������ �������� �� ���� �� ����, ��� �������.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_02");	//��������, ��� ���� ����-������ ������. �� �������� �������, � ���� �� ����� ����� �������.
	PARLAN_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	PARLAN_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_WELCOME(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_welcome_condition;
	information = dia_parlan_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_welcome_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_parlan_welcome_info()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_00");	//����� ����������, ����� ���������. � ������.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_01");	//� �...
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_02");	//(���������) ...���������. �� �����, ��� �� ��� ������. ������ �� ����� ������. ������ ��� ����� ��������.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_03");	//� � ��������� � �������� ����, ��� ���� ���������� ����������� ����� ������.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_04");	//�� ����������� ����� ����� ��������, ��������� ���� ����� �������� ���, � ����� ��� ��� �����.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_05");	//� ��� ������?
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//������ �����, �� ������ ��������� ���� ����������� ����������. �� ������ �������� � ������� ��������.
	b_grantabsolution(LOC_ALL);
	Snd_Play("LEVELUP");
	Log_CreateTopic(TOPIC_GEMEINSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GEMEINSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_GEMEINSCHAFT,"� ����������� ���������� ������ ��������� ������ �� ����� ������.");
	if(LIESEL_GIVEAWAY == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//�� ������� ������ ���� ���� � �������, �� ����������� � ���.
	};
	if(DIA_GORAX_GOLD_PERM == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//�� ������ ������ ���� ������ �������, ������ ������������. �� ������� ��� � ����������.
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//����� � ���� ����� ���������, �� ��������� � ����� ������ �����, � ���������.
	};
};


instance DIA_PARLAN_AUGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_auge_condition;
	information = dia_parlan_auge_info;
	permanent = FALSE;
	description = "� ��� ���� ������.";
};


func int dia_parlan_auge_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_parlan_auge_info()
{
	AI_Output(other,self,"DIA_Parlan_Auge_15_00");	//� ��� ���� ������.
	AI_Output(self,other,"DIA_Parlan_Auge_05_01");	//� �� ����, ��� ������ ���� � ���, �� � ����� ������������� ��������� ����� �� ����� �����������.
	AI_Output(other,self,"DIA_Parlan_Auge_15_02");	//��� �������� ���� ������?
	AI_Output(self,other,"DIA_Parlan_Auge_05_03");	//����� �������� ����� ��� �����. �������� ����� ��� - � ���� ��� �� �������.
};


instance DIA_PARLAN_AMULETT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_amulett_condition;
	information = dia_parlan_amulett_info;
	permanent = FALSE;
	description = "�������� ��� � ����� ������.";
};


func int dia_parlan_amulett_condition()
{
	if((KAPITEL <= 2) && Npc_KnowsInfo(other,dia_parlan_auge))
	{
		return TRUE;
	};
};

func void dia_parlan_amulett_info()
{
	AI_Output(other,self,"DIA_Parlan_Amulett_15_00");	//�������� ��� � ����� ������.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_01");	//������. ���� ������ �������� ������� ������������ ���� ������. ������ ���� ��������� ����� ������ ����� ������ ���� ������.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_02");	//�� ��� ������, ����� �������� ��� �� ��� ���, ����� ������ �����.
};


instance DIA_PARLAN_HAGEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_hagen_condition;
	information = dia_parlan_hagen_info;
	permanent = FALSE;
	description = "� ������ ���������� � ����������� ����������!";
};


func int dia_parlan_hagen_condition()
{
	if((KAPITEL <= 2) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_hagen_info()
{
	AI_Output(other,self,"DIA_Parlan_Hagen_15_00");	//� ������ ���������� � ����������� ����������!
	AI_Output(self,other,"DIA_Parlan_Hagen_05_01");	//���� ����� �� ��������� ����������� - ������ ����� ��������� ������ ���.
};


instance DIA_PARLAN_WORK(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_work_condition;
	information = dia_parlan_work_info;
	permanent = TRUE;
	description = "��� � ���� ������� ������?";
};


var int dia_parlan_work_perm;

func int dia_parlan_work_condition()
{
	if((KAPITEL == 1) && (Npc_KnowsInfo(other,dia_parlan_knowsjudge) == FALSE) && Npc_KnowsInfo(other,dia_parlan_welcome) && (DIA_PARLAN_WORK_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_work_info()
{
	AI_Output(other,self,"DIA_Parlan_WORK_15_00");	//��� � ���� ������� ������?
	if((LIESEL_GIVEAWAY == FALSE) || (DIA_GORAX_GOLD_PERM == FALSE))
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//������ �����, �� ������ ��������� ���� ����������� ����������. �� ������ �������� � ������� ��������.
		if(LIESEL_GIVEAWAY == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//�� ������� ������ ���� ���� � �������, �� ����������� � ���.
		};
		if(DIA_GORAX_GOLD_PERM == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//�� ������ ������ ���� ������ �������, ������ ������������. �� ������� ��� � ����������.
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//����� � ���� ����� ���������, �� ��������� � ����� ������ �����, � ���������.
		};
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(22,0,7,30))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_01");	//������ ����� ����. ������ ����������� ���������� ���� ����� � ������������ �������.
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_02");	//�� ���� ������ �����. ����������� �� ���, ����� ������ ����� ������.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_WORK_05_03");	//�������� � ������� ������. ��� ����� ���� ���������.
		AI_Output(self,other,"DIA_Parlan_WORK_05_04");	//� ���� ��������� �� ����� �������, � ���� �� ������ ������ ����������� � ���, �� �������� ���������� ����� � ����������, ����� ������� ������ ������.
		DIA_PARLAN_WORK_PERM = TRUE;
		MIS_KLOSTERARBEIT = LOG_RUNNING;
		b_logentry(TOPIC_GEMEINSCHAFT,"���� � ������� ��� ������� �����, ��� ����� �������� ����� �������� ����������.");
	};
};


instance DIA_PARLAN_STAND(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_stand_condition;
	information = dia_parlan_stand_info;
	permanent = TRUE;
	description = "���� � ����� � ����������?";
};


func int dia_parlan_stand_condition()
{
	if((MIS_KLOSTERARBEIT == LOG_RUNNING) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_stand_info()
{
	KLOSTER_PUNKTE = 0;
	AI_Output(other,self,"DIA_Parlan_Stand_15_00");	//���� � ����� � ����������?
	if(MIS_NEORASPFLANZEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_01");	//�� ������ �������� ������� ����� �������.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 2;
	};
	if(MIS_NEORASREZEPT == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_02");	//�� ����� ������ ����� �������.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 2;
	};
	if(MIS_ISGAROTHWOLF == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_03");	//�� ���� ������� �����, ������������������ �������.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	};
	if(MIS_PARLANFEGEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_04");	//�� ���� ����� ������� ����������� � �������� �����.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 3;
	};
	if(MIS_GORAXESSEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_05");	//�� ������ ������ ��� �����������, ��� � ������ ���� ���� ������.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	}
	else if(MIS_GORAXESSEN == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_06");	//������ �������������� �����, ��� ��� �������� ����������� ���.
	};
	if(MIS_GORAXWEIN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_07");	//�� ������ ����, ��� ���� � ����� ������.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	}
	else if(MIS_GORAXWEIN == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_08");	//��� ������ �� ����� �������� � ����, ��� �����...
	};
	if(KLOSTER_PUNKTE >= 8)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_09");	//��, �� ������ ���������. ������ ������ ����� ������ ��������� ������ ������. �������� � �������� �������� � ����������.
		AI_Output(self,other,"DIA_Parlan_Stand_05_10");	//� ����� ���� ���� ����.
		PARLAN_ERLAUBNIS = TRUE;
		MIS_KLOSTERARBEIT = LOG_SUCCESS;
		Wld_AssignRoomToGuild("Kloster02",GIL_PUBLIC);
		b_giveinvitems(self,other,itke_klosterbibliothek,1);
		if(MIS_NEORASPFLANZEN == LOG_RUNNING)
		{
			MIS_NEORASPFLANZEN = LOG_OBSOLETE;
		};
		if(MIS_NEORASREZEPT == LOG_RUNNING)
		{
			MIS_NEORASREZEPT = LOG_OBSOLETE;
		};
		if(MIS_ISGAROTHWOLF == LOG_RUNNING)
		{
			MIS_ISGAROTHWOLF = LOG_OBSOLETE;
		};
		if(MIS_PARLANFEGEN == LOG_RUNNING)
		{
			MIS_PARLANFEGEN = LOG_OBSOLETE;
		};
		if(MIS_GORAXESSEN == LOG_RUNNING)
		{
			MIS_GORAXESSEN = LOG_OBSOLETE;
		};
		if(MIS_GORAXWEIN == LOG_RUNNING)
		{
			MIS_GORAXWEIN = LOG_OBSOLETE;
		};
		if(MIS_MARDUKBETEN == LOG_RUNNING)
		{
			MIS_MARDUKBETEN = LOG_OBSOLETE;
		};
		b_checklog();
	}
	else if(KLOSTER_PUNKTE >= 1)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_11");	//�� �������, �������, �� ���� �� ������ ���������� ������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_12");	//������� ������� ���� ��������� �� ����� ������. � ����� �� ��������� ���� ������, �� �������� � ����� ���������.
	};
};


instance DIA_PARLAN_AUFGABE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 10;
	condition = dia_parlan_aufgabe_condition;
	information = dia_parlan_aufgabe_info;
	permanent = FALSE;
	description = "� ���� ���� �����-������ ������� ��� ����?";
};


func int dia_parlan_aufgabe_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parlan_aufgabe_info()
{
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_00");	//� ���� ���� ��������� ��� ����?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_01");	//���... ��, ��, ������������� ������ ������� ���-��� ��� ������.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_02");	//������ ����������� �� �������� ������� ������. ���������� �� ����.
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_03");	//�� ��� ������ ����� ��������...
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_04");	//����� ���� ����� �� ������ ����� �������, ����� ���?
	MIS_PARLANFEGEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PARLANFEGEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PARLANFEGEN,LOG_RUNNING);
	b_logentry(TOPIC_PARLANFEGEN,"������ ������ �����, ����� � ������ ����� ������� �����������. ��� ������ ����� ��������.");
};


instance DIA_PARLAN_FEGEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_fegen_condition;
	information = dia_parlan_fegen_info;
	permanent = TRUE;
	description = "������ ����� �����������...";
};


var int dia_parlan_fegen_permanent;

func int dia_parlan_fegen_condition()
{
	if((MIS_PARLANFEGEN == LOG_RUNNING) && (DIA_PARLAN_FEGEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_fegen_info()
{
	AI_Output(other,self,"DIA_Parlan_Fegen_15_00");	//������ ����� �����������...
	if(NOV_HELFER >= 4)
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_01");	//���� ������� ����� ������� ����������� ���� � ������. � �����, ������ ��� ����� ��������� � ����� ������.
		AI_Output(self,other,"DIA_Parlan_Fegen_05_02");	//�������, ���������. �� �������� ��� ���������.
		MIS_PARLANFEGEN = LOG_SUCCESS;
		b_giveplayerxp(XP_PARLANFEGEN);
		DIA_PARLAN_FEGEN_PERMANENT = TRUE;
		b_startotherroutine(feger1,"START");
		b_startotherroutine(feger2,"START");
		b_startotherroutine(feger3,"START");
		b_startotherroutine(babo,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_03");	//��������� - ��� ��������� ������. �� � ������� ������ �� ����������.
	};
};


instance DIA_PARLAN_LEARN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_learn_condition;
	information = dia_parlan_learn_info;
	permanent = FALSE;
	description = "��� ��� ������� ������ �����?";
};


func int dia_parlan_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_hagen) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_learn_info()
{
	AI_Output(other,self,"DIA_Parlan_LEARN_15_00");	//��� ��� ������� ������ �����?
	AI_Output(self,other,"DIA_Parlan_LEARN_05_01");	//�� ����� �� ��� ����, ����� �������� ��� �����. �� �����, ����� ������� ������.
	AI_Output(self,other,"DIA_Parlan_LEARN_05_02");	//�� � ���� �������� ����, ��� �������� ���� ���������� �����������.
	b_logentry(TOPIC_KLOSTERTEACHER,"������ ������ ����� ������ ��� �������� ��� ���������� �������.");
};


instance DIA_PARLAN_KNOWSJUDGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_knowsjudge_condition;
	information = dia_parlan_knowsjudge_info;
	permanent = FALSE;
	description = "� ���� ������ ��������� �����.";
};


func int dia_parlan_knowsjudge_condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(hero,dia_pyrokar_fire) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_knowsjudge_info()
{
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_00");	//� ���� ������ ��������� �����.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_01");	//���?.. ��... (�������������) �� ��� ������������� ��������?
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_02");	//� ���������.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_03");	//�� ��������� ���������. ������, ���� �� �����������, �������� � �������� ���������.
	b_logentry(TOPIC_FIRECONTEST,"���� � ���� ����������� ������ ��������� �����, � ������ ���������� � �������� ���������.");
};


instance DIA_PARLAN_TEACH_MANA(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 10;
	condition = dia_parlan_teach_mana_condition;
	information = dia_parlan_teach_mana_info;
	permanent = TRUE;
	description = "� ���� �������� ��� ���������� �����������.";
};


func int dia_parlan_teach_mana_condition()
{
	if(((other.guild == GIL_KDF) || (other.guild == GIL_PAL) || ((other.guild == GIL_NOV) && Npc_KnowsInfo(hero,dia_parlan_learn))) && (PARLAN_SENDS == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_teach_mana_info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_MANA_15_00");	//� ���� �������� ��� ���������� �����������
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};

func void dia_parlan_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 100)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_00");	//���� ���������� ������� �������. � �� ���� ������ ���� �������� �� ��� ������.
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_01");	//���� �� ������ ��������� ��������, �������� � ���������.
		PARLAN_SENDS = TRUE;
	};
	Info_ClearChoices(dia_parlan_teach_mana);
};

func void dia_parlan_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,100);
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};

func void dia_parlan_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,100);
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};


instance DIA_PARLAN_MAGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_mage_condition;
	information = dia_parlan_mage_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_mage_condition()
{
	if((other.guild == GIL_KDF) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_parlan_mage_info()
{
	AI_Output(self,other,"DIA_Parlan_MAGE_05_00");	//�� ������ ������, ����. ����� ���������� � ���� ����.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_01");	//� ����� ���� ������� ����� �����, ����� � ���� ����� ���������� �����.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_02");	//������ ���� ������ ������ � �������� ������� ����, ������� ������ ��������� � ����� �����.
	b_giveinvitems(self,other,itmi_runeblank,1);
};


instance DIA_PARLAN_CIRCLE1(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle1_condition;
	information = dia_parlan_circle1_info;
	permanent = TRUE;
	description = "����� ���� ������� ����� �����.";
};


func int dia_parlan_circle1_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void dia_parlan_circle1_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE1_15_00");	//����� ���� ������� ����� �����.
	if(b_teachmagiccircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_01");	//������ ���� ����� �������� ���� ������������ ����, ��������� �����.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_02");	//������ �� ������� ������ ������� ���������� ��� �������� ����������� ���.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_03");	//������ �� ��� ���������������� �� ����� ������� �����. ��� ��� ������ �������, � ����� ������� ������ ������������������ ��.
	};
};


instance DIA_PARLAN_CIRCLE2(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle2_condition;
	information = dia_parlan_circle2_info;
	permanent = TRUE;
	description = "����� ���� ������� ����� �����.";
};


func int dia_parlan_circle2_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void dia_parlan_circle2_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE2_15_00");	//����� ���� ������� ����� �����.
	if(KAPITEL >= 2)
	{
		if(b_teachmagiccircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_01");	//����� �� ������ ���� � ������� ������������ ����� ������� �����.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_02");	//�� ����� �����, ��� �� ���� ����� ������� ���� ���������������. �� ������ ���� � ��������� - ����� �������.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_03");	//�� ������� ���� ����������� - �� ���� ��������� ���� ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_04");	//����� ��� �� ������.
	};
};


instance DIA_PARLAN_CIRCLE3(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle3_condition;
	information = dia_parlan_circle3_info;
	permanent = TRUE;
	description = "����� ���� �������� ����� �����.";
};


func int dia_parlan_circle3_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2))
	{
		return TRUE;
	};
};

func void dia_parlan_circle3_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE3_15_00");	//����� ���� �������� ����� �����.
	if(KAPITEL >= 3)
	{
		if(b_teachmagiccircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_01");	//��, ����� ������. ����� � ������ ���� �����. ���� ���� ����� ����������.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_02");	//��� ���� ����������� - ��� ����� ��������� ����� � ����, � ���������� ��� ����� ������ � ������� ���� ������.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_03");	//� ������ ���� ���� ������, �������� ������ ���. ����� ������ ���� � ������ �����.
			b_logentry(TOPIC_KLOSTERTEACHER,"���� ������ ������ ���� ������ ���� ������. ���� ������ ������� ��� ������� ��������� �����.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_04");	//��� �������� �������� ����� ��� �� ������ �����.
	};
};


instance DIA_PARLAN_TEACH(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_teach_condition;
	information = dia_parlan_teach_info;
	permanent = TRUE;
	description = "����� ���� (�������� ���).";
};


func int dia_parlan_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_parlan_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//����� ����!
	Info_ClearChoices(dia_parlan_teach);
	Info_AddChoice(dia_parlan_teach,DIALOG_BACK,dia_parlan_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_LIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_light_heal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LIGHT] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_LIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_light);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_windfist);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_SLEEP] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_SLEEP,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_sleep);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_MEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_mediumheal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_FEAR] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_FEAR,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_fear);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_destroyundead);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_parlan_teach_fullheal);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_05_01");	//���� � ������ �� ���� ������� ����.
	};
};

func void dia_parlan_teach_back()
{
	Info_ClearChoices(dia_parlan_teach);
};

func void dia_parlan_teach_light_heal()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTHEAL);
};

func void dia_parlan_teach_light()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHT);
};

func void dia_parlan_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_parlan_teach_sleep()
{
	b_teachplayertalentrunes(self,other,SPL_SLEEP);
};

func void dia_parlan_teach_mediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_MEDIUMHEAL);
};

func void dia_parlan_teach_fear()
{
	b_teachplayertalentrunes(self,other,SPL_FEAR);
};

func void dia_parlan_teach_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void dia_parlan_teach_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};


instance DIA_PARLAN_KAP2_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap2_exit_condition;
	information = dia_parlan_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_parlan_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_parlan_exit()
{
	AI_Output(self,other,"DIA_Parlan_EXIT_05_00");	//�� ������� ���� �����.
};


instance DIA_PARLAN_KAP3_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap3_exit_condition;
	information = dia_parlan_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_parlan_kap3_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_IAMPARLAN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_iamparlan_condition;
	information = dia_parlan_iamparlan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_iamparlan_condition()
{
	if((KAPITEL >= 3) && Npc_IsInState(self,zs_talk) && ((other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_parlan_iamparlan_info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_00");	//� ����, �� ����� ��������� �� ����� �������. � ���.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_01");	//��� ����� ������ ������� ����. �� ������ ���������� � ��������, �� �������� �� ���, ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_02");	//� �� ����, ������ ���� ������� � ���������. � ������, � � ������� �� ����� �����������.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_03");	//� �� ����, ����� �� ������� �� �� ������ ������ ��������� ���������. �������, ��� ����?
		PARLAN_DONTTALKTONOVICE = LOG_RUNNING;
		Info_ClearChoices(dia_parlan_iamparlan);
		Info_AddChoice(dia_parlan_iamparlan,"� ���� ������ ��, ��� ����� ������.",dia_parlan_iamparlan_mychoice);
		Info_AddChoice(dia_parlan_iamparlan,"�������.",dia_parlan_iamparlan_ok);
	};
	Wld_InsertItem(itke_klosterbibliothek,"NW_MONASTERY_CORRIDOR_02");
};

func void dia_parlan_iamparlan_mychoice()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_MyChoice_15_00");	//� ���� ������ ��, ��� ����� ������.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_01");	//��������, ����, ��� ���� ������ �����, ���� �������, �� ������ ���� �����.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_02");	//���� �� ������ ��������� ��������, �� �������� �� ���. ��� ��� ����� ������� �������� �� �����������.
	Info_ClearChoices(dia_parlan_iamparlan);
};

func void dia_parlan_iamparlan_ok()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_OK_15_00");	//�������.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_OK_05_01");	//����� ������� �� ���.
	Info_ClearChoices(dia_parlan_iamparlan);
};


instance DIA_PARLAN_BIBLIOTHEK(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 40;
	condition = dia_parlan_bibliothek_condition;
	information = dia_parlan_bibliothek_info;
	permanent = FALSE;
	description = "� ���� ���� ���-������ ��� ����?";
};


func int dia_parlan_bibliothek_condition()
{
	if((other.guild != GIL_KDF) && (KAPITEL >= 3) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_parlan_bibliothek_info()
{
	AI_Output(other,self,"DIA_Parlan_Bibliothek_15_00");	//� ���� ���� ���-������ ��� ����?
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_01");	//��. ��� �������� ����������, ���� �������� ���� �� ���. ��� �� ������� ������� ������ � �������.
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_02");	//���� ������, �� ������ ���������� � ����.
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_DontDisturb_05_03");	//�� ������ � ����� �����������!
	};
	b_giveinvitems(self,other,itke_klosterbibliothek,1);
};


instance DIA_PARLAN_DONTDISTURB(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_dontdisturb_condition;
	information = dia_parlan_dontdisturb_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_dontdisturb_condition()
{
	if((PARLAN_DONTTALKTONOVICE == LOG_SUCCESS) && (b_getgreatestpetzcrime(self) == CRIME_NONE) && ((other.guild != GIL_PAL) || (other.guild != GIL_NOV) || (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_parlan_dontdisturb_info()
{
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_00");	//(���������) � �� ����� ���������. ������ ����������� � �����.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_01");	//��� ������ ������� ���� ��� ���������� ������ � �������� ���� � ����� � ���������.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_02");	//(�����) � �� �������� ������������� � �� ������!
	PARLAN_DONTTALKTONOVICE = LOG_RUNNING;
};


instance DIA_PARLAN_KAP3U4U5_PERM(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_kap3u4u5_perm_condition;
	information = dia_parlan_kap3u4u5_perm_info;
	permanent = TRUE;
	description = "��� ��� �����...";
};


func int dia_parlan_kap3u4u5_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_parlan_kap3u4u5_perm_info()
{
	AI_Output(other,self,"DIA_Parlan_Kap3_PERM_15_00");	//��� ��� �����...
	Info_ClearChoices(dia_parlan_kap3u4u5_perm);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,DIALOG_BACK,dia_parlan_kap3u4u5_perm_back);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"...�������?",dia_parlan_kap3u4u5_perm_church);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"...����������?",dia_parlan_kap3u4u5_perm_library);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"...�������?",dia_parlan_kap3u4u5_perm_chapel);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"...������?",dia_parlan_kap3u4u5_perm_cellar);
};

func void dia_parlan_kap3u4u5_perm_back()
{
	Info_ClearChoices(dia_parlan_kap3u4u5_perm);
};

func void dia_parlan_kap3u4u5_perm_church()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00");	//...�������?
	AI_Output(self,other,"DIA_Parlan_Add_05_00");	//�, �������! ������� ����� ������� ����?!
	AI_Output(self,other,"DIA_Parlan_Add_05_01");	//(�������) ��� �������? ��, ����, � ���� �� ��� ����������?!
};

func void dia_parlan_kap3u4u5_perm_library()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00");	//...����������?
	AI_Output(self,other,"DIA_Parlan_Add_05_02");	//���������� ��������� � ����� ��������� �����, ����� �������� ������.
};

func void dia_parlan_kap3u4u5_perm_chapel()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00");	//...�������?
	AI_Output(self,other,"DIA_Parlan_Add_05_03");	//������� ��������� � ������� ���������� ����� ���������. ��� �������� ������� ������.
};

func void dia_parlan_kap3u4u5_perm_cellar()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00");	//...������?
	AI_Output(self,other,"DIA_Parlan_Add_05_04");	//���� � ������ ��������� ���������� ��������� ������.
};


instance DIA_PARLAN_KAP4_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap4_exit_condition;
	information = dia_parlan_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_parlan_kap4_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_KAP5_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap5_exit_condition;
	information = dia_parlan_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_parlan_kap5_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};

