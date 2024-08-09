/*
	File: fn_action_destroy_task.sqf
	Author: Cerebral
	Public: No
	
	Description:
		Pops a task
	
	Parameter(s): none
	
	Returns:
	
	Example(s):
		call vn_mf_fnc_action_destroy_task;
*/

private _objAttachTo = player;
private _title = "Destroy";
private _idleIcon = "custom\holdactions\holdAction_destroy_ca.paa";
private _idleProgress = "custom\holdactions\holdAction_destroy_ca.paa";

// the str {} trim trick here means we can write stuff that highlights in an ide
// as sqf, but we make it turns into a string for the holdAction argument to compile later
private _conditionToShowString = str {
	call {
		// stuff players can destroy
		private _classNames = [
			// generic obj ammo crates etc
			'Land_vn_pavn_launchers',
			'vn_b_ammobox_01',
			'Land_vn_pavn_weapons_wide',
			'Land_vn_pavn_weapons_cache',
			'Land_vn_pavn_ammo',
			'Land_vn_pavn_weapons_stack1',
			'Land_vn_pavn_weapons_stack2',
			'Land_vn_pavn_weapons_stack3',
			'vn_b_ammobox_full_02',
			'vn_o_ammobox_wpn_04',
			'vn_o_ammobox_full_03',
			'vn_o_ammobox_full_07',
			'vn_o_ammobox_full_06',
			'vn_o_ammobox_02',
			"vn_o_ammobox_08",
			"vn_b_ammobox_09",
			'Land_CratesWooden_F',
			//arty sites
			"vn_o_nva_navy_static_mortar_type63",
			"vn_o_nva_navy_static_mortar_type53",
			"vn_o_nva_65_static_mortar_type53",
			"vn_o_nva_65_static_mortar_type63",
			"vn_o_nva_static_mortar_type53",
			"vn_o_nva_static_mortar_type63",
			"vn_o_vc_static_mortar_type53",
			"vn_o_vc_static_mortar_type63",
			"vn_o_nva_65_static_d44",
			"vn_o_nva_65_static_d44_01",
			"vn_o_nva_navy_static_d44",
			"vn_o_nva_navy_static_d44_01",
			"vn_o_nva_static_d44",
			"vn_o_nva_static_d44_01",
			"vn_o_vc_static_d44",
			"vn_o_vc_static_d44_01",
			// campsite only
			'Land_vn_o_shelter_06',
			// AA site
			'vn_o_nva_navy_static_zpu4',
			'vn_o_nva_65_static_zpu4',
			"vn_o_nva_static_zpu4",
			// mortar / art obj
			'vn_o_nva_navy_static_mortar_type63',
			'vn_o_nva_65_static_mortar_type53',
			'vn_o_nva_static_d44_01',
			'vn_o_nva_navy_static_mortar_type63',
			'vn_o_nva_65_static_mortar_type53',
			'vn_o_nva_static_d44_01',
			// factory specific + one of the old radar compositions?
			'Land_vn_wf_vehicle_service_point_east',
			// radar / sa2 site
			'vn_sa2',
			'vn_o_static_rsna75',
			// tunnel
			'Land_vn_o_trapdoor_01',
			'Land_vn_o_platform_04'  // dac cong resapwn
		];

		private _res = (
			(side player != east)
			&& {
				(typeOf cursorObject in _classNames)
			&& {
				// 1.75m base distance plus object largest dimension divided by 2
				(player distance cursorObject < (1.75 + (sizeOf (typeOf cursorObject)) / 2))
			&& {
				/*
				the vn_tunnel module sets the vn_tunnel_tunnel_object variable globally,
				meaning we should be able to inspect it locally as a player
				(holdAction is player local)
				*/
				(isNull (cursorObject getVariable ['vn_tunnel_tunnel_object', objNull]))
			}
			}
			}
		);
		// diag_log format ["DEBUG: destroy task holdAction conditionToProgress result: %1", _res];
		_res;
	};
} trim ["{}", 0];

private _conditionToProgressString = _conditionToShowString;
private _codeOnStart = {};
private _codeOnProgressTick = {};
private _codeOnCompletion =	{
	[cursorObject, player] remoteExec ["vn_mf_fnc_sites_remoteactions_destroy_task", 2];
};
private _codeOnInterrupted = {};
private _args = [];
private _duration = 5;
private _priority = 100;
private _removeWhenCompleted = false;
private _showWhenunconscious = false;

[
	_objAttachTo,
	_title,
	_idleIcon,
	_idleProgress,
	_conditionToShowString,
	_conditionToProgressString,
	_codeOnStart,
	_codeOnProgressTick,
	_codeOnCompletion,
	_codeOnInterrupted,
	_args,
	_duration,
	_priority,
	_removeWhenCompleted,
	_showWhenunconscious
] call BIS_fnc_holdActionAdd;
