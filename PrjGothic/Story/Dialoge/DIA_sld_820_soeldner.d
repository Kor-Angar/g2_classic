
instance DIA_SLD_820_EXIT(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 999;
	condition = dia_sld_820_exit_condition;
	information = dia_sld_820_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sld_820_exit_condition()
{
	return TRUE;
};

func void dia_sld_820_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_820_HALT(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 1;
	condition = dia_sld_820_halt_condition;
	information = dia_sld_820_halt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_820_halt_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_820_halt_info()
{
	AI_Output(self,other,"DIA_Sld_820_Halt_07_00");	//� ���� �� �����?
	AI_Output(other,self,"DIA_Sld_820_Halt_15_01");	//� ���, ������� ��.
	AI_Output(self,other,"DIA_Sld_820_Halt_07_02");	//���� ������ ��� �� ��, ����� �� �� ������� � ��� ������ ����� ����!
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Sld_820_Halt_07_03");	//����� �� ����� ���������! �� ������ ��� � ������.
	};
	AI_Output(other,self,"DIA_Sld_820_Halt_15_04");	//� ���� ���������� � ��!
	AI_Output(self,other,"DIA_Sld_820_Halt_07_05");	//��� ���� ����� �� ����?
	Info_ClearChoices(dia_sld_820_halt);
	Info_AddChoice(dia_sld_820_halt,"�� � � ������ ��������...",dia_sld_820_halt_kennelee);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(dia_sld_820_halt,"� ���� �������������� � ���������!",dia_sld_820_halt_wannajoin);
	};
};

func void b_sld_820_leeisright()
{
	AI_Output(self,other,"B_Sld_820_LeeIsRight_07_00");	//�� � ������ �����. � ���� �� ������� ��������� ����-���� ���!
};

func void dia_sld_820_halt_wannajoin()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_WannaJoin_15_00");	//� ���� �������������� � ���������!
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_01");	//��, ������ �������� ����! ����� ����������.
	b_sld_820_leeisright();
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_02");	//�� ������ ������������: ������ ����� � �����! �� ����� �� �����, ����� � ��� ������������ �����������. �������� ����� ����� ����.
	AI_StopProcessInfos(self);
};

func void dia_sld_820_halt_kennelee()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_KenneLee_15_00");	//�� � � ������ ��������...
	AI_Output(self,other,"DIA_Sld_820_Halt_KenneLee_07_01");	//�� �������� ��? � �� ���� � ���! �� ��� �����, �������, � ���� �� �� ������ ����, ����� �������... (�������)
	b_sld_820_leeisright();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_820_PERM(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 1;
	condition = dia_sld_820_perm_condition;
	information = dia_sld_820_perm_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_sld_820_perm_condition()
{
	return TRUE;
};

func void dia_sld_820_perm_info()
{
	AI_Output(other,self,"DIA_Sld_820_PERM_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Sld_820_PERM_07_01");	//�������, ���� ������, �� �� ���� ��������� �����.
	AI_StopProcessInfos(self);
};

