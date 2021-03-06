
instance BDT_1064_BANDIT_L(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1064;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_B_NORMAL_ORIK,BODYTEX_B,itar_leather_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1064;
};


func void rtn_start_1064()
{
	ta_sit_campfire(0,0,12,0,"NW_CASTLEMINE_TOWER_BEYOND");
	ta_sit_campfire(12,0,0,0,"NW_CASTLEMINE_TOWER_BEYOND");
};

