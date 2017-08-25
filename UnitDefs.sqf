/*
Unit definition:
[UniqueId, Name, Name (Plural), Faction, "Identity range",Equipment, Skills]
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
  ["player","Player", "Player", "Player Faction", "Altis",
    [
      "C_man_casual_1_F",
      ["U_C_Poor_2"],
      ["V_BandollierB_cbr"],
      [],
      [],
      [],
      [],
      [],
      [["30Rnd_762x39_Mag_F",8], ["9Rnd_45ACP_Mag",2]],
      ["arifle_AKM_F",[]],
      ["hgun_ACPC2_F",[]],
      ["NULL",[]],
      []
    ],
    [0,0,0]
  ],
  ["alt_i1", "Altian Recruit", "Altian Recruits", "Altian Locals", "Altis",
    [
      "C_man_casual_1_F",
      ["U_C_man_casual_1_F", "U_C_man_casual_2_F", "U_C_man_casual_3_F",
       "U_BG_Guerilla2_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_3"],
      ["V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli",
       "V_TacChestRig_cbr_F","V_TacChestRig_grn_F","V_TacChestRig_oli_F",
       "V_ChestRig_cbr","V_ChestRig_khk","V_ChestRig_oli"],
      [],
      [],
      [],
      [],
      [],
      [["10Rnd_9x21_Mag",6]],
      ["NULL",[]],
      ["hgun_Pistol_01_f",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [1,1,1]
  ],
  ["alt_i2","Altian Militiaman", "Altian Militiamen", "Altian Locals", "Altis",
    [
      "C_man_casual_1_F",
      ["U_C_man_casual_1_F", "U_C_man_casual_2_F", "U_C_man_casual_3_F",
       "U_BG_Guerilla2_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_3"],
      ["V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli",
       "V_TacChestRig_cbr_F","V_TacChestRig_grn_F","V_TacChestRig_oli_F",
       "V_ChestRig_cbr","V_ChestRig_khk","V_ChestRig_oli"],
      [],
      [],
      [],
      [],
      [],
      [["30Rnd_762x39_Mag_F",8]],
      ["arifle_AKM_F",[]],
      ["NULL",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [1,1,1]
  ],
  ["iran_i1","CSAT Recruit", "CSAT Recruits", "CSAT", "Iran",
    [
      "O_survivor_F",
      ["U_O_CombatUniform_ocamo"],
      ["V_HarnessO_brn"],
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
  ["iran_i2","CSAT Private", "CSAT Privates", "CSAT", "Iran",
    [
      "O_survivor_F",
      ["U_O_CombatUniform_ocamo"],
      ["V_HarnessO_brn"],
      [], 
      [],
      [],
      [],
      [],
      [["30Rnd_65x39_caseless_green",8]],
      ["arifle_Katiba_F",[]],
      ["NULL",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [1,1,1]
  ],
  ["iran_i7","CSAT Operator", "CSAT Operators", "CSAT", "Iran",
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
      ["ItemGPS"]            // items
    ],
    [10,10,10]
  ]
];

UnitDefsUid = [];
// Populate the array with UIDs for "find" powered-lookup
{
 	UnitDefsUid pushBack (_x select 0);
} forEach UnitDefs;