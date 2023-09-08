/*
	File: fn_task_counterattack.sqf
	Author: Savage Game Design
	Public: No

	Description:
		Primary task to defend a zone against an enemy attack, and clear out nearby entrenchments.
		Uses the state machine task system.

	Parameter(s):
		_taskDataStore - Namespace for storing task info [Object]

	Returns: nothing

	Example(s):
		Not directly called.
*/

/*
	Requires Task Variables:
*/


/*
TODO -- with a bit of work this task can be turned into a generic 
capture and hold task for N positions.

Requires abstracting some of the functionality into methods.
See the prepare task for an example.
*/


params ["_taskDataStore"];


_taskDataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	_taskDataStore setVariable ["radar_position", [8310, 10722, 0]];
	_taskDataStore setVariable ["compound_position", [8620, 10489, 0]];

	/*
	Don't run any other init here, we'll handle that later on during the 
	capture subtask to set up area markers for points one after the other
	*/

	// TODO
	// ["CounterAttackPreparing", ["", 0]] remoteExec ["para_c_fnc_show_notification", 0];
	// [] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
	// ["Counterattack In", 10, true] call vn_mf_fnc_timerOverlay_setGlobalTimer;

	[[
		["capture_radar", _taskDataStore getVariable "radar_position"]
	]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["_fnc_notify_capture_start", {
	["CaptureArea", []] remoteExec ["para_c_fnc_show_notification", 0];
	[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
	["Capture the location", serverTime + (10 * 60), true] call vn_mf_fnc_timerOverlay_setGlobalTimer;
}];

_taskDataStore setVariable ["_fnc_notify_hold_start", {
	["CounterAttackImminent", []] remoteExec ["para_c_fnc_show_notification", 0];
	[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
	["Hold this location", serverTime + (10 * 60), true] call vn_mf_fnc_timerOverlay_setGlobalTimer;
}];

_taskDataStore setVariable ["_fnc_get_all_players", {
	count (allPlayers select {side _x != east})
}];

_taskDataStore setVariable ["_fnc_get_capture_player_threshold", {
	params ["_taskDataStore"];
	0.25 * (call (_taskDataStore getVariable "_fnc_get_all_players"))
}];

_taskDataStore setVariable ["_fnc_delete_area_marker", {
	deleteMarker (_taskDataStore getVariable ["areaMarker", ""]);
	_taskDataStore setVariable ["areaMarker", false];
}];

_taskDataStore setVariable ["_fnc_get_area_desc", {
	params ["_pos"];
	[_pos, 100, 100, 0, false]
}];

_taskDataStore setVariable ["_fnc_init_generic", {

	params ["_taskDataStore", "_pos", "_markerName"];

	if !(_taskDataStore getVariable ["areaMarker", false] isEqualType "") then {

		diag_log "initstuff";
		private _areaMarker = createMarker [_markerName, _pos];
		_areaMarker setMarkerShape "ELLIPSE";
		_areaMarker setMarkerSize [100, 100];
		_areaMarker setMarkerAlpha 1;
		_areaMarker setMarkerBrush "Border";
		_areaMarker setMarkerColor "ColorRed";

		_taskDataStore setVariable ["areaMarker", _markerName];
		_taskDataStore setVariable ["aiObjectives", [[_pos, 30, 30] call para_s_fnc_ai_obj_request_ambush]];
		_taskDataStore setVariable ["captureEndTime", serverTime + (60 * 10)];
		_taskDataStore getVariable ["holdEndTime", 0];
		_taskDataStore setVariable ["playerInAreaChecks", 0];
		_taskDataStore setVariable ["playersInAreaRatioAverage", 0];
	};

}];

_taskDataStore setVariable ["_fnc_check_end_time_capture", {
	params ["_taskDataStore"];
	serverTime >= _taskDataStore getVariable ["captureEndTime", serverTime]	
}];

_taskDataStore setVariable ["_fnc_check_end_time_hold", {
	params ["_taskDataStore"];
	serverTime >= _taskDataStore getVariable ["holdEndTime", serverTime]	
}];

_taskDataStore setVariable ["_fnc_finish_ai_obj", {
	params ["_taskDataStore"];
	private _ai_objs = _taskDataStore getVariable ["aiObjectives", []];
	
	if !(_ai_objs isEqualTo []) then {
		_ai_objs apply {[_x] call para_s_fnc_ai_obj_finish_objective};
	};
	
}];

_taskDataStore setVariable ["_fnc_get_alive_players_in_area", {
	params ["_taskDataStore", "_pos"];
	
	private _areaDescriptor = [_pos] call (_taskDataStore getVariable "_fnc_get_area_desc");

	//Side check - downed players don't count. Nor do players in aircraft. Ground vehicles are fair game.
	allPlayers inAreaArray _areaDescriptor select {
		alive _x && (side _x == west || side _x == independent) && !(vehicle _x isKindOf "Air") && !(_x getVariable ["vn_revive_incapacitated", false])
	}
}];


_taskDataStore setVariable ["_fnc_maybe_do_next_subtask", {
	params ["_taskDataStore"];

	if (_taskDataStore getVariable ["nextSubTask", []] isEqualTo []) then {
		_taskDataStore setVariable ["completed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	} else {
		private _args = ["SUCCEEDED", [_taskDataStore getVariable "nextSubTask"]];
		_taskDataStore setVariable ["nextSubTask", []];
		_args call _fnc_finishSubtask;
	};
}];

_taskDataStore setVariable ["_fnc_capture_generic", {
	params ["_taskDataStore", "_pos", ["_nextSubtask", []]];

	// actually init the point here in the subtask
	// if the AreaMarker is already defined in this subtask we 
	[_taskDataStore, _pos, "AreaMarker"] call (_taskDataStore getVariable "_fnc_init_generic");

	private _alivePlayersInZone = [_taskDataStore, _pos] call (_taskDataStore getVariable "_fnc_get_alive_players_in_area");
	private _thresholdPlayerCount = [_taskDataStore] call (_taskDataStore getVariable "_fnc_get_capture_player_threshold");

	// too much time has passed, fail the sub task and the rest of the task
	if (call (_taskDataStore getVariable "_fnc_check_end_time_capture")) exitWith {
		
		[] call (_taskDataStore getVariable "_fnc_delete_area_marker");

		[_taskDataStore] call (_taskDataStore getVariable "_fnc_finish_ai_obj");
		_taskDataStore setVariable ["failed", true];
		["FAILED"] call _fnc_finishSubtask;
	};

	// 25 percent of players are in the zone
	if ((count _alivePlayersInZone) > _thresholdPlayerCount) exitWith {

		[_taskDataStore] call (_taskDataStore getVariable "_fnc_finish_ai_obj");
		_taskDataStore setVariable ["aiObjectives", [[_pos, 30, 30] call para_s_fnc_ai_obj_request_attack]];
		_taskDataStore setVariable ["holdEndTime", serverTime + (60 * 1)];
		[_taskDataStore] call (_taskDataStore getVariable "_fnc_maybe_do_next_subtask");
	};
}];


_taskDataStore setVariable ["_fnc_update_hold_ratio", {
	params ["_taskDataStore", "_pos"];

	private _prevCount = _taskDataStore getVariable ["playersInAreaChecks", 0];
	_taskDataStore setVariable ["playersInAreaChecks", _prevCount + 1];

	private _areaDescriptor = [_pos] call (_taskDataStore getVariable "_fnc_get_area_desc");

	//Side check - downed players don't count. Nor do players in aircraft. Ground vehicles are fair game.
	private _alivePlayersInZone = [_taskDataStore, _pos] call (_taskDataStore getVariable "_fnc_get_alive_players_in_area");
	private _alivePlayersInZoneRatio = (count _alivePlayersInZone) / (call (_taskDataStore getVariable "_fnc_get_all_players"));
	private _prevAvg = _taskDataStore getVariable ["playersInAreaRatioAverage", 0];

	// average without having to store all values 
	// https://math.stackexchange.com/a/957376
	_taskDataStore setVariable [
		"playersInAreaRatioAverage", 
		_prevAvg + ((_alivePlayersInZoneRatio - _prevAvg) / (_taskDataStore getVariable "playersInAreaChecks"))
	];

}];

_taskDataStore setVariable ["_fnc_hold_generic", {
	params ["_taskDataStore", "_pos", ["_nextSubtask", []]];
	
	diag_log format ["NEXT: %1", _nextSubtask];

	[_taskDataStore, _pos] call (_taskDataStore getVariable "_fnc_update_hold_ratio");

	if (0.2 > _taskDataStore getVariable ["playersInAreaRatioAverage", 0]) exitWith {

		[] call (_taskDataStore getVariable "_fnc_delete_area_marker");

		[_taskDataStore] call (_taskDataStore getVariable "_fnc_finish_ai_obj");

		_taskDataStore setVariable ["failed", true];
		["FAILED"] call _fnc_finishSubtask;
	};

	if (
		call (_taskDataStore getVariable "_fnc_check_end_time_hold")
		&& 0.20 <= _taskDataStore getVariable ["playersInAreaRatioAverage", 0] 
	) exitWith {

		[] call (_taskDataStore getVariable "_fnc_delete_area_marker");

		[_taskDataStore] call (_taskDataStore getVariable "_fnc_finish_ai_obj");
		[_taskDataStore] call (_taskDataStore getVariable "_fnc_maybe_do_next_subtask");
	};
}];

// get ambushed

_taskDataStore setVariable ["capture_radar", {
	params ["_taskDataStore"];
	[] call (_taskDataStore getVariable "_fnc_notify_capture_start");
	private _pos = _taskDataStore getVariable "radar_position";
	_taskDataStore setVariable ["nextSubTask", ["hold_radar", _pos]];
	[_taskDataStore, _pos] call (_taskDataStore getVariable "_fnc_capture_generic");
}];

// hold against the attack

_taskDataStore setVariable ["hold_radar", {
	params ["_taskDataStore"];
	[] call (_taskDataStore getVariable "_fnc_notify_hold_start");
	private _pos = _taskDataStore getVariable "radar_position";
	_taskDataStore setVariable ["nextSubTask", ["capture_compound", _taskDataStore getVariable "compound_position"]];
	[_taskDataStore, _pos] call (_taskDataStore getVariable "_fnc_hold_generic");
}];

// move to attack the main camp

_taskDataStore setVariable ["capture_compound", {
	params ["_taskDataStore"];
	[] call (_taskDataStore getVariable "_fnc_notify_capture_start");
	private _pos = _taskDataStore getVariable "compound_position";
	_taskDataStore setVariable ["nextSubTask", ["hold_compound", _pos]];
	[_taskDataStore, _pos] call (_taskDataStore getVariable "_fnc_capture_generic");
}];

// attack the main camp

_taskDataStore setVariable ["hold_compound", {
	params ["_taskDataStore"];
	[] call (_taskDataStore getVariable "_fnc_notify_hold_start");
	private _pos = _taskDataStore getVariable "compound_position";
	[_taskDataStore, _pos] call (_taskDataStore getVariable "_fnc_hold_generic");
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];
	if ((_taskDataStore getVariable ["failed", false])) then {
		["CaptureHoldFailed", []] remoteExec ["para_c_fnc_show_notification", 0];
		["FAILED"] call _fnc_finishTask;
	};
	if ((_taskDataStore getVariable ["completed", false])) then {
		["CaptureHoldSuccess", []] remoteExec ["para_c_fnc_show_notification", 0];
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {}];
