
instance DIA_GEPPERT_EXIT(C_INFO)
{
	npc = strf_1115_geppert;
	nr = 999;
	condition = dia_geppert_exit_condition;
	information = dia_geppert_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_geppert_exit_condition()
{
	return TRUE;
};

func void dia_geppert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEPPERT_HALLO(C_INFO)
{
	npc = strf_1115_geppert;
	nr = 4;
	condition = dia_geppert_hallo_condition;
	information = dia_geppert_hallo_info;
	important = TRUE;
};


func int dia_geppert_hallo_condition()
{
	return TRUE;
};


var int kervo_gotstuff;

func void dia_geppert_hallo_info()
{
	if((Npc_IsDead(kervo) == FALSE) && (KERVO_GOTSTUFF == FALSE))
	{
		if(hero.guild == GIL_KDF)
		{
			CreateInvItems(kervo,itmi_runeblank,1);
		}
		else
		{
			CreateInvItems(kervo,itmi_nugget,1);
		};
		KERVO_GOTSTUFF = TRUE;
	};
	AI_Output(self,other,"DIA_Geppert_HALLO_10_00");	//����! ��� ����?
	AI_Output(self,other,"DIA_Geppert_HALLO_10_01");	//�� ������ �� �� ���, ����� ��������� ���� �����, � �����? ���?
	AI_Output(self,other,"DIA_Geppert_HALLO_10_02");	//� ������ ������������ ����. � �� �� ��� �� ������� �����.
	Info_ClearChoices(dia_geppert_hallo);
	Info_AddChoice(dia_geppert_hallo,"��� �� ������� �����?",dia_geppert_hallo_wasmachtihr);
	Info_AddChoice(dia_geppert_hallo,"�� ��������� ���������, ���������?",dia_geppert_hallo_flucht);
};

func void dia_geppert_hallo_flucht()
{
	AI_Output(other,self,"DIA_Geppert_HALLO_Flucht_15_00");	//�� ��������� ���������, ���������?
	AI_Output(self,other,"DIA_Geppert_HALLO_Flucht_10_01");	//����� �� ��������������. � ������ ���, ��-������, � ������� � ��� ������� ����?
	Info_ClearChoices(dia_geppert_hallo);
};

func void dia_geppert_hallo_wasmachtihr()
{
	AI_Output(other,self,"DIA_Geppert_HALLO_Wasmachtihr_15_00");	//��� �� ������� �����?
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_01");	//��� �� ��������� ������? � ��������� ����� �� ����� ������.
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_02");	//������ ������ ������ �� �����. ���� ���� ����, ���� ����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_03");	//��������� ������. ���������! ��� �� ���? � ���� ������ �� ��������� ������ ���� �������.
	};
	AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_04");	//� �� ������� �����, � �����. � �����.
	Info_ClearChoices(dia_geppert_hallo);
};


instance DIA_GEPPERT_BRATEN(C_INFO)
{
	npc = strf_1115_geppert;
	nr = 5;
	condition = dia_geppert_braten_condition;
	information = dia_geppert_braten_info;
	permanent = TRUE;
	description = "���� ������ ��� ��������� ������.";
};


func int dia_geppert_braten_condition()
{
	if(Npc_KnowsInfo(other,dia_geppert_hallo))
	{
		return TRUE;
	};
};

func void dia_geppert_braten_info()
{
	AI_Output(other,self,"DIA_Geppert_BRATEN_15_00");	//���� ������ ��� ��������� ������.
	AI_Output(self,other,"DIA_Geppert_BRATEN_10_01");	//�� ������!
	AI_StopProcessInfos(self);
};


instance DIA_GEPPERT_PICKPOCKET(C_INFO)
{
	npc = strf_1115_geppert;
	nr = 900;
	condition = dia_geppert_pickpocket_condition;
	information = dia_geppert_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_geppert_pickpocket_condition()
{
	return c_beklauen(56,5);
};

func void dia_geppert_pickpocket_info()
{
	Info_ClearChoices(dia_geppert_pickpocket);
	Info_AddChoice(dia_geppert_pickpocket,DIALOG_BACK,dia_geppert_pickpocket_back);
	Info_AddChoice(dia_geppert_pickpocket,DIALOG_PICKPOCKET,dia_geppert_pickpocket_doit);
};

func void dia_geppert_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_geppert_pickpocket);
};

func void dia_geppert_pickpocket_back()
{
	Info_ClearChoices(dia_geppert_pickpocket);
};

