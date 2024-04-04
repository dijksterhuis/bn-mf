/*
	File: fn_create_cache_buildings.sqf
	Author: 'DJ' Dijksterhuis
	Public: No
	
	Description:
		Creates buildings for a PAVN Weapons Cache.
	
	Parameter(s):
		_position - Position [Position]
	
	Returns: nothing
	
	Example(s): none
	
	0: STRING	- Classname
	1: ARRAY	- Position [delta X, delta Y, z]
	2: NUMBER	- Azimuth
	3: NUMBER	- Fuel
	4: NUMBER	- Damage
	5: ARRAY	- Return from BIS_fnc_getPitchBank (only if 2nd param is false)
	6: STRING	- vehicleVarName
	7: STRING	- Initialization commands
	8: BOOLEAN	- Enable simulation
	9: BOOLEAN	- Position is ASL
*/

params ["_position"];


vn_mf_bn_weapons_cache_compositions = [
	// composition 1 -- no longer exists
	// composition 2
	[
		["vn_banner_pavn",[6.03564,-3.7002,0.6],292.057,1,0,[0,0],"","",false,false], 
		["vn_banner_vc",[-4.41895,8.01074,0.6],156.208,1,0,[0,0],"","",false,false], 
		["vn_banner_vc",[11.1548,-2.50781,0.6],294.908,1,0,[0,0],"","",false,false], 
		["Land_vn_shed_05_f",[8.82129,-2.71094,0],295,1,0,[0,0],"","",false,false], 
		["Land_vn_shed_05_f",[-2.51953,6.58887,0],155,1,0,[0,0],"","",false,false], 
		["vn_b_prop_cabinet_01_01",[9.32471,-4.93018,0.25],115,1,0,[0,0],"","",false,false], 
		["vn_b_prop_cabinet_02",[9.05176,-5.50195,0.25],115,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[8.28271,2.93994,0],295,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-7.4043,5.95068,0],155,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[1.06689,9.70801,0],155,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[8.5249,-7.66797,0],295,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-6.03223,9.021,0],245,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-2.1792,10.6479,0],245,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[12.2119,0.833984,0],295,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[2.15088,12.6016,0],245,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[11.5498,-6.16016,0],25,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[13.2817,-2.35352,0],25,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[9.11865,-10.3179,0],25,1,0,[0,0],"","",false,false],
		["vn_banner_pavn",[0.214355,5.52783,0.6],153.357,1,0,[0,0],"","",false,false], 
		["vn_bar_01_table_01",[-3.55713,4.54883,0.5],244.355,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[-3.55859,4.55859,1.5],155.228,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-0.21875,0.0117188,1],227.263,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.63721,1.82471,1],227.263,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.76221,-2.19678,1],227.263,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-2.30078,-1.74658,1],227.263,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[3.61768,-0.383789,1],227.263,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-0.319824,-3.95508,1],227.263,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[4.74561,2.91992,1],227.263,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-5.60205,-0.839355,1],227.263,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[2.09375,-6.16406,1],227.263,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-6.64111,-6.71729,1.5],235,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[7.07715,8.46777,1.5],335,1,0,[0,0],"","",false,false], 
		["vn_o_armor_t54b_01",[1.60254,-10.2534,1.5],270,1,0,[0,0],"","",false,false], 
		["vn_o_armor_t54b_01",[-10.9653,0.644043,1.5],180,1,0,[0,0],"","",false,false]
	],
	// composition 3
	[
		["vn_bar_01_table_01",[-0.755371,3.87158,0.5],180,1,0,[0,0],"","",false,false], 
		["vn_b_prop_cabinet_02",[-0.822754,2.21973,0.3],90,1,0,[0,-0],"","",false,false], 
		["vn_b_prop_cabinet_01_01",[-0.908691,2.81885,0.3],90,1,0,[0,-0],"","",false,false], 
		["vn_o_prop_t102e_01",[-0.706055,3.93115,1.25],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.97461,0.96875,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-1.73486,-1.7915,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[2.1001,-1.7041,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[2.16553,3.92969,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.90918,-4.66553,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-1.85156,-4.77344,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-4.12256,-0.151367,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[4.26465,-0.0805664,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-3.99951,-4.19238,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[4.36963,-4.01221,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[-1.63428,-4.21924,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[2.23828,-4.00244,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[-1.91406,-0.139648,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[2.0542,-0.0961914,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_02",[-2.15967,3.80566,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_02",[2.33838,3.75342,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-3.59717,-9.89502,1.5],270,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[3.92822,9.94092,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-3.99512,9.94385,1.5],270,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[4.39893,-9.89502,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_armor_t54b_01",[-9.44434,-0.1875,1.5],180,1,0,[0,0],"","",false,false], 
		["vn_o_armor_t54b_01",[10.4019,0.0551758,1.5],0,1,0,[0,0],"","",false,false]
	],
	// composition 4
	[
		["Land_vn_o_shelter_01",[0.797363,0.256836,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[0.718262,1.32129,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[0.843262,-1.35059,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_shelter_01",[-3.1709,0.213379,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_b_prop_cabinet_02",[-2.07959,2.57275,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-2.99219,-1.43848,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_shelter_01",[0.981445,-3.64941,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_02",[1.08154,4.10645,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_b_prop_cabinet_01_01",[-2.16553,3.17188,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[0.651855,-4.3125,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[0.90918,4.28223,1],90,1,0,[0,-0],"","",false,false], 
		["vn_bar_01_table_01",[-2.01221,4.22461,0.5],180,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[-2.89111,-3.86621,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[-1.96289,4.28418,1.25],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_shelter_02",[-3.4165,4.15869,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-5.37939,0.20166,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-3.10791,-4.4209,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[1.31982,-5.90479,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-5.25635,-3.83936,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-3.01172,-5.91455,0.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-5.25195,10.2969,1.5],270,1,0,[0,0],"","",false,false],
		["vn_o_nva_static_zpu4",[3.14209,-9.54199,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_static_zpu4",[2.67139,10.2939,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-4.854,-9.54199,1.5],270,1,0,[0,0],"","",false,false], 
		["vn_o_armor_t54b_01",[9.14502,0.408203,1.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_armor_t54b_01",[-10.7012,0.165527,1.5],180,1,0,[0,0],"","",false,false]
	],
	// composition 5
	[
		["Land_vn_o_shelter_01",[-1.91016,0.845215,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-1.73096,-0.806641,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_shelter_01",[2.05811,0.888672,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[2.104,-0.71875,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.979,1.95313,1],90,1,0,[0,-0],"","",false,false], 
		["vn_b_prop_cabinet_02",[-0.818848,3.20459,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_shelter_01",[-1.63037,-3.23438,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[2.24219,-3.01758,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_b_prop_cabinet_01_01",[-0.904785,3.80371,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.9126,-3.68066,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-1.84717,-3.78906,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[4.26855,0.904297,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_02",[-2.15576,4.79053,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_02",[2.34229,4.73828,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_bar_01_table_01",[-0.751465,4.85645,0.5],180,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[-0.702148,4.91602,1.25],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[4.37354,-3.02734,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[2.16992,4.91406,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-1.70996,-5.31104,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[2.37842,-5.21533,0.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-3.59326,-8.91016,1.5],270,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[4.40283,-8.91016,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_armor_t54b_01",[-9.44043,0.797363,1.5],180,1,0,[0,0],"","",false,false], 
		["vn_o_armor_t54b_01",[10.4058,1.04004,1.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[3.93213,10.9258,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-3.99121,10.9287,1.5],270,1,0,[0,0],"","",false,false]
	],
	// composition 6
	[
		["Land_vn_pavn_weapons_stack1",[0.650879,0.13916,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_shelter_01",[0.605469,1.74756,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[0.789551,-2.15869,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[0.459961,-2.82178,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[0.525879,2.81201,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-3.18408,0.0522461,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[2.81592,1.76318,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[2.9209,-2.16846,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[-3.36279,1.7041,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[-3.08301,-2.37549,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-3.2998,-2.92969,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[1.03564,-4.45313,0.5],90,1,0,[0,-0],"","",false,false], 
		["vn_b_prop_cabinet_02",[-2.27148,4.06348,0.5],90,1,0,[0,-0],"","",false,false], 
		["vn_b_prop_cabinet_01_01",[-2.35742,4.6626,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-3.11621,-4.57861,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-5.57129,1.69238,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[0.717285,5.77295,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-5.44824,-2.34863,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_bar_01_table_01",[-2.2041,5.71533,0.5],180,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_02",[-3.6084,5.64941,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[-2.15479,5.7749,1.25],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[2.84033,6.01318,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[2.9502,-8.05127,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-5.0459,-8.05127,1.5],270,1,0,[0,0],"","",false,false], 
		["vn_o_armor_t54b_01",[8.95313,1.89893,1.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_armor_t54b_01",[-10.8931,1.65625,1.5],180,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[2.47949,11.7847,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-5.44385,11.7876,1.5],270,1,0,[0,0],"","",false,false]
	],
	// composition 7
	[
		["Land_vn_o_shelter_01",[-1.88379,-0.126953,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[2.08447,-0.0834961,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_b_prop_cabinet_02",[-0.79248,2.23242,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[2.00537,0.980957,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-1.70459,-1.77881,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[2.13037,-1.69092,1],90,1,0,[0,-0],"","",false,false], 
		["vn_b_prop_cabinet_01_01",[-0.878418,2.83154,0.5],90,1,0,[0,-0],"","",false,false], 
		["vn_bar_01_table_01",[-0.725098,3.88428,0.5],180,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_02",[-2.12939,3.81836,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-4.09229,-0.138672,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_02",[2.36865,3.76611,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[-0.675781,3.94385,1.25],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[4.29492,-0.0678711,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[2.26855,-3.98975,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[2.19629,3.94189,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.93945,-4.65283,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-1.82178,-4.76123,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-3.96924,-4.17969,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[4.3999,-3.99951,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[2.29346,-6.06836,0.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_armor_t54b_01",[-9.41406,-0.174805,1.5],180,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[3.9585,9.95361,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-3.96484,9.95654,1.5],270,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-2.71826,-10.5278,1.5],270,1,0,[0,0],"","",false,false], 
		["vn_o_armor_t54b_01",[10.4321,0.0678711,1.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[4.75781,-10.6113,1.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[11.0078,-8.46729,0.5],41.5475,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[11.1299,8.57178,0.5],322.96,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-10.9258,8.93701,0.5],221.876,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-9.97949,-10.2085,0.5],134.821,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[0.268066,14.3013,0.5],90.4473,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[1.35693,-14.4746,0.5],90.4473,1,0,[0,-0],"","",false,false]
	],
	// composition 8
	[
		["Land_vn_o_shelter_01",[1.69287,-0.0493164,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.61328,1.01611,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_shelter_01",[-2.27539,-0.0927734,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.73828,-1.65723,1],90,1,0,[0,-0],"","",false,false], 
		["vn_b_prop_cabinet_02",[-1.18408,2.2666,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-2.0957,-1.74512,1],90,1,0,[0,-0],"","",false,false], 
		["vn_b_prop_cabinet_01_01",[-1.27002,2.86572,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[3.90332,-0.0336914,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_02",[1.97705,3.80029,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_bar_01_table_01",[-1.1167,3.91846,0.5],180,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_02",[-2.37109,3.88574,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[-1.06738,3.97803,1.25],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_shelter_01",[1.87695,-3.95557,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[-2.16943,-3.8501,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.8042,3.97705,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-4.48389,-0.104492,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.54834,-4.61914,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-2.21289,-4.72705,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-4.36084,-4.14551,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[1.90186,-6.03418,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-2.02539,-6.09619,0.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_armor_t54b_01",[-9.80566,-0.140625,1.5],180,1,0,[0,0],"","",false,false], 
		["vn_o_armor_t54b_01",[10.0405,0.102051,1.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[3.56689,9.98779,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-3.12012,-10.2334,1.5],270,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-4.35645,9.99072,1.5],270,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[4.25537,-10.1343,1.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-9.88965,-9.91211,0.5],134.821,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[0.346191,14.1401,0.5],90.4473,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[10.8081,-9.17773,0.5],41.5475,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[10.7061,9.30957,0.5],322.96,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[0.929199,-14.2256,0.5],90.4473,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-10.9277,9.54736,0.5],221.876,1,0,[0,0],"","",false,false]
	],
	// composition 9
	[
		["Land_vn_o_shelter_01",[1.91064,0.322266,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[-2.05762,0.278809,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_b_prop_cabinet_02",[-0.966309,2.63818,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.83105,1.3877,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-1.87793,-1.37354,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.95605,-1.28564,1],90,1,0,[0,-0],"","",false,false], 
		["vn_b_prop_cabinet_01_01",[-1.05225,3.2373,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[4.12109,0.337891,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[2.09473,-3.58398,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-4.26611,0.26709,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_bar_01_table_01",[-0.898926,4.29004,0.5],180,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_02",[-2.30322,4.22412,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[-0.849609,4.34961,1.25],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.76611,-4.24756,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-1.99512,-4.35547,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[2.02197,4.34863,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[4.22607,-3.59375,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-4.14307,-3.77393,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-2.06201,-5.66113,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[2.11963,-5.6626,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[2.0459,6.38184,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[5.26709,4.54883,0.5],33.0512,1,0,[0,0],"","",false,false], 
		["vn_o_armor_t54b_01",[-9.58789,0.230957,1.5],180,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[4.47266,-9.7627,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_armor_t54b_01",[10.2583,0.473633,1.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-4.27734,-10.0278,1.5],270,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[3.78467,10.3594,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-4.13867,10.3623,1.5],270,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-10.3281,-9.47119,0.5],134.821,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[11.3008,-8.58447,0.5],41.5475,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-10.9507,9.15527,0.5],221.876,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[0.66748,-14.3486,0.5],90.4473,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[11.0327,9.21094,0.5],322.96,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-0.203613,14.5591,0.5],90.4473,1,0,[0,-0],"","",false,false]
	],
	// composition 10
	[
		["Land_vn_o_shelter_01",[-1.94873,0.356934,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[2.01953,0.400391,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_b_prop_cabinet_02",[-0.857422,2.71631,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-1.76953,-1.29492,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[2.06543,-1.20752,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.93994,1.46533,1],90,1,0,[0,-0],"","",false,false], 
		["vn_b_prop_cabinet_01_01",[-0.943359,3.31543,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_shelter_01",[-1.66895,-3.72266,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_01",[2.20361,-3.50586,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-4.15723,0.345215,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_02",[-2.19434,4.30225,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_02",[2.30371,4.25,0.5],0,1,0,[0,0],"","",false,false], 
		["vn_bar_01_table_01",[-0.790039,4.36816,0.5],180,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[-0.740723,4.42773,1.25],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[1.87451,-4.16895,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[-1.88623,-4.27686,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_pavn_weapons_stack1",[2.13086,4.42627,1],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-4.03418,-3.6958,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[4.33496,-3.51563,0.5],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-1.85938,-5.69922,0.5],90,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[2.29102,-5.75293,0.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_armor_t54b_01",[-9.479,0.309082,1.5],180,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-3.19629,-9.96973,1.5],270,1,0,[0,0],"","",false,false], 
		["vn_o_armor_t54b_01",[10.3672,0.551758,1.5],0,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[3.89355,10.4375,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_static_zpu4",[4.57031,-10.1685,1.5],90,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_static_zpu4",[-4.02979,10.4404,1.5],270,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-10.6079,-7.80762,0.5],134.821,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[11.1787,-7.95654,0.5],36.282,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-10.417,9.00342,0.5],221.876,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[10.2944,9.21875,0.5],322.96,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-0.0483398,14.2603,0.5],90.4473,1,0,[0,-0],"","",false,false]
	]
];


private _randomAngle = [0,360] call BIS_fnc_randomInt;

private _objs = [_position, _randomAngle, selectRandom vn_mf_bn_weapons_cache_compositions] call BIS_fnc_objectsMapper;

_objs

