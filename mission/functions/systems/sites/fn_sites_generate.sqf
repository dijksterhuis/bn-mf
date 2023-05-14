/*
    File: fn_sites_generate.sqf
    Author: Savage Game Design
    Modified: @dijksterhuis
    Modified Date: 2023-MAY-13
    Public: No
    
    Description:
		Places new sites down on the map procedurally. 
    
    Parameter(s):
		_zone - Targeted zone

    Returns:
		None
    
    Example(s):
		["zone_attapeu"] call vn_mf_fnc_sites_generate;
		["zone_can_tho"] call vn_mf_fnc_sites_generate;
*/
params ["_zone"];

private _zoneData = [_zone] call vn_mf_fnc_zones_load_zone;
private _center = markerPos (_zoneData select struct_zone_m_marker);

// in vanilla mike force the sites must all exist in zone's hexagon,
// but here at BN we just use a default radius of 1000

// private _size = markerSize (_zoneData select struct_zone_m_marker);
// private _sizeX = _size select 0;

/*
  Generate all the sites from base config hashmaps.
*/
vn_mf_sites_hashmaps apply {

	// TODO: Change to vn_mf_bn_s_zone_radius when PR merged
	private _zoneRadius = 1000;

	private _type = _x getOrDefault ["_type", "undefined"];
	private _maxSites = _x getOrDefault ["_maxSites", 1];
	private _waterMode = _x getOrDefault ["_waterMode", 0];
	// TODO: Change to vn_mf_sites_minimum_distance_between_sites once PR merged.
	private _siteRadius = _x getOrDefault ["_siteRadius", 75];
	private _siteMaxGradient = _x getOrDefault ["_siteMaxGradient", 5];
	private _terrainObjects = _x getOrDefault ["_terrainObjects", []];
	private _generateCode = _x getOrDefault ["_generateCode", ""];

	private _nSites = 1 + ceil random (_maxSites - 1);

	diag_log format [
		"INFO: Generating new %1 sites: zone=%2 n=%3",
		_type,
		_zone,
		_nSites
	];

	for "_i" from 1 to (_nSites) do
	{
		private _safe_pos = [
			_center,
			_zoneRadius,
			_waterMode,
			_siteRadius,
			_siteMaxGradient,
			_terrainObjects
		] call vn_mf_fnc_sites_get_safe_location;

		[_safe_pos, _zone] call compile _generateCode;
	};

	diag_log format [
		"INFO: Generated new %1 sites: zone=%2 n=%3",
		_type,
		_zone,
		_nSites
	];

};

// add the "Tap Radio Comms" hold action to all generated radio sets
private _radios = vn_site_objects select {
	typeOf _x in ["vn_o_prop_t102e_01", "vn_o_prop_t884_01"];
};

_radios apply {_x call vn_mf_fnc_action_radiotap};
