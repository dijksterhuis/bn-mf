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
		[] call vn_mf_fnc_sites_generate
*/
params ["_zone"];

private _zoneData = [_zone] call vn_mf_fnc_zones_load_zone;
private _center = markerPos (_zoneData select struct_zone_m_marker);

// vanilla mike force the sites must all exist in zone's hexagon,
// but here at BN we just use a default radius of 1000

// private _size = markerSize (_zoneData select struct_zone_m_marker);
// private _sizeX = _size select 0;

private _allTerrainObjects = [
	"TREE",
	"HIDE",
	"WATERTOWER",
	"BUSH",
	"SMALL TREE",
	"ROCK",
	"ROCKS",
	"STACK",
	"FOUNTAIN",
	"RUIN",
	"TOURISM",
	"CHURCH",
	"CHAPEL",
	"BUILDING",
	"HOUSE",
	"FUELSTATION",
	"HOSPITAL",
	"FORTRESS",
	"BUNKER",
	"FENCE",
	"WALL"
];
private _unnaturalObjects =	[
	"HIDE",
	"WATERTOWER",
	"STACK",
	"FOUNTAIN",
	"RUIN",
	"TOURISM",
	"CHURCH",
	"CHAPEL",
	"BUILDING",
	"HOUSE",
	"FUELSTATION",
	"HOSPITAL",
	"FORTRESS",
	"BUNKER",
	"FENCE",
	"WALL"
];

////////////////////////////////////////////////////////////////////
// HASH MAPS FOR EACH SITE.

private _factoryHashMap = createHashMapFromArray [
	["_zone", _zone],
	["_name", "factory"],
	["_maxSites", vn_mf_s_max_factories_per_zone],
	["_position", _center],
	["_zoneRadius", 1000],
	["_waterMode", 0],
	["_gradientRadius", 55],
	["_gradientDegrees", 5],
	["_terrainObjects", _allTerrainObjects],
	["_generateCode",
		{
			params ["_safe_pos", "_zone"];
			[_safe_pos, _zone] call vn_mf_fnc_sites_create_factory;
		}
	]
];

private _hqHashMap = createHashMapFromArray [
	["_zone", _zone],
	["_name", "hq"],
	["_maxSites", vn_mf_s_max_hqs_per_zone],
	["_position", _center],
	["_zoneRadius", 1000],
	["_waterMode", 0],
	["_gradientRadius", 55],
	["_gradientDegrees", 5],
	["_terrainObjects", _allTerrainObjects],
	["_generateCode",
		{
			params ["_safe_loc", "_zone"];
			[_safe_loc, _zone] call vn_mf_fnc_sites_create_hq;
		}
	]
];

private _radarHashMap = createHashMapFromArray [
	["_zone", _zone],
	["_name", "radar"],
	["_maxSites", vn_mf_s_max_radars_per_zone],
	["_position", _center],
	["_zoneRadius", 1000],
	["_waterMode", 0],
	["_gradientRadius", 55],
	["_gradientDegrees", 5],
	["_terrainObjects", _allTerrainObjects],
	["_generateCode",
		{
			params ["_safe_pos", "_zone"];
			[_safe_pos, _zone] call vn_mf_fnc_sites_create_radar;
		}
	]
];

private _artyHashMap = createHashMapFromArray [
	["_zone", _zone],
	["_name", "art"],
	["_maxSites", vn_mf_s_max_artillery_per_zone],
	["_position", _center],
	["_zoneRadius", 1000],
	["_waterMode", 0],
	["_gradientRadius", 20],
	["_gradientDegrees", 10],
	["_terrainObjects", _allTerrainObjects],
	["_generateCode",
		{
			params ["_safe_pos", "_zone"];
			[_safe_pos, _zone] call vn_mf_fnc_sites_create_artillery_site;
		}
	]
];

private _campHashMap = createHashMapFromArray [
	["_zone", _zone],
	["_name", "camp"],
	["_maxSites", vn_mf_s_max_camps_per_zone],
	["_position", _center],
	["_zoneRadius", 1000],
	["_waterMode", 0],
	["_gradientRadius", 35],
	["_gradientDegrees", 8],
	["_terrainObjects", _allTerrainObjects],
	["_generateCode",
		{
			params ["_safe_pos", "_zone"];
			[_safe_pos, _zone] call vn_mf_fnc_sites_create_camp_site;
		}
	]
];

