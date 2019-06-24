
instance DIA_SLD_7_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_sld_7_exit_condition;
	information = dia_sld_7_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sld_7_exit_condition()
{
	return TRUE;
};

func void dia_sld_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_7_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_sld_7_join_condition;
	information = dia_sld_7_join_info;
	permanent = TRUE;
	description = "� ���� �������������� � ���!";
};


func int dia_sld_7_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_sld_7_join_info()
{
	AI_Output(other,self,"DIA_SLD_7_JOIN_15_00");	//� ���� �������������� � ���!
	if(MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_7_JOIN_07_01");	//� ������, �� ������� � ���������. ����� ����, ��� ��, ����� ���!
	}
	else if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_7_JOIN_07_02");	//� �� ������ ���� ����� � �������� ����� �� ������� ��������, �� ���� ���� ����� ������� �� ���, � �� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_7_JOIN_07_03");	//��? ������� ������ ��������� �������, � ��� ���������!
	};
};


instance DIA_SLD_7_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_sld_7_people_condition;
	information = dia_sld_7_people_info;
	permanent = TRUE;
	description = "��� ��������� �����?";
};


func int dia_sld_7_people_condition()
{
	return TRUE;
};

func void dia_sld_7_people_info()
{
	AI_Output(other,self,"DIA_SLD_7_PEOPLE_15_00");	//��� ���������� �����?
	AI_Output(self,other,"DIA_SLD_7_PEOPLE_07_01");	//���� ��������� ��. ������ - ��� ������ ����. ����������� ������ ����������� ��� ��� �� ������ �������.
	AI_Output(self,other,"DIA_SLD_7_PEOPLE_07_02");	//� ��� ���� �������. �� ��������� � ��� �� ������ ������ ������ �������.
	AI_Output(self,other,"DIA_SLD_7_PEOPLE_07_03");	//��� ���� ���������� ������ ��������� ����� ���������, �� ������� �� ��� ���� �����. ��� ����� ����� �� ����������� �������.
	AI_Output(self,other,"DIA_SLD_7_PEOPLE_07_04");	//� ���� ������� ��� ��� ����� ���, ��� ��� ���� ������������, ���� ������������ � ���.
};


instance DIA_SLD_7_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_sld_7_location_condition;
	information = dia_sld_7_location_info;
	permanent = TRUE;
	description = "�������� ��� �� ���� �����.";
};


func int dia_sld_7_location_condition()
{
	return TRUE;
};

func void dia_sld_7_location_info()
{
	AI_Output(other,self,"DIA_SLD_7_LOCATION_15_00");	//�������� ��� �� ���� �����.
	AI_Output(self,other,"DIA_SLD_7_LOCATION_07_01");	//���� ����� ��� �������� ��� �������������.
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_SLD_7_LOCATION_07_02");	//��� ��� ���� �� ����� ���-������ ������� ��� ������ �������. � ���� ����� ������� ��������, �����?
	};
};


instance DIA_SLD_7_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_sld_7_standard_condition;
	information = dia_sld_7_standard_info;
	permanent = TRUE;
	description = "��� ������?";
};


func int dia_sld_7_standard_condition()
{
	return TRUE;
};

func void dia_sld_7_standard_info()
{
	AI_Output(other,self,"DIA_SLD_7_STANDARD_15_00");	//��� ����������?
	if(KAPITEL <= 2)
	{
		if(ENTEROW_KAPITEL2 == FALSE)
		{
			if(other.guild == GIL_SLD)
			{
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_01");	//� ��� ��� ��� �� ������������� � ���, �� ����� ��� �������� - ��������� ����� ������ �� ����������.
			}
			else
			{
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_02");	//����� ������. ����� ����������� � ������. � �����, ��� �������� �� �������� ��������������. (�������)
			};
		}
		else if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_03");	//������� � ������ ��������! �� ����� �� � ������ ��������� �� ����� ���������.
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_04");	//� �����, ������ ���� ����� ������ �������� ����� ��� ���,  ����� ��� �������� � ������� ������ ��-�� ��������.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_05");	//����� ��, ��������, �� ������ ���������� � ���������? ��� ��� ���� �� ������ ��� ��������� ������.
		};
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_06");	//�������� � �������� ����������� ��������� ����. ������� � ������. �� �� ��������� ����� ����� ������� � �������� ��� ��� �� �����.
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_07");	//�� ��� ����� �������� �� � ���������������, � ������ ����� ��� ����� ������������ ����...
			}
			else
			{
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_08");	//� �� ����, ������ �� ����� �������, �� ������ ���, ���� �� ���� �����.
			};
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_09");	//���� ������ � �������� ��� ����� �� ��������. ��������, ��� ��� �� ����� ������������ � ������� � ����� ����� �������.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_10");	//��� �� ����������� ������� � ��������? �, �����, � ���� �� ���� �����, �� ����� ���� �������, � ���� ��� ��������.
		};
	};
	if(KAPITEL == 4)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_11");	//� �����, �� ���� ���������� � ������. ������ � �������.
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_12");	//����� �� ��� �� ����� ������, ���� ������� ��������� � ������ ��������!
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_13");	//��� ������������ �������� - ������ ���� ������.
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_14");	//�� ���� ��� �� �������, ���� ������ �� �� ������� �������� ����� ������.
		};
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_SLD_7_STANDARD_07_15");	//��, � ������ �� ���� �������� ��� ���. ����, ��������, �������... � ���� ������� ������.
	};
};

func void b_assignambientinfos_sld_7(var C_NPC slf)
{
	dia_sld_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_sld_7_join.npc = Hlp_GetInstanceID(slf);
	dia_sld_7_people.npc = Hlp_GetInstanceID(slf);
	dia_sld_7_location.npc = Hlp_GetInstanceID(slf);
	dia_sld_7_standard.npc = Hlp_GetInstanceID(slf);
};

