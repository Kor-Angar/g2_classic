
instance DIA_ONAR_EXIT(C_INFO)
{
	npc = bau_900_onar;
	nr = 999;
	condition = dia_onar_exit_condition;
	information = dia_onar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_onar_exit_condition()
{
	return TRUE;
};

func void dia_onar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ONAR_HALLO(C_INFO)
{
	npc = bau_900_onar;
	nr = 1;
	condition = dia_onar_hallo_condition;
	information = dia_onar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_onar_hallo_condition()
{
	if((self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_onar_hallo_info()
{
	AI_Output(self,other,"DIA_Onar_Hallo_14_00");	//��� ������ ���� ����?!
	AI_Output(self,other,"DIA_Onar_Hallo_14_01");	//��� �� ������� �� ���� �����?!
};


instance DIA_ONAR_PERM(C_INFO)
{
	npc = bau_900_onar;
	nr = 1;
	condition = dia_onar_perm_condition;
	information = dia_onar_perm_info;
	permanent = TRUE;
	description = "����� ��� � �������, �� ����� �����?";
};


func int dia_onar_perm_condition()
{
	return TRUE;
};

func void dia_onar_perm_info()
{
	AI_Output(other,self,"DIA_Onar_PERM_15_00");	//����� ��� � �������, �� ����� �����?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_01");	//� �� �������, ����� ���� �� ����� ����� ���� ����. �� �� ��������� �����!
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_02");	//����� �������, ��� ��! � ����� ������, ������ �� ��� � ���� � �����!
		AI_Output(self,other,"DIA_Onar_PERM_14_03");	//���� ����� �����, ���������� � ��������, ����� ����, � ���� ���� ������ ��� ����.
	};
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_04");	//��, �������. �� ������ ����, ��������� �� ����� ��������.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_05");	//���, ���������� �������� �� ���������, ���� ���� ������!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_06");	//���� �������������� �� ���������������� �� ������ ������.
	};
};


instance DIA_ONAR_WORK(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_work_condition;
	information = dia_onar_work_info;
	permanent = FALSE;
	description = "� ���� �������� �� ����!";
};


func int dia_onar_work_condition()
{
	if(LEE_SENDTOONAR == FALSE)
	{
		return TRUE;
	};
};

func void dia_onar_work_info()
{
	AI_Output(other,self,"DIA_Onar_Work_15_00");	//� ���� �������� �� ����!
	AI_Output(self,other,"DIA_Onar_Work_14_01");	//��� ������ �� ����� �������.
	AI_Output(self,other,"DIA_Onar_Work_14_02");	//��� ���� ��������� �� ���� �����������.
	AI_Output(self,other,"DIA_Onar_Work_14_03");	//���� ������ ������ � ���� ����, ��������!
};


instance DIA_ONAR_WORKASSLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_workassld_condition;
	information = dia_onar_workassld_info;
	permanent = FALSE;
	description = "� ���� ���������� ����� � �������� ��������!";
};


func int dia_onar_workassld_condition()
{
	if((LEE_SENDTOONAR == FALSE) && (ONAR_WEGENSLDWERDEN == FALSE) && Npc_KnowsInfo(other,dia_onar_work))
	{
		return TRUE;
	};
};

func void dia_onar_workassld_info()
{
	AI_Output(other,self,"DIA_Onar_WorkAsSld_15_00");	//� ���� ���������� ����� � �������� ��������!
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_01");	//��? ��������? �� ����� ����! ���� �� �� ���� ��� ���������� ������� �������, �� ��������� ��������� �� ��� � ����.
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_02");	//� ������ �������� ������, � �������!
	ONAR_WEGENSLDWERDEN = TRUE;
};


instance DIA_ONAR_AUFSTAND(C_INFO)
{
	npc = bau_900_onar;
	nr = 3;
	condition = dia_onar_aufstand_condition;
	information = dia_onar_aufstand_info;
	permanent = FALSE;
	description = "�� ������������� ������, ��� � ������?";
};


func int dia_onar_aufstand_condition()
{
	return TRUE;
};

func void dia_onar_aufstand_info()
{
	AI_Output(other,self,"DIA_Onar_Aufstand_15_00");	//�� ������������� ������, ��� � ������?
	AI_Output(self,other,"DIA_Onar_Aufstand_14_01");	//� ������ �������� ��. � ����������� ��� ����� � ��� ����� �� ������ ����.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_02");	//� �� ����������� �� �� ������ ����.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_03");	//� �� ������� ����� ������� ������, ����������� ���� �������, �������� ���� ������ ��� ����, ����� ��������� ���� ����������� �����.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_04");	//����� � ������ ������ ��� ����� ��������. � � ���� �� ������? �� ����� �� ����� ���������.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_05");	//��� - � ����������� ��������� ���� ����� ��������������! ������, ��� � ������� ����� �������, ������ �� ������ ���� ����������� �����.
};


instance DIA_ONAR_WEGENPEPE(C_INFO)
{
	npc = bau_900_onar;
	nr = 4;
	condition = dia_onar_wegenpepe_condition;
	information = dia_onar_wegenpepe_info;
	permanent = FALSE;
	description = "������ ����������� �����, � ���� ����� �� ��������� ���� ������.";
};


func int dia_onar_wegenpepe_condition()
{
	if(MIS_PEPE_KILLWOLVES == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_onar_wegenpepe_info()
{
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_00");	//������ ����������� �����, � ���� ����� �� ��������� ���� ������.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_01");	//� ��� ��� �� ��������? ��� ����� �����?
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_02");	//���� �� ���������.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_03");	//����� ��� �� ����� ����? ���� �� ����������� � ���� �����, �� ����� �������� ����� ��.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_04");	//����� �� ���������� ���� �� ����� ��������?
	ONAR_WEGENPEPE = TRUE;
};


instance DIA_ONAR_WEGENSEKOB(C_INFO)
{
	npc = bau_900_onar;
	nr = 5;
	condition = dia_onar_wegensekob_condition;
	information = dia_onar_wegensekob_info;
	permanent = FALSE;
	description = "� ������ �� ������ ����� ������...";
};


func int dia_onar_wegensekob_condition()
{
	if(MIS_SEKOB_REDEMITONAR == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_onar_wegensekob_info()
{
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_00");	//� ������ �� ������ ����� ������...
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_01");	//���, ���� ������, ���� ����� �����? ������ ������ �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_02");	//������ ������� �� ������ � ��� ����?
		AI_Output(other,self,"DIA_Onar_WegenSekob_15_03");	//� ���� ����� ���������. ������� ����� - ��� ��� ���������.
		ONAR_WEGENSLDWERDEN = TRUE;
	};
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_04");	//�� � ������ ��� �����. � ���� ������� ������ �� �� ����.
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_05");	//�� ������, ��� ��� ��-�� ������� ������...
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_06");	//(�����) �� ���������� ������! �� ��� �������, �� ����� ������ � �����? �� �� ���-�� ������!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_07");	//�� �� ������, ������� ������ ���� � ���� ���? ������ ������! ���� ��!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_08");	//���, � ����� ������ ������ �� ���� ��� ������.
	ONAR_WEGENSEKOB = TRUE;
};


