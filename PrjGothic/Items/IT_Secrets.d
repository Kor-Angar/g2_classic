
instance ITSE_ERZFISCH(C_ITEM)
{
	name = "����-���";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_erzfisch;
	description = name;
	text[2] = "� ���� ���� ���-�� ��������.";
};


func void use_erzfisch()
{
	CreateInvItems(hero,itmi_nugget,1);
	Print(PRINT_FOUNDORENUGGET);
};


instance ITSE_GOLDFISCH(C_ITEM)
{
	name = "������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_goldfisch;
	description = name;
	text[2] = "� ���� ���� ���-�� ��������.";
};


func void use_goldfisch()
{
	CreateInvItems(hero,itmi_gold,50);
	Print(PRINT_FOUNDGOLD50);
	Snd_Play("Geldbeutel");
};


instance ITSE_RINGFISCH(C_ITEM)
{
	name = "��������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_ringfisch;
	description = name;
	text[2] = "� ���� ���� ���-�� ��������.";
};


func void use_ringfisch()
{
	CreateInvItems(hero,itri_prot_fire_01,1);
	Print(PRINT_FOUNDRING);
};


instance ITSE_LOCKPICKFISCH(C_ITEM)
{
	name = "������ ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_lockpickfisch;
	description = name;
	text[2] = "� ���� ���� ���-�� ��������.";
};


func void use_lockpickfisch()
{
	CreateInvItems(hero,itke_lockpick,3);
	Print(PRINT_FOUNDLOCKPICK);
};


instance ITSE_GOLDPOCKET25(C_ITEM)
{
	name = "������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = goldpocket25;
	description = "������� �������.";
	text[0] = "";
	text[1] = "";
	text[2] = "������ ����������� ��������� �����.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void goldpocket25()
{
	CreateInvItems(hero,itmi_gold,25);
	Print(PRINT_FOUNDGOLD25);
	Snd_Play("Geldbeutel");
};


instance ITSE_GOLDPOCKET50(C_ITEM)
{
	name = "������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = goldpocket50;
	description = "������� �������.";
	text[0] = "";
	text[1] = "";
	text[2] = "���� ������� ����� �����.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void goldpocket50()
{
	CreateInvItems(hero,itmi_gold,50);
	Print(PRINT_FOUNDGOLD50);
	Snd_Play("Geldbeutel");
};


instance ITSE_GOLDPOCKET100(C_ITEM)
{
	name = "������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = goldpocket100;
	description = "������� �������.";
	text[0] = "";
	text[1] = "";
	text[2] = "������� �������,";
	text[3] = "������ ������� �����.";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void goldpocket100()
{
	CreateInvItems(hero,itmi_gold,100);
	Print(PRINT_FOUNDGOLD100);
	Snd_Play("Geldbeutel");
};


instance ITSE_HANNASBEUTEL(C_ITEM)
{
	name = "������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = hannasbeutel;
	description = "������� �������.";
	text[0] = "";
	text[1] = "";
	text[2] = "��� ���� ��� �����.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void hannasbeutel()
{
	CreateInvItems(hero,itke_lockpick,10);
	CreateInvItems(hero,itke_thieftreasure,1);
	Print(print_hannasbeutel);
};

