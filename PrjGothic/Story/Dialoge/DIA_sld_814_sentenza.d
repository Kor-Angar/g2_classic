
instance DIA_SENTENZA_EXIT(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 999;
	condition = dia_sentenza_exit_condition;
	information = dia_sentenza_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sentenza_exit_condition()
{
	return TRUE;
};

func void dia_sentenza_exit_info()
{
	AI_StopProcessInfos(self);
};


var int sentenza_wants50;
var int sentenza_searchday;

instance DIA_SENTENZA_HELLO(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 1;
	condition = dia_sentenza_hello_condition;
	information = dia_sentenza_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sentenza_hello_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_sentenza_hello_info()
{
	AI_Output(self,other,"DIA_Sentenza_Hello_09_00");	//� ���� ��� �� ��������?!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	SENTENZA_SEARCHDAY = b_getdayplus();
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"� ����� ���� �� ����� ����?",dia_sentenza_hello_notyourbusiness);
	Info_AddChoice(dia_sentenza_hello,"� ������ ������������. ��� � ���.",dia_sentenza_hello_justlooking);
};

func void dia_sentenza_hello_justlooking()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_JustLooking_15_00");	//� ������ ������������. ��� � ���.
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_01");	//(�������) ����� ��� ��, ����� ������� ������� ��������! ��� �� ��� ���������, ��� ������ ��������������?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_02");	//��! �� ����� �� ����! ����� ��� ���� ����� ���� �� ����������� ����� ������ ����?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_03");	//��� ��� ��������� ����� ��� ����. ������ � ����� ����, � ������ ������ ������.
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"�� ��������� ����!",dia_sentenza_hello_handsoff);
	Info_AddChoice(dia_sentenza_hello,"��� ������. ������ �������� ����!",dia_sentenza_hello_searchme);
};

func void dia_sentenza_hello_notyourbusiness()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_NotYourBusiness_15_00");	//� ����� ���� �� ����� ����?
	AI_Output(self,other,"DIA_Sentenza_Hello_NotYourBusiness_09_01");	//(��������) ������, ��� �������� ��������� ���� ��� � �������.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void b_sentenza_searchme()
{
	var int playergold;
	playergold = Npc_HasItems(other,itmi_gold);
	AI_Output(other,self,"DIA_Sentenza_Hello_SearchMe_15_00");	//��� ������. ������ �������� ����!
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_01");	//���, ���������, ��� � ��� ����� ����...
	if(playergold >= 50)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_02");	//��! ������! ����� ������ ������ � ����� ����� ���������� ������.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_03");	//������ �� ��������� ��������� ����������. � �� ����� ������� �����, ��� �.
		b_giveinvitems(other,self,itmi_gold,50);
		SENTENZA_GOLDTAKEN = TRUE;
	}
	else if(playergold > 0)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_04");	//��-�... � ���� �� ��� �� ����� � �����.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_05");	//� ������� � ���� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_06");	//� ���� ��� � ����� ������?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_07");	//�� ������, ��� �� ���������. ��, ������ ����, ��������� ��������� ���-��, ���������?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_08");	//�� �� �� �����. � ������, ��� �� ��� ����������. ������ ����.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_09");	//��, ��������, ������������, ��� �����, ��� ��� ���� ������!
	};
	SENTENZA_WANTS50 = TRUE;
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_10");	//� ���� �������� � ���� ����� 50 ������� - ��� ����������� ����. �� ������ ��������� ��� ����� ���� ���. ��� ���� ������, ������?
};

func void dia_sentenza_hello_searchme()
{
	b_sentenza_searchme();
	AI_StopProcessInfos(self);
};

func void dia_sentenza_hello_handsoff()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_HandsOff_15_00");	//�� ��������� ����!
	AI_Output(self,other,"DIA_Sentenza_Hello_HandsOff_09_01");	//(���������) � �� ���?
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"��� ������. ����� ����!",dia_sentenza_hello_searchme);
	Info_AddChoice(dia_sentenza_hello,"� �� �� ����� �� ������� ������ ����������!",dia_sentenza_hello_orelse);
};

func void dia_sentenza_hello_orelse()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_OrElse_15_00");	//� �� �� ����� �� ������� ������ ����������!
	AI_Output(self,other,"DIA_Sentenza_Hello_OrElse_09_01");	//��, ��� �� ���������!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_VZWEI(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 2;
	condition = dia_sentenza_vzwei_condition;
	information = dia_sentenza_vzwei_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sentenza_vzwei_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (SENTENZA_GOLDTAKEN == FALSE) && (SENTENZA_SEARCHDAY < Wld_GetDay()))
	{
		return TRUE;
	};
};

