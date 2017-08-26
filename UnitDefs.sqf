/*
Unit definition:
[UniqueId, Name, Name (Plural), Rank, Faction, "Identity range",Equipment, Skills]
Equipment:
[
  BaseClass,
  [Uniforms (randomized for the irregular look)],
  [Vest],
  [Backpack],
  [Headgear],
  [Goggles],
  [Binos],
  [NVG],
  [ [Mag 1,count], [Mag 2, count], ... ] (Uniform mags),

  [PrimaryWeapon,[attachments]],
  [SecondaryWeapon,[attachments]],
  [Launcher,[attachments]],
  [Items,...] // Map, compass, watch and radio are all default
]
Skills:
[
  Leadership,             // useful for players for party size
  Firearms proficiency,   // useful for players in that it allows them to use better weapons
  Spotting,               // useful for players on the map
]
*/
UnitDefs =
[
  // 0
  ["player","Player", "Player", "PRIVATE", "Player Faction", "Altis",
    [
      "C_man_casual_1_F",
      ["U_C_Poor_2"],
      ["V_BandollierB_cbr"],
      [],
      [],
      [],
      [],
      [],
      [["30Rnd_762x39_Mag_F",8], ["9Rnd_45ACP_Mag",4]],
      ["arifle_AKM_F",[]],
      ["hgun_ACPC2_F",[]],
      ["NULL",[]],
      []
    ],
    [0,0,0]
  ],
  ["altis_i1", "Altian Militia Recruit", "Altian Militia Recruits", "PRIVATE", "Altian Locals", "Altis",
    [
      "C_man_casual_1_F",
      ["U_C_man_casual_1_F", "U_C_man_casual_2_F", "U_C_man_casual_3_F",
       "U_BG_Guerilla2_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_3"],
      ["V_Rangemaster_Belt"],
      [],
      [],
      [],
      [],
      [],
      [["10Rnd_9x21_Mag",8]],
      ["NULL",[]],
      ["hgun_Pistol_01_f",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [1,1,1]
  ],
  ["altis_i2","Altian Militia Trainee", "Altian Militia Trainees", "PRIVATE", "Altian Locals", "Altis",
    [
      "C_man_casual_1_F",
      ["U_C_man_casual_1_F", "U_C_man_casual_2_F", "U_C_man_casual_3_F",
       "U_BG_Guerilla2_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_3"],
      ["V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli",
       "V_TacChestRig_cbr_F","V_TacChestRig_grn_F","V_TacChestRig_oli_F",
       "V_ChestRig_rgr","V_ChestRig_khk","V_ChestRig_oli"],
      [],
      [],
      [],
      [],
      [],
      [["30Rnd_762x39_Mag_F",6],["10Rnd_9x21_Mag",2]],
      ["arifle_AKM_F",[]],
      ["hgun_Pistol_01_f",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [2,2,2]
  ],
  ["altis_i3","Altian Militiaman", "Altian Militiamen", "CORPORAL", "Altian Locals", "Altis",
    [
      "C_man_casual_1_F",
      ["U_BG_Guerilla2_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_3"],
      ["V_TacVest_blk", "V_TacVest_brn", "V_TacVest_camo", "V_TacVest_khk", "V_TacVest_oli"],
      [],
      ["H_Booniehat_khk_hs"],
      [],
      [],
      [],
      [["30Rnd_762x39_Mag_F",6],["10Rnd_9x21_Mag",2]],
      ["arifle_AKM_F",[]],
      ["hgun_Pistol_01_f",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [3,3,3]
  ],
  ["altis_s3","Altian Marksman", "Altian Marksmen", "CORPORAL", "Altian Locals", "Altis",
    [
      "C_man_casual_1_F",
      ["U_BG_Guerilla2_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_3"],
      ["V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli"],
      [],
      ["H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_camo","H_Watchcap_khk"],
      [],
      [],
      [],
      [["20Rnd_762x51_Mag",6],["10Rnd_9x21_Mag",2]],
      ["srifle_DMR_06_olive_F",["optic_MRCO"]],
      ["hgun_Pistol_01_f",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [3,3,3]
  ],
  ["altis_i4","Altian Veteran Militiaman", "Altian Veteran Militiamen", "SERGEANT", "Altian Locals", "Altis",
    [
      "C_man_casual_1_F",
      ["U_BG_Guerilla2_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_3"],
      ["V_TacVest_blk", "V_TacVest_brn", "V_TacVest_camo", "V_TacVest_khk", "V_TacVest_oli"],
      [],
      ["H_Booniehat_khk_hs"],
      [],
      [],
      [],
      [["30Rnd_762x39_Mag_F",6],["10Rnd_9x21_Mag",2]],
      ["arifle_AK12_F",["optic_MRCO"]],
      ["hgun_Pistol_01_f",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [4,4,4]
  ],
  ["altis_s4","Altian Veteran Marksman", "Altian Veteran Marksmen", "SERGEANT", "Altian Locals", "Altis",
    [
      "C_man_casual_1_F",
      ["U_BG_Guerilla2_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_3"],
      ["V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli"],
      [],
      ["H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_camo","H_Watchcap_khk"],
      [],
      [],
      [],
      [["20Rnd_762x51_Mag",6],["10Rnd_9x21_Mag",2]],
      ["srifle_DMR_06_camo_F",["optic_SOS_khk_F"]],
      ["hgun_Pistol_01_f",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [4,4,4]
  ],
  ["nato_i1", "NATO Recruit", "NATO Recruits", "PRIVATE", "NATO", "US",
    [
      "B_Soldier_F",
      ["U_B_ComabtUniform_mcam_tshirt"],
      ["V_Rangemaster_Belt"],
      [],
      [],
      [],
      [],
      [],
      [["16Rnd_9x21_Mag",8]],
      ["NULL",[]],
      ["hgun_P07_f",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [1,1,1]
  ],
  ["nato_i2", "NATO Private", "NATO Privates", "PRIVATE", "NATO", "US",
    [
      "B_Soldier_F",
      ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt"],
      ["V_PlateCarrier1_rgr"],
      [],
      [],
      [],
      [],
      [],
      [["30Rnd_65x39_caseless_mag",6],["16Rnd_9x21_Mag",2]],
      ["arifle_MX_f",[]],
      ["hgun_P07_f",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [2,2,2]
  ],
  ["csat_i1","CSAT Recruit", "CSAT Recruits", "PRIVATE", "CSAT", "Iran",
    [
      "O_survivor_F",
      ["U_O_CombatUniform_ocamo"],
      ["V_Rangemaster_Belt"],
      [], 
      [],
      [],
      [],
      [],
      [["16Rnd_9x21_Mag",8]],
      ["NULL",[]],
      ["hgun_Rook40_F",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [1,1,1]
  ],
  ["csat_i2","CSAT Private", "CSAT Privates", "PRIVATE", "CSAT", "Iran",
    [
      "O_survivor_F",
      ["U_O_CombatUniform_ocamo"],
      ["V_HarnessO_brn"],
      [], 
      [],
      [],
      [],
      [],
      [["30Rnd_65x39_caseless_green",6],["16Rnd_9x21_Mag",2]],
      ["arifle_Katiba_F",[]],
      ["NULL",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [2,2,2]
  ],
  ["csat_i7","CSAT Operator", "CSAT Operators", "CAPTAIN", "CSAT", "Iran",
    [
      "O_recon_F",
      ["U_O_V_Soldier_Viper_hex_F"],
      [],
      ["B_ViperHarness_hex_M_F"],
      ["H_HelmetO_ViperSP_hex_F"],
      [],
      [],
      [],
      [["30Rnd_65x39_caseless_green",7],["10Rnd_50BW_Mag_F",4],["16Rnd_9x21_Mag",2],["MiniGrenade",2]],
      ["arifle_ARX_hex_F",["muzzle_snds_65_TI_hex_F","acc_pointer_IR","optic_Arco"]],
      ["hgun_Rook40_F",["muzzle_snds_L"]],  // handgun
      ["NULL",[]],  // launcher
      ["ItemGPS"]   // items
    ],
    [10,10,10]
  ],
  ["merc_ion_i5","ION Newhire", "ION Newhire", "SERGEANT", "ION", "US",
    [
      "B_Soldier_F",
      ["U_Competitor"],
      ["V_PlateCarrier1_blk"],
      [],
      ["H_Cap_oli_hs"],
      ["G_Tactical_Black"],
      [],
      [],
      [["30Rnd_556x45_Stanag",8],["11Rnd_45ACP_Mag",2]],
      ["arifle_SPAR_01_blk_F",["acc_flashlight","optic_Holosight_blk_F"]],
      ["hgun_Pistol_heavy_01_F",["acc_flashlight_pistol"]],  // handgun
      ["NULL",[]],  // launcher
      ["ItemGPS"]   // items
    ],
    [6,6,6]
  ],
  ["merc_ion_i6","ION Contractor", "ION Contractors", "LIEUTENANT", "ION", "US",
    [
      "B_Soldier_F",
      ["U_Competitor"],
      ["V_PlateCarrier1_blk"],
      [],
      ["H_Cap_oli_hs"],
      ["G_Tactical_Black"],
      [],
      [],
      [["30Rnd_556x45_Stanag",8],["11Rnd_45ACP_Mag",2],["1Rnd_HE_Grenade_shell",4],["1Rnd_Smoke_Grenade_shell",1],["1Rnd_SmokeRed_Grenade_shell",1]],
      ["arifle_SPAR_01_GL_blk_F",["acc_flashlight","optic_ERCO_blk_F"]],
      ["hgun_Pistol_heavy_01_F",["acc_flashlight_pistol","optic_MRD"]],  // handgun
      ["NULL",[]],  // launcher
      ["ItemGPS"]   // items
    ],
    [8,8,8]
  ],
  ["merc_ion_s6","ION Marksman", "ION Marksmen", "LIEUTENANT", "ION", "US",
    [
      "B_Soldier_M_F",
      ["U_Competitor"],
      ["V_PlateCarrier1_blk"],
      [],
      ["H_Cap_oli_hs"],
      ["G_Tactical_Black"],
      [],
      [],
      [["20Rnd_762x51_Mag",6],["11Rnd_45ACP_Mag",2]],
      ["arifle_SPAR_03_blk_F",["optic_AMS","bipod_01_F_blk"]],
      ["hgun_Pistol_heavy_01_F",["acc_flashlight_pistol","optic_MRD"]],  // handgun
      ["NULL",[]],  // launcher
      ["ItemGPS"]   // items
    ],
    [8,8,8]
  ],
  ["merc_ion_m6","ION Defender", "ION Defenders", "LIEUTENANT", "ION", "US",
    [
      "B_Soldier_AR_F",
      ["U_Competitor"],
      ["V_PlateCarrier1_blk"],
      [],
      ["H_Cap_oli_hs"],
      ["G_Tactical_Black"],
      [],
      [],
      [["150Rnd_556x45_Drum_Mag_F",4],["11Rnd_45ACP_Mag",2]],
      ["arifle_SPAR_02_blk_F",["optic_ERCO_blk_F","bipod_01_F_blk"]],
      ["hgun_Pistol_heavy_01_F",["acc_flashlight_pistol","optic_MRD"]],  // handgun
      ["NULL",[]],  // launcher
      ["ItemGPS"]   // items
    ],
    [8,8,8]
  ],
  ["crim_i0", "Looter", "Looters", "PRIVATE", "Criminals", "Altis",
    [
      "C_man_p_fugitive_F",
      ["U_C_poor_1", "U_I_C_soldier_bandit_2_F", "U_I_C_soldier_bandit_3_F", "U_BG_Guerilla3_1"],
      [],
      ["B_Messenger_Black_F", "B_Messenger_Coyote_F", "B_Messenger_Gray_F", "B_Messenger_Olive_F"],
      [],
      [],
      [],
      [],
      [["10Rnd_9x21_Mag",4]],
      ["NULL",[]],
      ["hgun_Pistol_01_f",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [0,0,0]
  ],
  ["crim_i1", "Local Thug", "Local Thugs", "PRIVATE", "Criminals", "Altis",
    [
      "C_man_p_fugitive_F",
      ["U_C_poor_1", "U_I_C_soldier_bandit_2_F", "U_I_C_soldier_bandit_3_F", "U_BG_Guerilla3_1"],
      [],
      ["B_Messenger_Black_F", "B_Messenger_Coyote_F", "B_Messenger_Gray_F", "B_Messenger_Olive_F"],
      [],
      [],
      [],
      [],
      [["10Rnd_9x21_Mag",4]],
      ["NULL",[]],
      ["hgun_Pistol_01_f",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [1,1,1]
  ],
  ["crim_i2", "Local Enforcer", "Local Enforcer", "PRIVATE", "Criminals", "Altis",
    [
      "C_man_p_fugitive_F",
      ["U_C_poor_1", "U_I_C_soldier_bandit_2_F", "U_I_C_soldier_bandit_3_F", "U_BG_Guerilla3_1"],
      [],
      ["B_Messenger_Black_F", "B_Messenger_Coyote_F", "B_Messenger_Gray_F", "B_Messenger_Olive_F"],
      [],
      [],
      [],
      [],
      [["30Rnd_9x21_Mag",4]],
      ["hgun_PDW2000_F",[]],
      ["NULL",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [2,2,2]
  ],
  ["crim_i3", "Bandit", "Bandits", "PRIVATE", "Criminals", "Altis",
    [
      "C_man_p_fugitive_F",
      ["U_C_poor_1", "U_I_C_soldier_bandit_2_F", "U_I_C_soldier_bandit_3_F", "U_BG_Guerilla3_1"],
      ["V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli",
       "V_TacChestRig_cbr_F","V_TacChestRig_grn_F","V_TacChestRig_oli_F",
       "V_ChestRig_rgr","V_ChestRig_khk","V_ChestRig_oli"],
      [],
      [],
      ["G_Bandanna_Aviator", "G_Bandanna_Beast", "G_Bandanna_blk", "G_Bandanna_khk", "G_Bandanna_oli", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_tan"],
      [],
      [],
      [["30Rnd_762x39_Mag_F",6]],
      ["arifle_AKM_F",[]],
      ["NULL",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [3,3,3]
  ]
];

UnitDefsUid = [];
// Populate the array with UIDs for "find" powered-lookup
{
 	UnitDefsUid pushBack (_x select 0);
} forEach UnitDefs;