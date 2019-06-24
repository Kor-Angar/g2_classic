
instance DIA_DAR_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_exit_condition;
	information = dia_dar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_dar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_HALLO(C_INFO)
{
	npc = sld_810_dar;
	nr = 1;
	condition = dia_dar_hallo_condition;
	information = dia_dar_hallo_info;
	permanent = FALSE;
	description = "��� �� ������?";
};


func int dia_dar_hallo_condition()
{
	return TRUE;
};

func void dia_dar_hallo_info()
{
	AI_Output(other,self,"DIA_Dar_Hallo_15_00");	//��� �� ������?
	AI_Output(self,other,"DIA_Dar_Hallo_03_01");	//������ ����������?
	Info_ClearChoices(dia_dar_hallo);
	Info_AddChoice(dia_dar_hallo,"���.",dia_dar_hallo_nein);
	Info_AddChoice(dia_dar_hallo,"�������.",dia_dar_hallo_ja);
};

func void dia_dar_hallo_ja()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_00");	//�������.
	CreateInvItem(other,itmi_joint);
	b_useitem(other,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_01");	//�������, ��?
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_02");	//��� �� ���� ��� �����?
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_03");	//(����������) � ���� ���� ���������.
	Info_ClearChoices(dia_dar_hallo);
};

func void dia_dar_hallo_nein()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Nein_15_00");	//���.
	Info_ClearChoices(dia_dar_hallo);
};


var int dar_einmal;

instance DIA_DAR_PERM(C_INFO)
{
	npc = sld_810_dar;
	nr = 2;
	condition = dia_dar_perm_condition;
	information = dia_dar_perm_info;
	permanent = TRUE;
	description = "�� ���������� ���-������ ����� ����?";
};


func int dia_dar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_hallo))
	{
		return TRUE;
	};
};

func void dia_dar_perm_info()
{
	AI_Output(other,self,"DIA_Dar_PERM_15_00");	//�� ���������� ���-������ ����� ����?
	if((DAR_LOSTAGAINSTCIPHER == TRUE) && (DAR_EINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_01");	//(�������������) ������ � �������� ������ ����������� �������� ���������� ������ ��� �������...
		DAR_EINMAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_02");	//�� �� ������.
	};
};


instance DIA_DAR_WANNAJOIN(C_INFO)
{
	npc = sld_810_dar;
	nr = 3;
	condition = dia_dar_wannajoin_condition;
	information = dia_dar_wannajoin_info;
	permanent = FALSE;
	description = "� ���� �������������� � ���������. �� �� ����������?";
};


func int dia_dar_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_hallo) && (other.guild == GIL_NONE) && (DAR_LOSTAGAINSTCIPHER == FALSE))
	{
		return TRUE;
	};
};

func void dia_dar_wannajoin_info()
{
	AI_Output(other,self,"DIA_Dar_WannaJoin_15_00");	//� ���� �������������� � ���������. �� �� ����������?
	AI_Output(self,other,"DIA_Dar_WannaJoin_03_01");	//��� ��� �����.
};


instance DIA_DAR_DUDIEB(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_dudieb_condition;
	information = dia_dar_dudieb_info;
	permanent = FALSE;
	description = "����� ������ ���, ��� ���-�� ����� � ���� ��� �������� �����...";
};