func void dia_sentenza_vzwei_info()
{
	AI_Output(self,other,"DIA_Sentenza_Vzwei_09_00");	//����� ��! ����� ���������, ��� � ���� ���� �� ���� ���!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	SENTENZA_SEARCHDAY = b_getdayplus();
	Info_ClearChoices(dia_sentenza_vzwei);
	Info_AddChoice(dia_sentenza_vzwei,"����� �� ���� ���� ������� ����!",dia_sentenza_vzwei_handsoff);
	Info_AddChoice(dia_sentenza_vzwei,"��� ������. ������ �������� ����!",dia_sentenza_vzwei_searchme);
};

func void dia_sentenza_vzwei_searchme()
{
	b_sentenza_searchme();
	AI_StopProcessInfos(self);
};

func void dia_sentenza_vzwei_handsoff()
{
	AI_Output(other,self,"DIA_Sentenza_Vzwei_HandsOff_15_00");	//����� �� ���� ���� ������� ����!
	AI_Output(self,other,"DIA_Sentenza_Vzwei_HandsOff_09_01");	//(���������) ��? ������, � ���� � ����� ������ �������� ���������!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_WANNAJOIN(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 3;
	condition = dia_sentenza_wannajoin_condition;
	information = dia_sentenza_wannajoin_info;
	permanent = FALSE;
	description = "� ������, ����� �������������� � ���!";
};


func int dia_sentenza_wannajoin_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_sentenza_wannajoin_info()
{
	AI_Output(other,self,"DIA_Sentenza_WannaJoin_15_00");	//� ������, ����� �������������� � ���!
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_01");	//���������� �������.
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_02");	//(��������) � �� ������, ��� �������� ����� ���������� - ������� ���� ��� ���?
};


instance DIA_SENTENZA_VOTE(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 4;
	condition = dia_sentenza_vote_condition;
	information = dia_sentenza_vote_info;
	permanent = TRUE;
	description = "�� ������������ �� ����?";
};


func int dia_sentenza_vote_condition()
{
	if(Npc_KnowsInfo(other,dia_sentenza_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_sentenza_vote_info()
{
	AI_Output(other,self,"DIA_Sentenza_Vote_15_00");	//�� ������������ �� ����?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_01");	//������ ������, ��� �� ����� ����? (�������) ���.
	}
	else if((Npc_HasItems(self,itmi_gold) >= 50) && ((SENTENZA_GOLDTAKEN == TRUE) || (SENTENZA_GOLDGIVEN == TRUE)))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_02");	//����, ������ �� � ���? 50 ������� - ��� �������� ����� �� ��� �����, ���� ��� �� �������?
		SENTENZA_STIMME = TRUE;
		b_logentry(TOPIC_SLDRESPEKT,"�������� �� ��������� ������ ����� ���������� � ���� ���������.");
	}
	else if((SENTENZA_STIMME == TRUE) && (Npc_HasItems(self,itmi_gold) < 50))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_03");	//����� ����, ��� �� ������ ��� ������? ���� ��, ��� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_04");	//� ���� ��� ������ �� ������, ������! ���� �� ������, ����� � ������������ �� ����, �� ������ ������������ ��� ������� ������.
		AI_Output(other,self,"DIA_Sentenza_Vote_15_05");	//�������?
		AI_Output(self,other,"DIA_Sentenza_Vote_09_06");	//50 �����. ��� ����, ������� ���� ��� ����� �������� �� ���������.
		SENTENZA_WANTS50 = TRUE;
	};
};


var int sentenza_goldgiven;

instance DIA_SENTENZA_PAY50(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 5;
	condition = dia_sentenza_pay50_condition;
	information = dia_sentenza_pay50_info;
	permanent = TRUE;
	description = "��� ���� 50 ������� �����.";
};


