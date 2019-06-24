
instance DIA_DRAGON_FIRE_ISLAND_EXIT(C_INFO)
{
	npc = dragon_fire_island;
	nr = 999;
	condition = dia_dragon_fire_island_exit_condition;
	information = dia_dragon_fire_island_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_fire_island_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_island_exit_info()
{
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_FIRE_ISLAND_HELLO(C_INFO)
{
	npc = dragon_fire_island;
	nr = 5;
	condition = dia_dragon_fire_island_hello_condition;
	information = dia_dragon_fire_island_hello_info;
	important = TRUE;
};


func int dia_dragon_fire_island_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_island_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_00");	//����, �������. ��� ��� ������� ������� ���, ��� ������ ���� ����� � ����� ����� ������ ����.
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_01");	//��? ���� �� ������ �������, ��, ���������� ���?
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_02");	//���� ������������ ����, ��� �� ��������� ����� ���� ����� ���������?
	};
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_03");	//�� ����� ������� ����� ��� ���� ��������, � �� ��������� �� ���.
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_04");	//� ����� ��������� ��������� �� ��������� �� ������ ���������� �������.
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_05");	//��-�. � � �������� ������������� ����� ���� ������.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_06");	//������ ������� ��������� ������. ����� �������� � ����.
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_07");	//�� ����� ������� ������, ������ �����������, �� ���� �� ���� ������ �����.
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_HALLENVONIRDORATH,"��� ���� �������� ������. � ��� �� ����� ��� ����� �������. ��� ����� ���� ����� ����������� ����� ��������, ��� ����� �� ���� �������� ��������.");
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};