func int dia_dar_dudieb_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat) && (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dar_dudieb_info()
{
	AI_Output(other,self,"DIA_Dar_DuDieb_15_00");	//����� ������ ���, ��� ���-�� ����� � ���� ��� �������� �����...
	AI_Output(self,other,"DIA_Dar_DuDieb_03_01");	//(������� ��������� ������������ ������)
	AI_Output(other,self,"DIA_Dar_DuDieb_15_02");	//�� ������ �� ������ �� ����?
	AI_Output(self,other,"DIA_Dar_DuDieb_03_03");	//(����� �������) ���.
	DAR_VERDACHT = TRUE;
};


instance DIA_DAR_WOPAKET(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_wopaket_condition;
	information = dia_dar_wopaket_info;
	permanent = TRUE;
	description = "��� ���?";
};


func int dia_dar_wopaket_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_dudieb) && (DAR_DIEB == FALSE) && (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dar_wopaket_info()
{
	AI_Output(other,self,"DIA_Dar_WoPaket_15_00");	//(���������) ��� ���?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_01");	//������, ������, ������. � ������ ��� ������-�� ������ � ������.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_02");	//��� ���� � ������. � �� �����, ��� �� ��������.
		AI_Output(other,self,"DIA_Dar_WoPaket_15_03");	//�����, ���� ����� ��� ���� ������� ��������?
		AI_Output(self,other,"DIA_Dar_WoPaket_03_04");	//���� ������, � ��� ���������� � ����. � ���������� �� �����������, ��� ���� ������ ��������.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_05");	//��� ���� � ������ ����� �����������������. ��� ���, ��� � �����.
		DAR_DIEB = TRUE;
		b_logentry(TOPIC_CIPHERPAKET,"��� �������, ��� ����� ��� � ������. �� ������ �� � �������� �������� ��������, ����� �����������������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_06");	//��� � ���� �����?
	};
};


instance DIA_DAR_AUFSMAUL(C_INFO)
{
	npc = sld_810_dar;
	nr = 5;
	condition = dia_dar_aufsmaul_condition;
	information = dia_dar_aufsmaul_info;
	permanent = FALSE;
	description = "� ������ ��� ���������� �� ����!";
};


func int dia_dar_aufsmaul_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_dudieb) && (DAR_DIEB == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST))
	{
		return TRUE;
	};
};

func void dia_dar_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Dar_AufsMaul_15_00");	//� ������ ��� ���������� �� ����!
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_01");	//����������. � ������� ���������, ����� ������� � �����!
	b_giveinvitems(self,other,itmi_joint,1);
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_02");	//���, ��������!
};


instance DIA_DAR_KAMERADENSCHWEIN(C_INFO)
{
	npc = sld_810_dar;
	nr = 1;
	condition = dia_dar_kameradenschwein_condition;
	information = dia_dar_kameradenschwein_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dar_kameradenschwein_condition()
{
	if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		self.aivar[AIV_LASTFIGHTCOMMENT] = FALSE;
		return true;
	};
};

func void dia_dar_kameradenschwein_info()
{
	AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_00");	//������! �� ������ ������, ��� � ���� ��� �����!
	if(Npc_KnowsInfo(other,dia_dar_wannajoin) && (other.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_01");	//� �� �� ��� �� ���������� �� ����.
	};
};


instance DIA_DAR_PILZTABAK(C_INFO)
{
	npc = sld_810_dar;
	nr = 6;
	condition = dia_dar_pilztabak_condition;
	information = dia_dar_pilztabak_info;
	permanent = FALSE;
	description = "�� �����-������ �������� ������� �����?";
};


func int dia_dar_pilztabak_condition()
{
	if(Npc_HasItems(other,itmi_pilztabak) > 0)
	{
		return TRUE;
	};
};

func void dia_dar_pilztabak_info()
{
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_00");	//�� �����-������ �������� ������� �����?
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_01");	//������ ���������. ��� ��� ����.
	b_giveinvitems(other,self,itmi_pilztabak,1);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_02");	//���, ���������...
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_03");	//�� �����-������ ����� ��� ���?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_04");	//��...
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_05");	//����� ��� ���?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_06");	//��� ���� �������...
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_07");	//��, ����!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_08");	//������ �����!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_09");	//��� ������ ������� ������! ���� � �� ������� ���������!
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_DAR_KAP3_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap3_exit_condition;
	information = dia_dar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_dar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_KAP4_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap4_exit_condition;
	information = dia_dar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_dar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_ORCRING(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_orcring_condition;
	information = dia_dar_orcring_info;
	description = "������, ����� ��������� �������.";
};


