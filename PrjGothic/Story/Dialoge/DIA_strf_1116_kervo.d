
instance DIA_KERVO_EXIT(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 999;
	condition = dia_kervo_exit_condition;
	information = dia_kervo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kervo_exit_condition()
{
	return TRUE;
};

func void dia_kervo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_WASIST(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 4;
	condition = dia_kervo_wasist_condition;
	information = dia_kervo_wasist_info;
	description = "�� ��� � �����?";
};


func int dia_kervo_wasist_condition()
{
	return TRUE;
};

func void dia_kervo_wasist_info()
{
	AI_Output(other,self,"DIA_Kervo_WASIST_15_00");	//�� ��� � �����?
	AI_Output(self,other,"DIA_Kervo_WASIST_13_01");	//�� ��� �����������? �� ������ ������ ��������!
	AI_Output(self,other,"DIA_Kervo_WASIST_13_02");	//��� ������� ������� ������ ��� ���� � ��� ���, ��� � ������ ����.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_03");	//������� �� ���� ����� ����. �� ����� � �������� ��� ����.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_04");	//������ � �� ����, ��� ��� ������� ��������� ������.
};


instance DIA_KERVO_HILFE(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 5;
	condition = dia_kervo_hilfe_condition;
	information = dia_kervo_hilfe_info;
	description = "�� ������� ���������� ����� ������?";
};


func int dia_kervo_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_kervo_wasist))
	{
		return TRUE;
	};
};

func void dia_kervo_hilfe_info()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_15_00");	//�� ������� ���������� ����� ������?
	AI_Output(self,other,"DIA_Kervo_HILFE_13_01");	//� ���, ��-������, �� ��� �����? ���� 20 ������ �� ������� ���� ������, ���� ��� ����� ������ ���. �������� ��.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_02");	//����� ��� ������������� �� �����, � � ���������� �������� �����. � �� �� ������������ ����� ������ � ���� �����.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_03");	//���� ���� ��� �������, ����� � ���� ������� ����� ������, ������ ��������.
	Info_ClearChoices(dia_kervo_hilfe);
	Info_AddChoice(dia_kervo_hilfe,"�����. � �����.",dia_kervo_hilfe_tschau);
	Info_AddChoice(dia_kervo_hilfe,"�� �� �� �� ������ ���������� ����� �����.",dia_kervo_hilfe_ewig);
	if(KERVO_GOTSTUFF == TRUE)
	{
		Info_AddChoice(dia_kervo_hilfe,"��� �� ��� ����, ���� � ���� ���� ������?",dia_kervo_hilfe_problem);
	};
	MIS_KERVO_KILLLURKER = LOG_RUNNING;
};

func void dia_kervo_hilfe_ewig()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_ewig_15_00");	//�� �� �� �� ������ ���������� ����� �����.
	AI_Output(self,other,"DIA_Kervo_HILFE_ewig_13_01");	//� �� ����, ��� ���� ����� �� ����, �� � ���� ������� ���� ����: �� �� ��������� ���� ���� ������.
};


var int kervo_promisenugget;

func void dia_kervo_hilfe_problem()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_Problem_15_00");	//��� �� ��� ����, ���� � ���� ���� ������?
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_01");	//���. ��. � ��� �� �� �����, ����� ��� �������, ��� ������ ����� �������, �������.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_02");	//� ����� ������ ������ ������. �� ���� ���. � ������, �� ������� ���������� ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_03");	//� ����� ����� ����.
	};
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_04");	//� ����� ���� ���.
	KERVO_PROMISENUGGET = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kervo_hilfe_tschau()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_tschau_15_00");	//�����. � �����.
	AI_Output(self,other,"DIA_Kervo_HILFE_tschau_13_01");	//��� ������. � ���� ���������� �� ����.
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_LURKERPLATT(C_INFO)
{
	npc = strf_1116_kervo;
	condition = dia_kervo_lurkerplatt_condition;
	information = dia_kervo_lurkerplatt_info;
	description = "�������� ������ ���.";
};


func int dia_kervo_lurkerplatt_condition()
{
	if((MIS_KERVO_KILLLURKER == LOG_RUNNING) && Npc_IsDead(kervo_lurker1) && Npc_IsDead(kervo_lurker2) && Npc_IsDead(kervo_lurker3) && Npc_IsDead(kervo_lurker4) && Npc_IsDead(kervo_lurker5) && Npc_IsDead(kervo_lurker6))
	{
		return TRUE;
	};
};

func void dia_kervo_lurkerplatt_info()
{
	AI_Output(other,self,"DIA_Kervo_LurkerPlatt_15_00");	//�������� ������ ���.
	AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_01");	//�������. ������ � ����� ����� ����� ��������.
	if(KERVO_PROMISENUGGET == TRUE)
	{
		AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_02");	//��� ��, ��� � ������ ����.
		if(hero.guild == GIL_KDF)
		{
			b_giveinvitems(self,other,itmi_runeblank,1);
		}
		else
		{
			b_giveinvitems(self,other,itmi_nugget,1);
		};
	};
	b_giveplayerxp(XP_KERVOKILLLURKER);
	MIS_KERVO_KILLLURKER = LOG_SUCCESS;
};


instance DIA_KERVO_VERGISSES(C_INFO)
{
	npc = strf_1116_kervo;
	condition = dia_kervo_vergisses_condition;
	information = dia_kervo_vergisses_info;
	permanent = TRUE;
	description = "�� ������ ������� � �������?";
};


func int dia_kervo_vergisses_condition()
{
	if(MIS_KERVO_KILLLURKER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_kervo_vergisses_info()
{
	AI_Output(other,self,"DIA_Kervo_VERGISSES_15_00");	//�� ������ ������� � �������?
	AI_Output(self,other,"DIA_Kervo_VERGISSES_13_01");	//������ �� ����, ������. ���� ���� �������, �� ����� �������� �������� � �����. � �������� �����.
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_PICKPOCKET(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 900;
	condition = dia_kervo_pickpocket_condition;
	information = dia_kervo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_kervo_pickpocket_condition()
{
	return c_beklauen(34,10);
};

func void dia_kervo_pickpocket_info()
{
	Info_ClearChoices(dia_kervo_pickpocket);
	Info_AddChoice(dia_kervo_pickpocket,DIALOG_BACK,dia_kervo_pickpocket_back);
	Info_AddChoice(dia_kervo_pickpocket,DIALOG_PICKPOCKET,dia_kervo_pickpocket_doit);
};

func void dia_kervo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kervo_pickpocket);
};

func void dia_kervo_pickpocket_back()
{
	Info_ClearChoices(dia_kervo_pickpocket);
};