instance DIA_ONAR_LEESENTME(C_INFO)
{
	npc = bau_900_onar;
	nr = 6;
	condition = dia_onar_leesentme_condition;
	information = dia_onar_leesentme_info;
	permanent = FALSE;
	description = "���� ������ ��. � ���� �������� � �������� ��������!";
};


func int dia_onar_leesentme_condition()
{
	if((LEE_SENDTOONAR == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_onar_leesentme_info()
{
	AI_Output(other,self,"DIA_Onar_LeeSentMe_15_00");	//���� ������ ��. � ���� �������� � �������� ��������!
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_01");	//�� ��� ������� �� ����.
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_02");	//��� ����� ������ ������� � ���� ��������� � ���� �� ����� ������ ������.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//�� ��� �� ��������, ��� �� ����������, �, �������, ��� ���� ����.
	};
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_04");	//� ����� ������, �� �������� �� ����. ��� ��� ��������� � ����� ������������.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_05");	//�� �� ������ ���� �� ����! ������ �������� � �������� � �����, � ���� �� ����� ������� ���-������, �������?
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//� ��� �������� ����� ����������, �������� � ��.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//� ��� � ����� ����� �������� ������ ���� ���������.
	ONAR_APPROVED = TRUE;
	b_logentry(TOPIC_BECOMESLD,"���� ��� ��� ���� ���������. ������ ����� �� ������������ ����� ���������� � ���� ���������.");
};


var int onar_sold_day;
var int onar_sold_xp;

instance DIA_ONAR_HOWMUCH(C_INFO)
{
	npc = bau_900_onar;
	nr = 7;
	condition = dia_onar_howmuch_condition;
	information = dia_onar_howmuch_info;
	permanent = FALSE;
	description = "��� ��� ������ ����� ���������?";
};


func int dia_onar_howmuch_condition()
{
	if(ONAR_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_howmuch_info()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_15_00");	//��� ��� ������ ����� ���������?
	AI_Output(self,other,"DIA_Onar_HowMuch_14_01");	//���, ���������...
	SOLD = 50;
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_02");	//� �� ������ ������� ������ � ����.
	};
	if(ONAR_WEGENSEKOB == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_03");	//�� �� ����������� ������ ������������������. ��� �������� ����� ����� ���������� � ������.
		SOLD = SOLD - 10;
	};
	if((ABSOLUTIONLEVEL_FARM > 1) || ((b_getgreatestpetzcrime(self) > CRIME_NONE) && (ABSOLUTIONLEVEL_FARM > 0)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_04");	//�� ��� ������������ �������� �������� �����, �� �����.
		SOLD = SOLD - 10;
	};
	if((ONAR_WEGENPEPE == TRUE) && ((ONAR_WEGENSEKOB == TRUE) || (ONAR_WEGENSLDWERDEN == TRUE)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_05");	//� �� ��������� ��������� ���� ������ �������.
		SOLD = SOLD - 10;
	};
	AI_Output(self,other,"DIA_Onar_HowMuch_14_06");	//��� ��� ��������...
	b_say_gold(self,other,SOLD);
	ONAR_SOLD_DAY = Wld_GetDay();
	ONAR_SOLD_XP = other.exp;
	AI_Output(self,other,"DIA_Onar_HowMuch_14_07");	//��� �������?
	Info_ClearChoices(dia_onar_howmuch);
	Info_AddChoice(dia_onar_howmuch,"������!",dia_onar_howmuch_ok);
	Info_AddChoice(dia_onar_howmuch,"����� �� ���...",dia_onar_howmuch_more);
	Info_AddChoice(dia_onar_howmuch,"� ����?",dia_onar_howmuch_perday);
};

func void dia_onar_howmuch_perday()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_PerDay_15_00");	//� ����?
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_01");	//��� �� ���� ��������? � ������! �� � ��� ��� ���� �����.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_02");	//�����, ������� ���� � ������ ���� ������.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_03");	//� �� ��������� ��������� �� ����.
};

func void dia_onar_howmuch_more()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_More_15_00");	//����� �� ���...
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_01");	//�������, �� �� ������ ���������� �� ���� ������ ���������, ���� ������.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_02");	//��� ���, ��� �� ��������!
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"� ���� �������� � ����� ������������� ��� ��������������, ����� ��� ��� �����������������.");
	Info_ClearChoices(dia_onar_howmuch);
};