func int dia_dar_orcring_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_dar_orcring_info()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_15_00");	//������, ����� ��������� �������.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_01");	//�������. ��� ���. ������� ������ ����� ������, � �� ���� � ����� �������� �����.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_02");	//��� �������. � ���� ����� ������ ������ �������� ���� � ��������� �������� ��. ��� ����� ����� ������� ���-������ �������.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_03");	//���� � ����� �������� ��������������, ��� ������������� ������ ������, ��������, � ���� ����� ����� ����� �� �������������� ��.
	Info_ClearChoices(dia_dar_orcring);
	Info_AddChoice(dia_dar_orcring,"���� ��� �� ����������.",dia_dar_orcring_no);
	Info_AddChoice(dia_dar_orcring,"������ ������? ��?",dia_dar_orcring_necken);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice(dia_dar_orcring,"��� ��� ������ ���������?",dia_dar_orcring_wie);
	};
};

func void dia_dar_orcring_necken()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_15_00");	//������ ������? ��?
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_01");	//(������) ��, �����, ��������. ��-�� ������ ��� �����?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_02");	//�����-�� ������� ���������� �� ������. ���� ������ ������ �� ������.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_03");	//�� ����� ����� ���� ���� � ��� ������ ��� ���� �������.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_04");	//���� �� ������ �������� ���� ����� ���������� �����? ������ �� ����.
	};
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_05");	//� ����, ���� ��������, ��������� ���� ����� - ������ ��, ��� ��� �����, ����� ��������� �������� �� � ��� ������.
		Info_ClearChoices(dia_dar_orcring);
		Info_AddChoice(dia_dar_orcring,"� ���� ��� ������� �� ��� ����.",dia_dar_orcring_necken_no);
		Info_AddChoice(dia_dar_orcring,"�����. ��������.",dia_dar_orcring_necken_schlagen);
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_06");	//�� �������. � ����� ������ ���������� ����������� �� ��.
	};
};


var int dar_fightagainstpaladin;

func void dia_dar_orcring_necken_schlagen()
{
	DAR_FIGHTAGAINSTPALADIN = TRUE;
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_schlagen_15_00");	//�����. ��������.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_schlagen_03_01");	//��, � �� ���� �����.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_dar_orcring_necken_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_no_15_00");	//� ���� ��� ������� �� ��� ����.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_no_03_01");	//�, ��. �� �� ������ ����������, ��� � ��� ������. ����. � �����, ��� � ���� ������ ��������.
	AI_StopProcessInfos(self);
};

func void dia_dar_orcring_wie()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_wie_15_00");	//��� ��� ������ ���������?
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_01");	//� �� ���� �����. �����-������ ������ ����� ������ ������� ��.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_02");	//���-������ ����� ������� ������ �����, �� ��� ���-�� �����. �����, ���������� ������� ��� ������, ��, �� �����.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_03");	//� �� ����� ���������� ����������� ��� �����. ��� ��������.
	Log_CreateTopic(TOPIC_DAR_BRINGORCELITERING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DAR_BRINGORCELITERING,LOG_RUNNING);
	b_logentry(TOPIC_DAR_BRINGORCELITERING,"��� ����� ����� ������ ������ � ����� ���������. �� ����� ���������� ������ �����. �����, ���������� �������, ������, ��� ��� ���-������.");
	MIS_DAR_BRINGORCELITERING = LOG_RUNNING;
	Info_ClearChoices(dia_dar_orcring);
};

func void dia_dar_orcring_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_no_15_00");	//���� ��� �� ����������.
	AI_Output(self,other,"DIA_Dar_ORCRING_no_03_01");	//(������) ������� ���. � �� ����� ��������, ���� �� ��� ���� �� ���.
	Info_ClearChoices(dia_dar_orcring);
};


instance DIA_DAR_FIGHTAGAINSTPALOVER(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_fightagainstpalover_condition;
	information = dia_dar_fightagainstpalover_info;
	important = TRUE;
};


