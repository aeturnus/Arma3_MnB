/*
Unit definition:
[Name, Name (Plural), Faction, "Identity range",Equipment, (,Skills)]
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
  Will,

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
    ]
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
    ]
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
    ]
  ]
];