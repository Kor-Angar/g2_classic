
instance DIA_PAL_212_SCHIFFSWACHE_EXIT(C_INFO)
{
	npc = pal_212_schiffswache;
	nr = 999;
	condition = dia_pal_212_schiffswache_exit_condition;
	information = dia_pal_212_schiffswache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_212_schiffswache_exit_condition()
{
	return TRUE;
};

func void dia_pal_212_schiffswache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_212_SCHIFFSWACHE_WERSEIDIHR(C_INFO)
{
	npc = pal_212_schiffswache;
	condition = dia_pal_212_schiffswache_werseidihr_condition;
	information = dia_pal_212_schiffswache_werseidihr_info;
	description = "��� ��?";
};


func int dia_pal_212_schiffswache_werseidihr_condition()
{
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pal_212_schiffswache_werseidihr_info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WERSEIDIHR_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Pal_212_Schiffswache_WERSEIDIHR_08_01");	//�� �������� ������ ������ � ����� ������. ����� ��� ��� �������� ����������.
};


instance DIA_PAL_212_SCHIFFSWACHE_WASMACHSTDU2(C_INFO)
{
	npc = pal_212_schiffswache;
	condition = dia_pal_212_schiffswache_wasmachstdu2_condition;
	information = dia_pal_212_schiffswache_wasmachstdu2_info;
	description = "��� �� ������� �����?";
};


func int dia_pal_212_schiffswache_wasmachstdu2_condition()
{
	return TRUE;
};

func void dia_pal_212_schiffswache_wasmachstdu2_info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_15_00");	//��� �� ������� �����?
	if(MIS_SHIPISFREE == FALSE)
	{
		if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_01");	//���� �� ������� �� ���� �������. ��� ���, ��� ���� ����� �����.
		}
		else
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_02");	//�� ����� ����� �� ������. ����� �� ����� ������ �� ���� �������. �� � ��� �����. ������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_03");	//��-�� �����, ��� ��, ��� ���������� ������� ��� ����� �������. � �� �� ����� ���������� � ������ �������� � ������ ��������.
	};
	AI_StopProcessInfos(self);
};

