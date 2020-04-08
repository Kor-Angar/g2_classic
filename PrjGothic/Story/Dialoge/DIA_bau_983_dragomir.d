
instance DIA_DRAGOMIR_EXIT(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 999;
	condition = dia_dragomir_exit_condition;
	information = dia_dragomir_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragomir_exit_condition()
{
	return TRUE;
};

func void dia_dragomir_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DRAGOMIR_HELLO(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 1;
	condition = dia_dragomir_hello_condition;
	information = dia_dragomir_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragomir_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_dragomir_hello_info()
{
	AI_Output(self,other,"DIA_Dragomir_Hello_12_00");	//������������� ��� ������ �� ����?
	AI_Output(self,other,"DIA_Dragomir_Hello_12_01");	//����� ���� �� �������� ������������, �������� ����� �� ������ ����.
};


instance DIA_DRAGOMIR_OUTHERE(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_outhere_condition;
	information = dia_dragomir_outhere_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_dragomir_outhere_condition()
{
	return TRUE;
};

func void dia_dragomir_outhere_info()
{
	AI_Output(other,self,"DIA_Dragomir_OutHere_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_01");	//��, ������ � ������� ������� ����� ��� ����, ��� ������ � � ���� �����.
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_02");	//���������� �������� ����� �����, ������, ��� ������ �� �����������.
};


instance DIA_DRAGOMIR_SETTLERS(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_settlers_condition;
	information = dia_dragomir_settlers_info;
	permanent = FALSE;
	description = "� ��� ��� � ���� ������?";
};


func int dia_dragomir_settlers_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_outhere))
	{
		return TRUE;
	};
};

func void dia_dragomir_settlers_info()
{
	AI_Output(other,self,"DIA_Dragomir_Settlers_15_00");	//� ��� ��� � ���� ������?
	AI_Output(self,other,"DIA_Dragomir_Settlers_12_01");	//������� �� ����. ��������, �����-������ ��������. � �������, ��� ������, ��� ����� ����� ������� ������.
};


instance DIA_DRAGOMIR_DANGEROUS(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_dangerous_condition;
	information = dia_dragomir_dangerous_info;
	permanent = FALSE;
	description = "� ����� ����� �� ������?";
};


func int dia_dragomir_dangerous_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_outhere))
	{
		return TRUE;
	};
};

func void dia_dragomir_dangerous_info()
{
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_00");	//� ����� ����� �� ������?
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_01");	//��... �� �����, ���� �� ������ �������� �� ����. ��� ������� ��� ������������ ������ ����.
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_02");	//��. �� �� ����� �� �������.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_03");	//�� ������������, ���� �� ������, ��� ���������� � ���. ��, � ���� ��� ������� ��������. ��, � ���������, � ������� ���.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_04");	//� ������ ������� ������ �� �����, � ����. ��� ��������� ������� �������� ���� � ���������� �������.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_05");	//���� � �������� ��� �� �����������, �� ���� �������� ��� ������� ������� � ������ �� ����.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_06");	//��� �������� ������ �� ���� ���.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_07");	//� ����� � �����, ������� ����������� �� ���� ����. � �����, �� ��� ��� ����� ���, � ����� ��������� ����� �� ������.
	Log_CreateTopic(TOPIC_DRAGOMIRSARMBRUST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRAGOMIRSARMBRUST,LOG_RUNNING);
	b_logentry(TOPIC_DRAGOMIRSARMBRUST,"�������� ������� ���� ������� � �������� �������� �����, ����������� ������ � �������� �����.");
	MIS_DRAGOMIRSARMBRUST = LOG_RUNNING;
};


instance DIA_DRAGOMIR_ARMBRUST(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_armbrust_condition;
	information = dia_dragomir_armbrust_info;
	permanent = FALSE;
	description = "���. � ����� ���� �������.";
};


func int dia_dragomir_armbrust_condition()
{
	if((MIS_DRAGOMIRSARMBRUST == LOG_RUNNING) && Npc_HasItems(other,itrw_dragomirsarmbrust_mis))
	{
		return TRUE;
	};
};

func void dia_dragomir_armbrust_info()
{
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_00");	//���. � ����� ���� �������.
	b_giveinvitems(other,self,itrw_dragomirsarmbrust_mis,1);
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_01");	//�����, ��� ��� �������. ������ �� ������ ���, ��� �� ����� � ����� ��������� �����?
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_02");	//� ��� � ���� ������?
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_03");	//��� ���� ����� ����������� � ����� �������. �� ��� �����, �������.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_04");	//�����������, � ����� ��������� �� ��� ���� ������. �������, ����� ����� ����������.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MIS_DRAGOMIRSARMBRUST = LOG_SUCCESS;
	b_giveplayerxp(XP_DRAGOMIRSARMBRUST);
};


