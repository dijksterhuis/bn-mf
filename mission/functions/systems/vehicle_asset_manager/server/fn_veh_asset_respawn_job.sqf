/*
	File: fn_veh_asset_respawn_job.sqf
	Author: Savage Game Design
	Public: No

	Description:
		Scheduler job that respawns vehicles based on respawn flag in vehicleInfo state data.

	Parameter(s): none

	Returns: nothing

	Example(s): none
*/

if (vn_mf_spawn_points_to_respawn isEqualTo []) exitWith {};

private _next = vn_mf_spawn_points_to_respawn findIf {
	vn_mf_veh_asset_spawn_points get _x get "status" getOrDefault ["finishesAt", 0] < serverTime
};

if (_next == -1) exitWith {};

private _spawnPointId = vn_mf_spawn_points_to_respawn deleteAt _next;
private _spawnPoint = vn_mf_veh_asset_spawn_points get _spawnPointId;

// @dijksterhuis: Set the key up that we'll use to track any duplicate respawn requests
// see asset respawn job for why this needs to exist! (race condition hotfix).
if (_spawnPoint getOrDefault ["bn_is_respawning_count", -1] == -1) then {
	_spawnPoint set ["bn_is_respawning_count", 0];
};

if (isNil "_spawnPoint") exitWith {};

[_spawnPoint] spawn vn_mf_fnc_veh_asset_respawn;
