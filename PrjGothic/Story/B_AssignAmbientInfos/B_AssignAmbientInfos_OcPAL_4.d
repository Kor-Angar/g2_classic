
instance DIA_OCPAL_4_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocpal_4_exit_condition;
	information = dia_ocpal_4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocpal_4_exit_condition()
{
	return TRUE;
};

func void dia_ocpal_4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_4_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocpal_4_people_condition;
	information = dia_ocpal_4_people_info;
	permanent = TRUE;
	description = "��� ��������� �����?";
};


func int dia_ocpal_4_people_condition()
{
	return TRUE;
};

func void dia_ocpal_4_people_info()
{
	AI_Output(other,self,"DIA_OCPAL_4_PEOPLE_15_00");	//��� ��������� �����?
	AI_Output(self,other,"DIA_OCPAL_4_PEOPLE_04_01");	//����������� ������. �� ������� ��� � ����� ������� ������ �����.
};


instance DIA_OCPAL_4_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocpal_4_location_condition;
	information = dia_ocpal_4_location_info;
	permanent = TRUE;
	description = "��� �� ������ ���������� ��� � ������ ��������?";
};


func int dia_ocpal_4_location_condition()
{
	return TRUE;
};

func void dia_ocpal_4_location_info()
{
	AI_Output(other,self,"DIA_OCPAL_4_LOCATION_15_00");	//��� �� ������ ���������� ��� � ������ ��������?
	AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_01");	//��������� � ����, ����� ���� ��������� ����, ���� ��� ��� �� ��������� ������.
	AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_02");	//���������, ���������� � ������, - ��� � �������� ����������, �� ����� ��� ����� ���� ��������� ���������.
};


instance DIA_OCPAL_4_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocpal_4_standard_condition;
	information = dia_ocpal_4_standard_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_ocpal_4_standard_condition()
{
	return TRUE;
};

func void dia_ocpal_4_standard_info()
{
	AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//��� ����?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_01");	//���� �������� ���! �� �� ����� ����������� �� ���������� ��������! � ����� ������� ��� ������ ��������!
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_02");	//� �����, ����� ����� �� �������� ���� ����� �����. � ��� �� ��� ������� ������������?
			if(other.guild == GIL_DJG)
			{
				AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_03");	//�������, ��� �� �� ������� �������, ��� � ���, �������� �� ��������, ������������� ���� ���� ������ ���� ��������?
			}
			else
			{
				AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_04");	//��� ��� ���������� �������� �� �������� ���� �� ��� ��������!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_05");	//����� ������! ��� ��������� ����� ���� ����������!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_06");	//������ ��������, ������, �� ��������� ������� ����������� �� �����. � ������, �� ��� ������, ��� �� ������? ��� �����-�� �����������!
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_07");	//��� ������� ������ ���������. ���� ������ � �����, � ����� �� ��������� ��.
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_08");	//���-�� ������ �������� ����� ������. �� ����� ����� � ������.
		};
	};
};

func void b_assignambientinfos_ocpal_4(var C_NPC slf)
{
	dia_ocpal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_standard.npc = Hlp_GetInstanceID(slf);
};

