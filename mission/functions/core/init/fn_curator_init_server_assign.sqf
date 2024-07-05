/*
    File: fn_curator_init_server_assign.sqf
    Author: Savage Game Design
    Modified: 'DJ' dijksterhuis
    Public: No

    Description:
		Assigns a remote player object to curator logics within a single group.
		Executed on the server.

    Parameter(s):
		_player - player object we'll make into a curator

    Returns: nothing

    Example(s):
		[_player] remoteExec ["vn_mf_fnc_curator_init_server_assign", 2];
*/

params ["_player"];
private _playerUID = getPlayerUID _player;
private _curVarName = _playerUID + "_Cur";

private _curObject = missionNamespace getVariable [_curVarName, objNull];

if (isNull _curObject) then {
	if (isNil "MikeFrcCur_group") then {MikeFrcCur_group = creategroup sideLogic;};
	_curObject = MikeFrcCur_group createunit["ModuleCurator_F", [0, 90, 90], [], 0.5, "NONE"];	//Logic Server
	_curObject setVariable ["showNotification",false];
	publicVariable "MikeFrcCur_group";

	diag_log format ["[+] Curator unit created: curator=%1 group=%2", _curObject, MikeFrcCur_group];

	_cfg = (configFile >> "CfgPatches");

	_newAddons = [];
	for "_i" from 0 to((count _cfg) - 1) do {
		_name = configName(_cfg select _i);
		_newAddons pushBack _name;
	};

	if (count _newAddons > 0) then {_curObject addCuratorAddons _newAddons};
	diag_log format ["[+] Curator unit addons configured: curator=%1 addons=%2", _curObject, _newAddons];
	missionNamespace setVariable [_curVarName, _curObject, true];

};

diag_log format ["[+] Unassigning player from curator: player=%1 curator=%2", _player, _curObject];
unassignCurator _curObject;

sleep 0.4;
diag_log format ["[+] Assigning player to curator: player=%1 curator=%2", _player, _curObject];

_player assignCurator _curObject;
diag_log format ["[+] Assigned player to curator: player=%1 curator=%2", _player, _curObject];