func int dia_sentenza_pay50_condition()
{
	if((SENTENZA_WANTS50 == TRUE) && (Npc_HasItems(self,itmi_gold) < 50) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_sentenza_pay50_info()
{
	AI_Output(other,self,"DIA_Sentenza_Pay50_15_00");	//��� ���� 50 ������� �����.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_01");	//�������, �������.
		SENTENZA_GOLDGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_02");	//�� ������� �������� ����. 50 ������� � �� ������� ������! �����?
	};
};


var int sentenza_einmal;

instance DIA_SENTENZA_GOLDBACK(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 6;
	condition = dia_sentenza_goldback_condition;
	information = dia_sentenza_goldback_info;
	permanent = TRUE;
	description = "����� ��� ��� ������!";
};


func int dia_sentenza_goldback_condition()
{
	if(Npc_HasItems(self,itmi_gold) >= 50)
	{
		if((SENTENZA_GOLDGIVEN == FALSE) || (other.guild == GIL_SLD))
		{
			return TRUE;
		};
	};
};

func void dia_sentenza_goldback_info()
{
	AI_Output(other,self,"DIA_Sentenza_GoldBack_15_00");	//����� ��� ��� ������!
	if((other.guild == GIL_SLD) && (TORLOF_SENTENZACOUNTED == TRUE) && (SENTENZA_EINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_01");	//����� ����, ��� � ������������ �� ����?
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_02");	//�� ��, ������� ����������!
		SENTENZA_EINMAL = TRUE;
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_03");	//����������! � ������ �������� ���� �� ���...
	};
};


instance DIA_SENTENZA_AUFSMAUL(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 7;
	condition = dia_sentenza_aufsmaul_condition;
	information = dia_sentenza_aufsmaul_info;
	permanent = FALSE;
	description = "������, � ��� ��� � ���� ����� �������? ���� ��� �������? ";
};


func int dia_sentenza_aufsmaul_condition()
{
	if((Npc_HasItems(self,itmi_gold) >= 50) || Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		return TRUE;
	};
};

func void dia_sentenza_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaul_15_00");	//������, � ��� ��� � ���� ����� �������? ���� ��� �������?
	AI_Output(self,other,"DIA_Sentenza_AufsMaul_09_01");	//(��� �������) �����, �� ��� ����� �����...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_AUFSMAULAGAIN(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 8;
	condition = dia_sentenza_aufsmaulagain_condition;
	information = dia_sentenza_aufsmaulagain_info;
	permanent = TRUE;
	description = "������ ����� ��������� �������!";
};


func int dia_sentenza_aufsmaulagain_condition()
{
	if(Npc_KnowsInfo(other,dia_sentenza_aufsmaul))
	{
		if((Npc_HasItems(self,itmi_gold) >= 50) || Npc_KnowsInfo(other,dia_jarvis_missionko))
		{
			return TRUE;
		};
	};
};

func void dia_sentenza_aufsmaulagain_info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaulAgain_15_00");	//������ ����� ��������� �������!
	AI_Output(self,other,"DIA_Sentenza_AufsMaulAgain_09_01");	//��� �������...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_PERM(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 1;
	condition = dia_sentenza_perm_condition;
	information = dia_sentenza_perm_info;
	permanent = TRUE;
	description = "��, ��� ����?";
};


func int dia_sentenza_perm_condition()
{
	return TRUE;
};

func void dia_sentenza_perm_info()
{
	AI_Output(other,self,"DIA_Sentenza_PERM_15_00");	//��, ��� ����?
	AI_Output(self,other,"DIA_Sentenza_PERM_09_01");	//���� ��� ������� ����, �� �� ���������� ������� ��� ��� ������� ��� ����.
	if(Npc_HasItems(self,itmi_gold) < 50)
	{
		AI_Output(self,other,"DIA_Sentenza_PERM_09_02");	//�� ����������� ����. (��������)
	};
};


instance DIA_SENTENZA_PICKPOCKET(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 900;
	condition = dia_sentenza_pickpocket_condition;
	information = dia_sentenza_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_sentenza_pickpocket_condition()
{
	return c_beklauen(56,65);
};

func void dia_sentenza_pickpocket_info()
{
	Info_ClearChoices(dia_sentenza_pickpocket);
	Info_AddChoice(dia_sentenza_pickpocket,DIALOG_BACK,dia_sentenza_pickpocket_back);
	Info_AddChoice(dia_sentenza_pickpocket,DIALOG_PICKPOCKET,dia_sentenza_pickpocket_doit);
};

func void dia_sentenza_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sentenza_pickpocket);
};

func void dia_sentenza_pickpocket_back()
{
	Info_ClearChoices(dia_sentenza_pickpocket);
};