func int dia_dar_fightagainstpalover_condition()
{
	if((DAR_FIGHTAGAINSTPALADIN == TRUE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_dar_fightagainstpalover_info()
{
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_00");	//������, � ����, ��� �� �� �������� ����������, ���� � ����� �������� � �����.
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_01");	//� �� ���� �������� ���� ����� ������. ��� ��� ������� �� ����, ������?
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_DAR_BRINGORCELITERING(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_bringorcelitering_condition;
	information = dia_dar_bringorcelitering_info;
	description = "� ������ ������ �����, ������� �� �����.";
};


func int dia_dar_bringorcelitering_condition()
{
	if((MIS_DAR_BRINGORCELITERING == LOG_RUNNING) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && Npc_HasItems(other,itri_orcelitering))
	{
		return TRUE;
	};
};

func void dia_dar_bringorcelitering_info()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_00");	//� ������ ������ �����, ������� �� �����.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_01");	//��� �� ��� ������ ���?
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_02");	//������ ������������ �����.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_03");	//�� ��, � ����� ������... ��� �� ������ �� ����?
	MIS_DAR_BRINGORCELITERING = LOG_SUCCESS;
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"��� �� ������ ���������� ���?",dia_dar_bringorcelitering_was);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(dia_dar_bringorcelitering,"������� ��� �������.",dia_dar_bringorcelitering_geld);
	};
};

func void dia_dar_bringorcelitering_geld()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_00");	//������� ��� �������.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_01");	//���. 600 ������� �����?
		AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_02");	//���?
	};
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_03");	//�����. � ��� ���� 1200 �����.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_04");	//������� �� ��� ������ ���� ��� ������.
	};
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"����� ������������.",dia_dar_bringorcelitering_geld_no);
	Info_AddChoice(dia_dar_bringorcelitering,"������������.",dia_dar_bringorcelitering_geld_ok);
};

func void dia_dar_bringorcelitering_geld_ok()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_ok_15_00");	//������������. ����� ������.
	b_giveinvitems(other,self,itri_orcelitering,1);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_ok_03_01");	//�������. �� �������� ��������, ��� ������ ������ �� ����.
	CreateInvItems(self,itmi_gold,1200);
	b_giveinvitems(self,other,itmi_gold,1200);
	b_giveplayerxp(XP_DAR_BRINGORCELITERING);
	Info_ClearChoices(dia_dar_bringorcelitering);
};

func void dia_dar_bringorcelitering_geld_no()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_no_15_00");	//����� ������������.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_no_03_01");	//� � �����, ��� ��� ������� �����. ���� ������ �� �������� ���. �� ���� �������.
	Info_ClearChoices(dia_dar_bringorcelitering);
};

func void dia_dar_bringorcelitering_was()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_15_00");	//��� �� ������ ���������� ���?
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_01");	//���� ������� ������, ���� ���� ������, ������� �... ��, ������, �������� �������.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_02");	//�� ������� ���� ��������. � ��� ��������� ���.
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"������� ��� �������.",dia_dar_bringorcelitering_geld);
	Info_AddChoice(dia_dar_bringorcelitering,"����� ��� ������.",dia_dar_bringorcelitering_was_am);
};

func void dia_dar_bringorcelitering_was_am()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_am_15_00");	//����� ��� ������.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_01");	//�������. ����� �� �������� ���� �������. ������ ����� ��� ��� ������.
	b_giveinvitems(other,self,itri_orcelitering,1);
	CreateInvItems(self,itam_dex_01,1);
	b_giveinvitems(self,other,itam_dex_01,1);
	b_giveplayerxp(XP_DAR_BRINGORCELITERING);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_02");	//������ � ��������.
	Info_ClearChoices(dia_dar_bringorcelitering);
};


instance DIA_DAR_KAP5_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap5_exit_condition;
	information = dia_dar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_dar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_KAP6_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap6_exit_condition;
	information = dia_dar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_dar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_PICKPOCKET(C_INFO)
{
	npc = sld_810_dar;
	nr = 900;
	condition = dia_dar_pickpocket_condition;
	information = dia_dar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_dar_pickpocket_condition()
{
	return c_beklauen(67,35);
};

func void dia_dar_pickpocket_info()
{
	Info_ClearChoices(dia_dar_pickpocket);
	Info_AddChoice(dia_dar_pickpocket,DIALOG_BACK,dia_dar_pickpocket_back);
	Info_AddChoice(dia_dar_pickpocket,DIALOG_PICKPOCKET,dia_dar_pickpocket_doit);
};

func void dia_dar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dar_pickpocket);
};

func void dia_dar_pickpocket_back()
{
	Info_ClearChoices(dia_dar_pickpocket);
};

