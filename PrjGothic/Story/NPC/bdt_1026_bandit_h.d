
instance BDT_1026_BANDIT_H(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1026;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fatbald",FACE_N_NORMAL14,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	start_aistate = zs_bandit;
};

