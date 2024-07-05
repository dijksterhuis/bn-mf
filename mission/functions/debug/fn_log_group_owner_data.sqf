/*
	File: fn_log_group_owner_data.sqf
	Author: "DJ" Dijksterhuis"
	Public: No
	
	Description:
		Log which machine ID is owner of how many groups.
		Useful for tracking how many AI are assigned to headless clients versus server etc.
	
	Parameter(s):
		None
	
	Returns:
		Nothing (true when executed)
	
	Example(s):
		call vn_mf_fnc_log_group_owner_data;
		["groupowner_logging", vn_mf_fnc_log_group_owner_data, [], 60] call para_g_fnc_scheduler_add_job;
		
*/


private _owners = createHashMap;

allGroups apply {
	_owners set [groupOwner _x, [_x] + (_owners getOrDefault [groupOwner _x, []])];
};

{["INFO", format ["Group owners: ownerMachineNetId=%1 count=%2", _x, count _y]] call para_g_fnc_log} forEach _owners;
