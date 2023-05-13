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
  Create a new zone specific config array for all sites by copying each base 
  config hashmap to a new non-referenced hashmap and inject the zone specific 
  information into the new hashmap.

  Now say that three times out loud twice as fast.
*/
private _zoneHashMapsArr = vn_mf_sites_hashmaps apply {

    // de-referenced (deep) copy so we don't accidentally
    // modify the original base config hashmaps
	private _siteHashMap = +_x;

	// set zone specific information in new de-referenced site hashmap
	_siteHashMap set ["_zone", _zone];
	_siteHashMap set ["_position", _center];
	_siteHashMap set ["_zoneRadius", 1000];
	_siteHashMap
};

/*
  Generate all the sites from zone specific site hashmaps.
*/
_zoneHashMapsArr apply {

	/*
	  automagically generate private variables from hashmap keys + values
	  any private variables below this line are probably generated from this
	  automagic
	  
	  https://community.bistudio.com/wiki/HashMap#Automagic_assignation
	*/

	(values _x) params (keys _x);

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
			_position,
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
