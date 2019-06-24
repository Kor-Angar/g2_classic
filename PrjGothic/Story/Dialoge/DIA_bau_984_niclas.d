
instance DIA_NICLAS_EXIT(C_INFO)
{
	npc = bau_984_niclas;
	nr = 999;
	condition = dia_niclas_exit_condition;
	information = dia_niclas_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_niclas_exit_condition()
{
	return TRUE;
};

func void dia_niclas_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NICLAS_HELLO(C_INFO)
{
	npc = bau_984_niclas;
	nr = 1;
	condition = dia_niclas_hello_condition;
	information = dia_niclas_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_niclas_hello_condition()
{
	return TRUE;
};

func void dia_niclas_hello_info()
{
	AI_Output(self,other,"DIA_Niclas_Hello_03_00");	//�� ���� ������?
	AI_Output(other,self,"DIA_Niclas_Hello_15_01");	//� ���� �� ���� ���?
	AI_Output(self,other,"DIA_Niclas_Hello_03_02");	//����� �� ����� � ����� ���� ����? ����� ������ ���.
};


instance DIA_NICLAS_HAVEALOOK(C_INFO)
{
	npc = bau_984_niclas;
	nr = 1;
	condition = dia_niclas_havealook_condition;
	information = dia_niclas_havealook_info;
	permanent = FALSE;
	description = "� ������ �����, ������� ��������.";
};


func int dia_niclas_havealook_condition()
{
	return TRUE;
};

func void dia_niclas_havealook_info()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_15_00");	//� ������ �����, ������� ��������.
	AI_Output(self,other,"DIA_Niclas_HaveALook_03_01");	//������, ���� ���� ������. ������ ����� ����?
	CreateInvItems(self,itfomutton,1);
	Info_ClearChoices(dia_niclas_havealook);
	Info_AddChoice(dia_niclas_havealook,"���, �������.",dia_niclas_havealook_no);
	Info_AddChoice(dia_niclas_havealook,"��, �������.",dia_niclas_havealook_yes);
};

func void dia_niclas_havealook_no()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_No_15_00");	//���, �������.
	AI_Output(self,other,"DIA_Niclas_HaveALook_No_03_01");	//��� ������. �������, �� �� ������ ������, ���� � ����.
	b_useitem(self,itfomutton);
	Info_ClearChoices(dia_niclas_havealook);
};

func void dia_niclas_havealook_yes()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_Yes_15_00");	//��, �������.
	AI_Output(self,other,"DIA_Niclas_HaveALook_Yes_03_01");	//�����, ���������� ���� ����������. ������������ �� ����� ������������ �������.
	b_giveinvitems(self,other,itfomutton,1);
	Info_ClearChoices(dia_niclas_havealook);
};


instance DIA_NICLAS_WHYHERE(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_whyhere_condition;
	information = dia_niclas_whyhere_info;
	permanent = FALSE;
	description = "� �� ��� ����� �������?";
};


func int dia_niclas_whyhere_condition()
{
	return TRUE;
};

func void dia_niclas_whyhere_info()
{
	AI_Output(other,self,"DIA_Niclas_WhyHere_15_00");	//� �� ��� ����� �������?
	AI_Output(self,other,"DIA_Niclas_WhyHere_03_01");	//����� ��� ���������. � ������ �������� ���� ������� � ������.
};


instance DIA_NICLAS_SHOULDNTWORK(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_shouldntwork_condition;
	information = dia_niclas_shouldntwork_info;
	permanent = FALSE;
	description = "����� ���� �� ����� ��������?";
};


func int dia_niclas_shouldntwork_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_whyhere))
	{
		return TRUE;
	};
};

func void dia_niclas_shouldntwork_info()
{
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_00");	//����� ���� �� ����� ��������?
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_01");	//���, ��� ��� �����, � ���� ������ ���. � ��� ������� ������, � ������� �������� ���� �����.
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_15_02");	//��� �� �������.
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_03_03");	//��, ���� ���� �������� ��� �����. �� � ������� ������ ��� ����������, � �� ����� ���������� �����.
};


instance DIA_NICLAS_CANTEACHME(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_canteachme_condition;
	information = dia_niclas_canteachme_info;
	permanent = FALSE;
	description = "� ����� ������, � ������, ��� �� ������ ������� ���� ����-������.";
};


func int dia_niclas_canteachme_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_shouldntwork))
	{
		return TRUE;
	};
};

func void dia_niclas_canteachme_info()
{
	AI_Output(other,self,"DIA_Niclas_CanTeachMe_15_00");	//� ����� ������, � ������, ��� �� ������ ������� ���� ����-������.
	AI_Output(self,other,"DIA_Niclas_CanTeachMe_03_01");	//������ �� � ���. � ���� �������� ����, ��� ��������� ������� ���.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"������ ����� ������� ���� ��������� �������� �� ����.");
};


instance DIA_NICLAS_TEACH(C_INFO)
{
	npc = bau_984_niclas;
	nr = 2;
	condition = dia_niclas_teach_condition;
	information = dia_niclas_teach_info;
	permanent = TRUE;
	description = "������ ���, ��� ��������� ������� ���.";
};


func int dia_niclas_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_canteachme))
	{
		return TRUE;
	};
};

func void dia_niclas_teach_info()
{
	AI_Output(other,self,"DIA_Niclas_Teach_15_00");	//������ ���, ��� ��������� ������� ���.
	if(other.hitchance[NPC_TALENT_BOW] >= 50)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_01");	//� ������ ���� �����, ��� ���. ������ ���� ����� �������� ������� �������.
	}
	else
	{
		Info_ClearChoices(dia_niclas_teach);
		Info_AddChoice(dia_niclas_teach,DIALOG_BACK,dia_niclas_teach_back);
		Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_niclas_teach_bow_1);
		Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_niclas_teach_bow_5);
	};
};

func void dia_niclas_teach_back()
{
	if(other.hitchance[NPC_TALENT_BOW] >= 50)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_00");	//��� ������ ������ ����� ����.
	};
	Info_ClearChoices(dia_niclas_teach);
};

func void dia_niclas_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,50);
	Info_ClearChoices(dia_niclas_teach);
	Info_AddChoice(dia_niclas_teach,DIALOG_BACK,dia_niclas_teach_back);
	Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_niclas_teach_bow_1);
	Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_niclas_teach_bow_5);
};

func void dia_niclas_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,50);
	Info_ClearChoices(dia_niclas_teach);
	Info_AddChoice(dia_niclas_teach,DIALOG_BACK,dia_niclas_teach_back);
	Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_niclas_teach_bow_1);
	Info_AddChoice(dia_niclas_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_niclas_teach_bow_5);
};


instance DIA_NICLAS_PICKPOCKET(C_INFO)
{
	npc = bau_984_niclas;
	nr = 900;
	condition = dia_niclas_pickpocket_condition;
	information = dia_niclas_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_niclas_pickpocket_condition()
{
	return c_beklauen(27,20);
};

func void dia_niclas_pickpocket_info()
{
	Info_ClearChoices(dia_niclas_pickpocket);
	Info_AddChoice(dia_niclas_pickpocket,DIALOG_BACK,dia_niclas_pickpocket_back);
	Info_AddChoice(dia_niclas_pickpocket,DIALOG_PICKPOCKET,dia_niclas_pickpocket_doit);
};

func void dia_niclas_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_niclas_pickpocket);
};

func void dia_niclas_pickpocket_back()
{
	Info_ClearChoices(dia_niclas_pickpocket);
};

