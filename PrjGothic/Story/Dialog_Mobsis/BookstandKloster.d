
func void use_bookstand_rune_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"�������� 1");
		Doc_PrintLine(ndocid,0,"������ �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"�������� 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_rune_02_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"�������� 1");
		Doc_PrintLine(ndocid,0,"���� � �����������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"�������� 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"�������� 1");
		Doc_PrintLine(ndocid,0,"������ ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"�������� 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_02_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"�������� 1");
		Doc_PrintLine(ndocid,0,"�������� ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"�������� 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������ ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"���� ������� ����� � ����������� ��� �� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����:");
		Doc_PrintLine(ndocid,0,"- ������� ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ������:");
		Doc_PrintLine(ndocid,0,"- ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ������:");
		Doc_PrintLine(ndocid,0,"- ������ ��������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ������� �������:");
		Doc_PrintLine(ndocid,0,"- ����� �������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ������ �������:");
		Doc_PrintLine(ndocid,0,"- �������� �����");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_02_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������ ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"���� ������� ����� � ����������� ��� �� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ���:");
		Doc_PrintLine(ndocid,0,"- �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ������:");
		Doc_PrintLine(ndocid,0,"- ������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� �����:");
		Doc_PrintLine(ndocid,0,"- ����� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� �����:");
		Doc_PrintLine(ndocid,0,"- �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"���:");
		Doc_PrintLine(ndocid,0,"- �������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_03_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������ ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"���� �������� ����� � ����������� ��� �� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ������� �������:");
		Doc_PrintLine(ndocid,0,"- �������� ��������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� �������� ����:");
		Doc_PrintLine(ndocid,0,"- �����");
		Doc_PrintLine(ndocid,0,"- ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� �������:");
		Doc_PrintLine(ndocid,0,"- ����� �������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�����:");
		Doc_PrintLine(ndocid,0,"- ������ ���������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ����:");
		Doc_PrintLine(ndocid,0,"- ������� �����");
		Doc_PrintLine(ndocid,0,"- ���������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ������:");
		Doc_PrintLine(ndocid,0,"- ������ ��������");
		Doc_PrintLine(ndocid,0,"- ����");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_04_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"��������� ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"���� ���������� ����� � ����������� ��� �� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� �������� ���:");
		Doc_PrintLine(ndocid,0,"- ����");
		Doc_PrintLine(ndocid,0,"- �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������:");
		Doc_PrintLine(ndocid,0,"- ������ ��������");
		Doc_PrintLine(ndocid,0,"- ������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ������:");
		Doc_PrintLine(ndocid,0,"- ������ ��������� ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����������� ������:");
		Doc_PrintLine(ndocid,0,"- ������ ����");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_05_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"���� ������ ����� � ����������� ��� �� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� �����:");
		Doc_PrintLine(ndocid,0,"- ������� �����");
		Doc_PrintLine(ndocid,0,"- ���������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� �������� ����:");
		Doc_PrintLine(ndocid,0,"- ����");
		Doc_PrintLine(ndocid,0,"- �������� ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ������:");
		Doc_PrintLine(ndocid,0,"- ������ ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ������� �������:");
		Doc_PrintLine(ndocid,0,"- �������� ������");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_06_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������ ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"���� ������� ����� � ����������� ��� �� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� �����:");
		Doc_PrintLine(ndocid,0,"- �����");
		Doc_PrintLine(ndocid,0,"- ����");
		Doc_PrintLine(ndocid,0,"- �������� ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ������:");
		Doc_PrintLine(ndocid,0,"- �����");
		Doc_PrintLine(ndocid,0,"- ������ ���������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ������:");
		Doc_PrintLine(ndocid,0,"- ����� �������");
		Doc_PrintLine(ndocid,0,"- ������ ���������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ����:");
		Doc_PrintLine(ndocid,0,"- ����� �������");
		Doc_PrintLine(ndocid,0,"- ������ ���������");
		Doc_PrintLine(ndocid,0,"- ������ ��������� ������");
		Doc_PrintLine(ndocid,0,"- ������ ������");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"���������� �������:");
		Doc_PrintLine(ndocid,1,"- ����� �������");
		Doc_PrintLine(ndocid,1,"- ���� ������");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_rules_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"�������� 1");
		Doc_PrintLine(ndocid,0,"�������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"�������� 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