private _aaHashMap = createHashMapFromArray [
	["_zone", _zone],
	["_name", "aa"],
	["_maxSites", vn_mf_s_max_aa_per_zone],
	["_position", _center],
	["_zoneRadius", 1000],
	["_waterMode", 0],
	["_gradientRadius", 20],
	["_gradientDegrees", 5],
	["_terrainObjects", _allTerrainObjects],
	["_generateCode",
		{
			params ["_safe_pos", "_zone"];
			[_safe_pos, _zone] call vn_mf_fnc_sites_create_aa_site;
		}
	]
];

private _tunnelHashMap = createHashMapFromArray [
	["_zone", _zone],
	["_name", "tunnel"],
	["_maxSites", vn_mf_s_max_tunnels_per_zone],
	["_position", _center],
	["_zoneRadius", 1000],
	["_waterMode", 0],
	["_gradientRadius", 5],
	["_gradientDegrees", 20],
	["_terrainObjects", _unnaturalObjects + ["ROCK", "ROCKS"]],
	["_generateCode",
		{
			params ["_safe_pos", "_zone"];
			[_safe_pos, _zone] call vn_mf_fnc_sites_create_tunnel_site;
		}
	]
];

private _waterSupplyHashMap = createHashMapFromArray [
	["_zone", _zone],
	["_name", "waterSupply"],
	["_maxSites", vn_mf_s_max_water_supply_per_zone],
	["_position", _center],
	["_zoneRadius", 1000],
	["_waterMode", 2],
	["_gradientRadius", 5],
	["_gradientDegrees", 20],
	["_terrainObjects", _unnaturalObjects + ["ROCK", "ROCKS"]],
	["_generateCode",
		{
			params ["_safe_pos", "_zone"];
			[_safe_pos, _zone] call vn_mf_fnc_sites_create_water_supply_site;
		}
	]
];

/*
Add all the configs (hashmaps) to a single array in order of priority.

The priority is generally determined by either
(a) how fragile the site is (factories always go in first!)
(b) how difficult the constraints are (lower gradientDegress settings should go first)

1. FACTORY first as it has the highest incidence rate of blowing up.
2. HQ next as it is a high priority site
3. RADAR next as also have a tendancy to blow up, but less critical than HQs.
4. ART next as mortars can go flying / get destroyed on uneven ground.
5. CAMP now as less important if supply crates fall through map
6. AA next as it is a single static asset and fairly safe to place.
7. TUNNEL are pretty simple. just not massive gradient.
8. WATER SUPPLY last -- just dump them in some water nearby.

*/


private _sitesHashMapsArr = [];

_sitesHashMaps pushBack _factoryHashMap;
_sitesHashMaps pushBack _hqHashMap;
_sitesHashMaps pushBack _radarHashMap;
_sitesHashMaps pushBack _artyHashMap;
_sitesHashMaps pushBack _campHashMap;
_sitesHashMaps pushBack _aaHashMap;
_sitesHashMaps pushBack _tunnelHashMap;
_sitesHashMaps pushBack _waterSupplyHashMap;


/*
This is the generic code block we're going to execute in our apply call below.

Every hashmap gets processed in the same way.
*/

private _fnc_generate_safe_loc_from_hash_map = {

	// automagically generate private variables from hashmap keys + values
	// See the hashmap settings above for more info
	(values _this) params (keys _this);

	private _nSites = 1 + ceil random (_maxSites - 1);

	diag_log format [
		"INFO: Generating new sites: zone=%1 type=%2 n=%3",
		_zone,
		_name,
		_nSites,
	];

	for "_i" from 1 to (_nSites) do
	{
		private _safe_pos = [
			_position,
			_zoneRadius,
			_waterMode,
			_gradientRadius,
			_gradientDegrees,
			_terrainObjects
		] call vn_mf_fnc_sites_get_safe_location;

		// BIS_fnc_findSafePos returned debug position
		// as no suitable positions found after 100 iterations.
		// DO NOT GENERATE A SITE IN DEBUG!
		if ((count _safe_pos) == 4 ) exitWith {
			diag_log format [
				"WARNING: Could not find safe spawn location, not spawning: zone=%1 n=%2 N=%3",
				_zone,
				_i,
				_nSites
			];
			true
		};

		[_safe_pos, _zone] call _generateCode;
	};

	diag_log format [
		"INFO: Generated new sites: zone=%1 type=%2 n=%3",
		_zone,
		_name,
		_nSites,
	];

};

// generate all the sites in order of priority
_sitesHashMapsArr apply {_x call _fnc_generate_safe_loc_from_hash_map};

// add the "Tap Radio Comms" hold action to all generated radio sets
private _radios = vn_site_objects select {
	typeOf _x in ["vn_o_prop_t102e_01", "vn_o_prop_t884_01"];
};

_radios apply {_x call vn_mf_fnc_action_radiotap};
