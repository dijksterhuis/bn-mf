/*
    File: fn_curator_init_client.sqf
    Author: Savage Game Design
    Modified: 'DJ' dijksterhuis
    Public: No

    Description:
		Checks if the player is a curator locally, then REs server side curator initialisation.

    Parameter(s):
		_player - player object we'll make into a curator

    Returns: nothing

    Example(s):
		[_player] remoteExec ["vn_mf_fnc_curator_init_client", 2];
*/

params ["_player"];

diag_log format ["Checking whether player is a curator: %1", getPlayerUID _player];

private _curators = missionNamespace getVariable ["curatorUIDs", []];
if(_curators findIf { _x == getPlayerUID _player} > -1) then
{
	diag_log format ["Player is curator, setting up: %1", getPlayerUID _player];
	[_player] remoteExec ["vn_mf_fnc_curator_init_server_assign", 2];
};