var int dragomir_teachplayer;
const int DRAGOMIR_TEACHINGCOST = 150;

instance DIA_DRAGOMIR_LEARN(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_learn_condition;
	information = dia_dragomir_learn_info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_dragomir_learn_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_dangerous) && (DRAGOMIR_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_dragomir_learn_info()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_15_00");	//�� ������ ������� ���� ����-������?
	if(other.attribute[ATR_DEXTERITY] < 30)
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_01");	//������, ��� � ����� ������� ���� ����-������, �� ������ �������� ���� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_02");	//���� �� ������ ���������. ��� � ��� �������, � ������ ������� ������� � ���������.
		AI_Output(other,self,"DIA_Dragomir_Learn_15_03");	//������� �� ������?
		b_say_gold(self,other,DRAGOMIR_TEACHINGCOST);
		Info_ClearChoices(dia_dragomir_learn);
		Info_AddChoice(dia_dragomir_learn,"����� ����, �����.",dia_dragomir_learn_later);
		if(Npc_HasItems(other,itmi_gold) >= DRAGOMIR_TEACHINGCOST)
		{
			Info_AddChoice(dia_dragomir_learn,"��� ���� ������.",dia_dragomir_learn_here);
		};
	};
};

func void dia_dragomir_learn_later()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Later_15_00");	//��������, �����.
	Info_ClearChoices(dia_dragomir_learn);
};

func void dia_dragomir_learn_here()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Here_15_00");	//��� ���� ������.
	b_giveinvitems(other,self,itmi_gold,DRAGOMIR_TEACHINGCOST);
	AI_Output(self,other,"DIA_Dragomir_Learn_Here_12_01");	//������, �� ����� ������ ���� ������.
	DRAGOMIR_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_dragomir_learn);
};


var int dia_dragomir_teach_permanent;

instance DIA_DRAGOMIR_TEACH(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_teach_condition;
	information = dia_dragomir_teach_info;
	permanent = TRUE;
	description = "����� ���� ����-������.";
};


func int dia_dragomir_teach_condition()
{
	if((DRAGOMIR_TEACHPLAYER == TRUE) && (DIA_DRAGOMIR_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_dragomir_teach_info()
{
	AI_Output(other,self,"DIA_Dragomir_Teach_15_00");	//����� ���� ����-������.
	Info_ClearChoices(dia_dragomir_teach);
	Info_AddChoice(dia_dragomir_teach,DIALOG_BACK,dia_dragomir_teach_back);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_dragomir_teach_1h_1);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_dragomir_teach_1h_5);
};

func void dia_dragomir_teach_back()
{
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 60)
	{
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00");	//� ������ ������ �� ���� ������� ����. ���� ����� �������� ������� �������.
		DIA_DRAGOMIR_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_dragomir_teach);
};

func void dia_dragomir_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	Info_ClearChoices(dia_dragomir_teach);
	Info_AddChoice(dia_dragomir_teach,DIALOG_BACK,dia_dragomir_teach_back);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_dragomir_teach_1h_1);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_dragomir_teach_1h_5);
};

func void dia_dragomir_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	Info_ClearChoices(dia_dragomir_teach);
	Info_AddChoice(dia_dragomir_teach,DIALOG_BACK,dia_dragomir_teach_back);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_dragomir_teach_1h_1);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_dragomir_teach_1h_5);
};


instance DIA_DRAGOMIR_PICKPOCKET(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 900;
	condition = dia_dragomir_pickpocket_condition;
	information = dia_dragomir_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_dragomir_pickpocket_condition()
{
	return c_beklauen(47,70);
};

func void dia_dragomir_pickpocket_info()
{
	Info_ClearChoices(dia_dragomir_pickpocket);
	Info_AddChoice(dia_dragomir_pickpocket,DIALOG_BACK,dia_dragomir_pickpocket_back);
	Info_AddChoice(dia_dragomir_pickpocket,DIALOG_PICKPOCKET,dia_dragomir_pickpocket_doit);
};

func void dia_dragomir_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dragomir_pickpocket);
};

func void dia_dragomir_pickpocket_back()
{
	Info_ClearChoices(dia_dragomir_pickpocket);
};

