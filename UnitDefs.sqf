/*
Unit definition:
[Name, Name (Plural), Faction, "Identity range",Equipment, Skills]
Equipment:
[
  BaseClass, Uniform, Vest, Backpack, Headgear, Goggles, Binos, NVG,
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
  ["Player", "Player", "Player Faction", "Altis",
    [
      "C_man_casual_1_F","U_C_Poor_2","V_BandollierB_cbr", "NULL", "NULL", "NULL", "NULL", "NULL",
      [["30Rnd_762x39_Mag_F",8], ["9Rnd_45ACP_Mag",2]],
      ["arifle_AKM_F",[]],
      ["hgun_ACPC2_F",[]],
      ["NULL",[]],
      []
    ],
    [0,0,0]
  ],

  // 1
  ["Altian Militiaman", "Altian Militiamen", "Altian Locals", "Altis",
    [
      "C_man_casual_1_F","U_C_Poor_2","V_BandollierB_cbr", "NULL", "NULL", "NULL", "NULL", "NULL",
      [["30Rnd_762x39_Mag_F",8]],
      ["arifle_AKM_F",[]],
      ["NULL",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [1,1,1]
  ],
  // 2
  ["CSAT Private", "CSAT Privates", "CSAT", "Iran",
    [
      "O_survivor_F","U_O_CombatUniform_ocamo","V_HarnessO_brn", "NULL", "NULL", "NULL", "NULL", "NULL",
      [["30Rnd_65x39_caseless_green",8]],
      ["arifle_Katiba_F",[]],
      ["NULL",[]],  // handgun
      ["NULL",[]],  // launcher
      []            // items
    ],
    [1,1,1]
  ],
  ["CSAT Operator", "CSAT Operators", "CSAT", "Iran",
    [
      "O_recon_F","U_O_V_Soldier_Viper_hex_F", "NULL", "B_ViperHarness_hex_M_F", "H_HelmetO_ViperSP_hex_F", "NULL", "NULL", "NULL",
      [["30Rnd_65x39_caseless_green",7],["10Rnd_50BW_Mag_F",4],["16Rnd_9x21_Mag",2],["MiniGrenade",2]],
      ["arifle_ARX_hex_F",["muzzle_snds_65_TI_hex_F","acc_pointer_IR","optic_Arco"]],
      ["hgun_Rook40_F",["muzzle_snds_L"]],  // handgun
      ["NULL",[]],  // launcher
      ["ItemGPS"]            // items
    ],
    [10,10,10]
  ]
];