
const int VALUE_FACKEL = 2;

instance ITLSTORCH(C_ITEM)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH | ITEM_MULTI;
	value = VALUE_FACKEL;
	visual = "ItLs_Torch_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[3] = "�����.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITLSTORCHBURNING(C_ITEM)
{
	name = "������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH;
	value = 0;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	description = name;
	text[3] = "�����.";
};

instance ITLSTORCHBURNED(C_ITEM)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH | ITEM_MULTI;
	value = 0;
	visual = "ItLs_Torchburned_01.3ds";
	material = MAT_WOOD;
	text[3] = "��������� �����.";
	description = name;
};

instance ITLSTORCHFIRESPIT(C_ITEM)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH;
	value = 1;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	scemename = "FIRESPIT";
	description = name;
	text[4] = NAME_VALUE;
	count[4] = value;
};

