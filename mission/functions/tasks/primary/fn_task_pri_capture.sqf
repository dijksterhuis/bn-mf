/*
	File: fn_task_pri_capture.sqf
	Author: Savage Game Design
	Public: No

	Description:
		Primary task to take over a zone - clearing enemy forces out of it.
		Uses the state machine task system.

	Parameter(s):
		_taskDataStore - Namespace for storing task info [Object]

	Returns: nothing

	Example(s):
		Not directly called.
*/

/*
 * Task Parameters:
 *    None
 * Subtask Parameters:
 * 	  None
 * Runtime Parameters:
 *    None
 */

params ["_taskDataStore"];

_taskDataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	private _zone = _taskDataStore getVariable "taskMarker";
	private _zonePosition = getMarkerPos _zone;

	private _areaMarker = createMarker ["activeZoneCircle", _zonePosition];
	_areaMarker setMarkerShape "ELLIPSE";
	_areaMarker setMarkerSize [1100, 1100];
	_areaMarker setMarkerAlpha 1;
	_areaMarker setMarkerBrush "Border";
	_areaMarker setMarkerColor "ColorYellow";

	private _hqPosition = missionNamespace getVariable ["hqPosition", _zoneposition];
	//private _defendHqObj = [_hqPosition, 1, 1] call para_s_fnc_ai_obj_request_defend;

	private _factoryPosition = missionNamespace getVariable ["factoryPosition", _zoneposition];
	//private _defendFactoryObj = [_factoryPosition, 1, 1] call para_s_fnc_ai_obj_request_defend;

	//_taskDataStore setVariable ["aiObjectives", [_defendHqObj, _defendFactoryObj]];
	_taskDataStore setVariable ["startTime", serverTime];
	_taskDataStore setVariable ["hq_sites_destroyed", false];
	_taskDataStore setVariable ["factory_sites_destroyed", false];

	[[["destroy_hq_sites", _zonePosition], ["destroy_factory_sites", _zonePosition]]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["destroy_hq_sites", {
	params ["_taskDataStore"];

	private _side_sites_hq = missionNamespace getVariable ["side_sites_hq", []];

	// check each hq site to see if it's been destroyed
	{
		if (isNull _x || !(alive _x)) then
		{
			//remove from list
			_side_sites_hq deleteAt _forEachIndex;
		}
	} forEach _side_sites_hq;

	private _numberOfSites = count _side_sites_hq;
	if (_numberOfSites > 0) exitWith
	{
		_taskDataStore setVariable ["hq_sites_destroyed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

_taskDataStore setVariable ["destroy_factory_sites", {
	params ["_taskDataStore"];

	private _side_sites_factory = missionNamespace getVariable ["side_sites_factory", []];

	//check each site to see if it's destroyed
	{
		if (isNull _x || !(alive _x)) then
		{
			//remove from list
			_side_sites_factory deleteAt _forEachIndex;
		};
	} forEach _side_sites_factory;

	private _numberOfSites = count _side_sites_factory;
	if (_numberOfSites > 0) exitWith
	{
		_taskDataStore setVariable ["factory_sites_destroyed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	if (
		_taskDataStore getVariable ["hq_sites_destroyed", false]
		&& _taskDataStore getVariable ["factory_sites_destroyed", false]
	) then {
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {
	private _zone = _taskDataStore getVariable "taskMarker";
	private _zonePosition = getMarkerPos _zone;

	_taskDataStore getVariable "aiObjectives" apply {[_x] call para_s_fnc_ai_obj_finish_objective};

	deleteMarker "activeZoneCircle";

	_zone setMarkerColor "ColorYellow";
	_zone setMarkerBrush "DiagGrid";

	//Put the besieged zone off to the side for now to prevent an infinite loop
	private _selectZone = mf_s_activeZones findIf {_zone isEqualTo (_x select struct_zone_m_marker)};

	/*
	if there's a bases within range of the AO, look for a suitable base to send attacks towards,
	otherwise send AI towards the centre of the zone and hope they run into players
	current implementation --

	get nearby FOBs within a 2000m square area of the zone,
	sorted in descending order of the current supplies of the base,
	using the first array item as the target
	*/

	// construct an array containing another small sub-array for each candidate FOB: [FOB supplies: number, FOB: object]
	// TODO: candidate arrays should really be hashmaps.
	private _candidate_bases_to_attack = para_g_bases inAreaArray [_zonePosition, 1000, 1000, 0] apply { [ _x getVariable "para_g_current_supplies", _x] };
	_candidate_bases_to_attack sort false;

	// candidate FOBs exist
	if ((count _candidate_bases_to_attack) > 0) then {

		diag_log format [
			"FOB Defense: Co-Ordinates of FOBs within range of counter attack: %1", 
			_candidate_bases_to_attack apply {getPos (_x # 1)}
		];

		// TODO: candidate arrays should really be hashmaps.
		// get the first item from the sorted array
		private _base_to_attack = (_candidate_bases_to_attack # 0 ) # 1;

		diag_log format [
			"FOB Defense: Co-Ordinates of selected FOB: %1", 
			getPos _base_to_attack
		];

		private _fob_task_store = ((["defend_base", _zone, [["targetBase", _base_to_attack], ["prepTime", 180]]] call vn_mf_fnc_task_create) # 1);
		mf_s_siegedZones pushBack [_zone, _fob_task_store];

	};

	private _counter_task_store = ((["defend_counterattack", _zone, [["prepTime", 180]]] call vn_mf_fnc_task_create) # 1);

	mf_s_siegedZones pushBack [_zone, _counter_task_store];
	mf_s_activeZones deleteAt _selectZone;

}];
