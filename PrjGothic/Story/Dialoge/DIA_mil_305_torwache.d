
instance DIA_MIL_305_TORWACHE_EXIT(C_INFO)
{
	npc = mil_305_torwache;
	nr = 999;
	condition = dia_mil_305_torwache_exit_condition;
	information = dia_mil_305_torwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_305_torwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_305_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string MIL_305_CHECKPOINT = "NW_CITY_UPTOWN_PATH_02";

instance DIA_MIL_305_TORWACHE_FIRSTWARN(C_INFO)
{
	npc = mil_305_torwache;
	nr = 1;
	condition = dia_mil_305_torwache_firstwarn_condition;
	information = dia_mil_305_torwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_305_torwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,MIL_305_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (MIL_305_SCHONMALREINGELASSEN == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(MIL_305_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_firstwarn_info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_00");	//����!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_01");	//���� ����������� � �������� � ������! ���� ��������� �� �����, � �� ���� ���������� ���� � ������� �������.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_02");	//���� �� ����������� � ���������, �� �� ������ ����� � ������� ������� ������!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_03");	//� �� ���� ���������� � ������� ������� ������ ���������� ����������� ����� ����.
		};
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_04");	//��� � ����� ����� � ���������� ��� ��������!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_05");	//������ �������� ������ � �������� ����������� ����� ����� ������� � ������� ������� ������!
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_305_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_MIL_305_TORWACHE_SECONDWARN(C_INFO)
{
	npc = mil_305_torwache;
	nr = 2;
	condition = dia_mil_305_torwache_secondwarn_condition;
	information = dia_mil_305_torwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_305_torwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_305_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_SecondWarn_03_00");	//� ��������� ��� ������������ ����. ��� ���� ��� - � �� ������������� � ���� �����.
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_305_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_ATTACK(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_attack_condition;
	information = dia_mil_305_torwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_305_torwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_305_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_305_Torwache_Attack_03_00");	//�� ��� ����������...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_MIL_305_TORWACHE_MESSAGE(C_INFO)
{
	npc = mil_305_torwache;
	nr = 1;
	condition = dia_mil_305_torwache_message_condition;
	information = dia_mil_305_torwache_message_info;
	permanent = FALSE;
	description = "� ���� ������ ��������� ��� ����� ������.";
};


func int dia_mil_305_torwache_message_condition()
{
	if((PLAYER_KNOWSLORDHAGEN == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_message_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_MESSAGE_15_00");	//� ���� ������ ��������� ��� ����� ������.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_01");	//�������� ������ ����� ���������� � ������ ������� �� ������� �������.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_02");	//���� � ���� ���������� ������� ���������, �� ������ � ����� ��� ���������� ������� ���������� �������.
};


instance DIA_MIL_305_TORWACHE_AUSNAHME(C_INFO)
{
	npc = mil_305_torwache;
	nr = 2;
	condition = dia_mil_305_torwache_ausnahme_condition;
	information = dia_mil_305_torwache_ausnahme_info;
	permanent = TRUE;
	description = "� ����� ������� ��� ���� ����������?";
};


func int dia_mil_305_torwache_ausnahme_condition()
{
	if(MIL_305_SCHONMALREINGELASSEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_ausnahme_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_Ausnahme_15_00");	//� ����� ������� ��� ���� ����������?
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_01");	//���?! ������� ���� �������! ������� ��������� �� ���� ��� ����������!
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_02");	//���� � ������� ���� �������� ��� �������, ��� ����� �������� �� ��������� � ���, ��� ��������� ��.
};


instance DIA_MIL_305_TORWACHE_PASSASCITIZEN(C_INFO)
{
	npc = mil_305_torwache;
	nr = 2;
	condition = dia_mil_305_torwache_passascitizen_condition;
	information = dia_mil_305_torwache_passascitizen_info;
	permanent = TRUE;
	description = "� ��������� ��������� ��������! ������� ��� ������!";
};


func int dia_mil_305_torwache_passascitizen_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == FALSE) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passascitizen_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsCitizen_15_00");	//� ��������� ��������� ��������! ������� ��� ������!
	if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_01");	//� �� ����, ��� ��������� �������� �������� ������� ���� � ������� - � �� ���� �����.
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_02");	//�� ������ �����! �� ���� ���� ��� ��������! ���� �� ������ ��������� �� ��������� ������������!
		self.aivar[AIV_PASSGATE] = TRUE;
		MIL_305_SCHONMALREINGELASSEN = TRUE;
		b_checklog();
		AI_StopProcessInfos(self);
	}
	else if((MIS_MATTEO_GOLD == LOG_SUCCESS) || (MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS) || (MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS) || (MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_03");	//��������, ���� ������� ������������ � ���������� ��������� � ������ ����� ������, �� ���� �� �� ��� �����������, � �� ���� �� ����!
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_04");	//�� ������� �������� ����! � ������������ ����!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_05");	//�� �� ������ ����� ��� ����� �������! ����� � ���� ����!
		AI_StopProcessInfos(self);
	};
};


instance DIA_MIL_305_TORWACHE_PASSASMIL(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passasmil_condition;
	information = dia_mil_305_torwache_passasmil_info;
	permanent = TRUE;
	description = "� ������ � ��������� - ��� ��� ������!";
};


func int dia_mil_305_torwache_passasmil_condition()
{
	if((other.guild == GIL_MIL) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passasmil_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMil_15_00");	//� ������ � ��������� - ��� ��� ������!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_01");	//��� ����� ������ ����? ��������, �� �� ����� �� ������ ������, ��� ��������!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_02");	//������ �� ���� �� ���������� ������! ��� ��� ���������� ���� �������� � ����������� � ����������!
	self.aivar[AIV_PASSGATE] = TRUE;
	MIL_305_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASMAGE(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passasmage_condition;
	information = dia_mil_305_torwache_passasmage_info;
	permanent = TRUE;
	description = "�� ������ ������ �� ���� ������������� ������?";
};


func int dia_mil_305_torwache_passasmage_condition()
{
	if((other.guild == GIL_KDF) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passasmage_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_00");	//�� ������ ������ �� ���� ������������� ������?
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_01");	//����... ���! �������, ���! ��� ��������� ������ ���� ������!
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_02");	//������, ����� ����� ������� ���� ��� ���������!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_03");	//��, �, ���������!
	self.aivar[AIV_PASSGATE] = TRUE;
	MIL_305_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASSLD(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passassld_condition;
	information = dia_mil_305_torwache_passassld_info;
	permanent = TRUE;
	description = "� ���� ������ ��������� ��� ����� ������!";
};


func int dia_mil_305_torwache_passassld_condition()
{
	if((other.guild == GIL_SLD) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passassld_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_00");	//� ���� ������ ��������� ��� ����� ������!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_01");	//�� ���� �� ���� �������� ���������! ��� ���� ����� �� ����� ������?
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_02");	//� ������ � ������������ ����.
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_03");	//��! ������, �������, �� ���, ��������, ����� ����� ������. ����� ������� � ����� ������, �� ���������� ���� ����� � ��������, ��� � ��� ������� ����, ��� ���� �� ���������!
	self.aivar[AIV_PASSGATE] = TRUE;
	MIL_305_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PERM(C_INFO)
{
	npc = mil_305_torwache;
	nr = 1;
	condition = dia_mil_305_torwache_perm_condition;
	information = dia_mil_305_torwache_perm_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_mil_305_torwache_perm_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == TRUE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_perm_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PERM_15_00");	//��� ����?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_01");	//��� ������, ����!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_02");	//�� ������ ��������� ���� ������. �������, ��� ������� �� ���� ���� ��������, �, ���������!
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_03");	//��������, ��� �������� ���������� ����, �� � �� ���� ������������� � �����!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_04");	//��� ���� �����?
	};
	AI_StopProcessInfos(self);
};