func void dia_onar_howmuch_ok()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_Ok_15_00");	//������!
	AI_Output(self,other,"DIA_Onar_HowMuch_Ok_14_01");	//� ���� ��� �����. � ������ ���, �������� � ��.
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"� ���� �������� � ����� ������������� ��� ��������������, ����� ��� ��� �����������������.");
	Info_ClearChoices(dia_onar_howmuch);
};


instance DIA_ONAR_COLLECTGOLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 8;
	condition = dia_onar_collectgold_condition;
	information = dia_onar_collectgold_info;
	permanent = TRUE;
	description = "������� ��� ��� ���������!";
};


func int dia_onar_collectgold_condition()
{
	if(Npc_KnowsInfo(other,dia_onar_howmuch) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_onar_collectgold_info()
{
	AI_Output(other,self,"DIA_Onar_CollectGold_15_00");	//������� ��� ��� ���������!
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_01");	//� ����� ���������, � �� ��������� �� ��������.
	}
	else if(TORLOF_THEOTHERMISSION_TOOLATE == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_02");	//�� ����� ������������ �� ������ �����������!
		AI_Output(self,other,"DIA_Onar_CollectGold_14_03");	//� ������� �������, ��� � ���� ���� ����. � �� ������ ���, ��� �� ���������� ������ � ���� ������ ����� ��������.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_04");	//� �� ��������� ������� �������.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_05");	//������ �� ������ ���������� ��������� ������ ��� ������! ����� ����, ����� �� ������� ���� ����.
	}
	else if(b_getgreatestpetzcrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_06");	//� ������, ��� �� ������� ���������. ������� ����� � �� � ���������� ���� ������.
	}
	else if(Wld_GetDay() <= ONAR_SOLD_DAY)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_07");	//�� ���, ������ ����� �� ���?
		AI_Output(self,other,"DIA_Onar_CollectGold_14_08");	//�� ������ ���������� � ���� ���� �� ����. �� �������� ���� ��������� ������.
	}
	else if((Wld_GetDay() - 2) >= ONAR_SOLD_DAY)
	{
		if((Wld_GetDay() - 2) == ONAR_SOLD_DAY)
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_09");	//��� �� ��� �����?
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_10");	//��� �� ��� ��������� ���� ����?
		};
		AI_Output(self,other,"DIA_Onar_CollectGold_14_11");	//�� �� ����� ���� �� ���������!
		AI_Output(self,other,"DIA_Onar_CollectGold_14_12");	//��� �����, ��� �� ������.
		ONAR_SOLD_DAY = Wld_GetDay();
		ONAR_SOLD_XP = other.exp;
	}
	else
	{
		if(other.exp > (ONAR_SOLD_XP + 200))
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_13");	//(����������) ��, �����. ��� ���� ���������.
			b_giveinvitems(other,self,itmi_gold,SOLD);
			b_say_gold(self,other,SOLD);
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_14");	//���? �� �� �� ������ �� �����, ������ ���� � �������� �� ���� � ����!
			AI_Output(self,other,"DIA_Onar_CollectGold_14_15");	//� �� ��������� ������� �� ���!
		};
		ONAR_SOLD_DAY = Wld_GetDay();
		ONAR_SOLD_XP = other.exp;
	};
};


