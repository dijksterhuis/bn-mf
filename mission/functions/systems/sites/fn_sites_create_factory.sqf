/*
    File: fn_sites_create_factory.sqf
    Author: Cerebral
    Public: No
    
    Description:
		Creates a new Factory site in the given location.
    
    Parameter(s):
		_pos - Position to spawn the HQ site at
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
        [markerPos "myHq"] call vn_mf_fnc_sites_create_factory
*/

params ["_pos", ["_with_intel", false]];

[
	"factory",
	_pos,
	"factory",
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = _sitePos;

		missionNamespace getVariable ["current_factory", _siteStore];

		private _factoryObjects = [_spawnPos] call vn_mf_fnc_create_cache_buildings;

		private _intel = _factoryObjects select {typeOf _x == "Land_Map_unfolded_Malden_F" || typeOf _x == "vn_b_prop_cabinet_02"} select 0;

		private _currentVehicles = vehicles;
		vn_site_objects append _factoryObjects;

		//Create a factory marker.
		private _markerPos = _spawnPos getPos [20 + random 30, random 360];
		private _factoryMarker = createMarker [format ["factory_%1", _siteId], _markerPos];
		_factoryMarker setMarkerType "o_Ordnance";
		_factoryMarker setMarkerText "Cache";
		_factoryMarker setMarkerAlpha 0;

		private _partialMarkerPos = _spawnPos getPos [10 + random 40, random 360];
		private _markerPartial = createMarker [format ["PartialFactory_%1", _siteId], _partialMarkerPos];
		_markerPartial setMarkerType "o_unknown";
		_markerPartial setMarkerAlpha 0;

		// if has intel object -
		// - DC can spawn here
		// - keep the tanks
		// - keep intel objects and set them up
		// - doubled AI objectives

		private _objectives = [];

		if (_with_intel) then {

			missionNamespace setVariable ["factory_intel", _intel];
			missionNamespace setVariable ["factoryPosition", _pos];
			[_intel] call vn_mf_fnc_action_gather_intel;

			private _factoryRespawnMarker = createMarker [format ["dc_respawn_adhoc_%1", _siteId], _markerPos];
			_factoryRespawnMarker setMarkerType "o_Ordnance";
			_factoryRespawnMarker setMarkerAlpha 0;
			
			private _respawnID = [east, _factoryRespawnMarker] call BIS_fnc_addRespawnPosition;
			private _respawnObj = createVehicle ["Land_vn_o_platform_04", _markerPos, [], 5, "NONE"];
			_respawnObj setVariable ["vn_respawn", [_factoryRespawnMarker, _respawnID]];
		
			vn_dc_adhoc_respawns pushBack [_factoryRespawnMarker, _respawnID];

			// 2x ai objectives to replace other factory / hq AI that never get freed in task system
			_objectives pushBack ([_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend);
			_objectives pushBack ([_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend);

		} else {

			deleteVehicle _intel;
			// zpus are a static weapon AND a land vehicle
			_factoryObjects select {(_x isKindOf "LandVehicle" && !(_x isKindOf "StaticWeapon")) || typeOf _x == "vn_o_prop_t102e_01"} apply {deleteVehicle _x};

			_objectives pushBack ([_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend);
		};		


		private _objectTypesToDestroy = [
			"Land_vn_pavn_launchers", 
			"vn_b_ammobox_01", 
			"Land_vn_pavn_weapons_wide", 
			"Land_vn_pavn_weapons_cache", 
			"Land_vn_pavn_ammo", 
			"Land_vn_pavn_weapons_stack1", 
			"Land_vn_pavn_weapons_stack2",
			"Land_vn_pavn_weapons_stack3", 
			"vn_b_ammobox_full_02", 
			"vn_o_ammobox_wpn_04", 
			"vn_o_ammobox_full_03", 
			"vn_o_ammobox_full_07", 
			"vn_o_ammobox_full_06"
		];
		
		private _objectTypesForDynamicSim = [
			"Land_Map_unfolded_Malden_F",
			"vn_b_prop_cabinet_02",
			"Land_vn_wf_vehicle_service_point_east",
			"Land_vn_fuel_tank_stairs",
			"Land_Net_Fence_Gate_F"
		];

		private _fnc_dynSimKindOfChecker = {
			params ["_object"];
			(_x isKindOf "StaticWeapon" || _x isKindOf "Building" || _x isKindOf "House" || _x isKindOf "LandVehicle" || _x isKindOf "Air")
		};

		// normalise z-coord and up vector for vehicles, static weapons, weapon creates and the intel associated objects
		_factoryObjects select {typeOf _x in _objectTypesToDestroy || [_x] call _fnc_dynSimKindOfChecker} apply {
			[_x] call vn_mf_fnc_sites_utils_normalise_object_placement;
		};

		// keep an eye on anything we definitely don't want to fall under the floor
		_factoryObjects select {typeOf _x in _objectTypesToDestroy || _x isKindOf "StaticWeapon"} apply {
			[_x] call vn_mf_fnc_sites_object_zfixer_add_object;
		};

		// enable dynamic sim for a bunch of stuff
		_factoryObjects select {typeOf _x in _objectTypesToDestroy + _objectTypesForDynamicSim || [_x] call _fnc_dynSimKindOfChecker} apply {
			[_x, true] call para_s_fnc_enable_dynamic_sim;
		};

		_factoryObjects apply {
			if (_x in _currentVehicles) then {
				[_x, ["DacCong"]] call vn_mf_fnc_lock_vehicle_to_teams;
				vn_mf_dc_assets pushBack _x;
			};
		};
		_siteStore setVariable ["aiObjectives", _objectives];
		_siteStore setVariable ["markers", [_factoryMarker]];
		_siteStore setVariable ["partialMarkers", [_markerPartial]];
		_siteStore setVariable ["staticGuns", _factoryObjects select {_x isKindOf "StaticWeapon"}];
		_siteStore setVariable ["vehicles", _factoryObjects]; 
		_siteStore setVariable ["objectsToDestroy", _factoryObjects select {typeOf _x in _objectTypesToDestroy}];
	},
	//Teardown condition check code
	{
		//Check if we need to teardown every 15 seconds.
		15 call _fnc_periodicallyAttemptTeardown;
	},
	//Teardown condition
	{
		params ["_siteStore"];
		[_siteStore] call vn_mf_fnc_sites_utils_std_check_teardown;
	},
	//Teardown code
	{
		params ["_siteStore"];
		[_siteStore] call vn_mf_fnc_sites_utils_std_teardown;
	}
] call vn_mf_fnc_sites_create_site;