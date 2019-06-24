
func void b_assigndementortalk_ritual()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	if(MIS_SCKNOWSINNOSEYEISBROKEN == FALSE)
	{
		AI_Output(self,other,"DIA_RitualDementor_19_00");	//�� ������ ������� ������.
		AI_Output(self,other,"DIA_RitualDementor_19_01");	//�� ���������� ���� ������, � ������ ��� ������� �� ������� ����� ����.
		AI_Output(self,other,"DIA_RitualDementor_19_02");	//������ �� ���������������� ��� ��������� ����� ������� ������� ����� �������.
		MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
		b_logentry(TOPIC_INNOSEYE,"��� ������ ������ ��������� ��� �� �����. ��� ��������� ���� ������. � ������ � �� ����, ��� ��� �������� ���.");
		b_logentry(TOPIC_TRAITORPEDRO,"� ����� ���� ������. �� ���-�� ����� �� ����� �����. ��� ������ ���� � ������� � ���.");
		b_giveplayerxp(XP_SCKNOWSINNOSEYEISBROKEN);
	}
	else
	{
		randy = Hlp_Random(4);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_03");	//���������� ���� ����!
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_04");	//�� �������!
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_05");	//���� ����� �� ��������.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_06");	//�� ����� ����.
		};
	};
	Npc_SetRefuseTalk(self,30);
};

func void b_assigndementortalk_ritual_exit()
{
	Wld_StopEffect("DEMENTOR_FX");
	b_scisobsessed(self);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	Snd_Play("MFX_FEAR_CAST");
	self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