instance DIA_ONAR_MARIAGOLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 9;
	condition = dia_onar_mariagold_condition;
	information = dia_onar_mariagold_info;
	permanent = FALSE;
	description = "����� ������, ��� � ������� ������������.";
};


func int dia_onar_mariagold_condition()
{
	if(MARIA_MEHRGOLD == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_mariagold_info()
{
	AI_Output(other,self,"DIA_Onar_MariaGold_15_00");	//����� ������, ��� � ������� ������������.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_01");	//���?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_02");	//��� �������, ��� �� ������ ������� ��� ������.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_03");	//(��������) ��� ���� ���� ���� ��� �� ��� ����.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_04");	//��� ������� �������?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_05");	//���.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_06");	//������, ������� �� ���������� ���������, �� ������ �������� �� 10 ����� ������.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_07");	//�� �� ������� ������, �������?
	SOLD = SOLD + 10;
};


var int onar_sellsheep;

instance DIA_ONAR_WANNASHEEP(C_INFO)
{
	npc = bau_900_onar;
	nr = 10;
	condition = dia_onar_wannasheep_condition;
	information = dia_onar_wannasheep_info;
	permanent = TRUE;
	description = "� ���� ������ ����!";
};


func int dia_onar_wannasheep_condition()
{
	if(ONAR_SELLSHEEP == FALSE)
	{
		return TRUE;
	};
};

func void dia_onar_wannasheep_info()
{
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_00");	//� ���� ������ ����!
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_01");	//� ��� �� ����� ����� �������? �� ���-�� ������ ����� ����?
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_02");	//�...
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_03");	//���� �� ������ ������ ����, ��� �� ��������. ��� ��������� ������ �� ����� ����.
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_04");	//���� ������� ���� ����.
	if(Npc_IsDead(pepe))
	{
		AI_Output(other,self,"DIA_Onar_WannaSheep_15_05");	//�����, ��� ���� �����.
		AI_Output(self,other,"DIA_Onar_WannaSheep_14_06");	//��! � ����� ������... ������ 200 ������ ���, � ��� ������ ���� ���� �� ��������.
		ONAR_SELLSHEEP = TRUE;
	};
};


instance DIA_ONAR_BUYLIESEL(C_INFO)
{
	npc = bau_900_onar;
	nr = 10;
	condition = dia_onar_buyliesel_condition;
	information = dia_onar_buyliesel_info;
	permanent = TRUE;
	description = "���, �����, 200 ������� �����. ��� ��� ����.";
};


func int dia_onar_buyliesel_condition()
{
	if(ONAR_SELLSHEEP == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_buyliesel_info()
{
	AI_Output(other,self,"DIA_Onar_BuyLiesel_15_00");	//���, �����, 200 ������� �����. ��� ��� ����.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_01");	//�� ������ ��� ������� ���� ���� �� ��������.
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_02");	//���� �� ��� ����������� ������ �� �����. ����������� ���� ���� ���������� �� ��� �����.
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_03");	//� ���� ��� ������� ������! �� ����� ���������� ��� ����������� �����.
	};
};

