/*
    File: fn_sites_init.sqf
    Author: Savage Game Design
    Public: Yes
    
    Description:
        Starts the sites system, which is responsible for managing all of the AI controlled installations and building new ones.
    
    Parameter(s):
        None
    
    Returns:
        None
    
    Example(s):
        [] call vn_mf_fnc_sites_init
*/

private _sitesConfig = missionConfigFile >> "gamemode" >> "sites";
private _enabledSitesConfigs = "getNumber (_x >> 'maxSites') >= 1" configClasses _sitesConfig;

vn_mf_sites_hashmaps = _enabledSitesConfigs apply {

    diag_log format ["INFO: SitesInit: Loading base site config: %1", configName _x];

    createHashMapFromArray [
        ["_type", configName _x],
        ["_maxSites", getNumber (_x >> "maxSites")],
        ["_waterMode", getNumber (_x >> "waterMode")],
        ["_siteRadius", getNumber (_x >> "siteRadius")],
        ["_siteMaxGradient", getNumber (_x >> "siteMaxGradient")],
        ["_generateCode", getText (_x >> "generateCode")],
        ["_terrainObjects", getArray (_x >> "terrainObjects")]
    ]
};

vn_mf_g_sites_partial_discovery_radius = 300;
publicVariable "vn_mf_g_sites_partial_discovery_radius";
vn_mf_g_sites_discovery_radius = 50;
publicVariable "vn_mf_g_sites_discovery_radius";
vn_mf_g_sites_scout_action_cooldown = 30;
publicVariable "vn_mf_g_sites_scout_action_cooldown";

missionNamespace setVariable ["side_sites_hq", []];
missionNamespace setVariable ["side_sites_factory", []];
missionNamespace setVariable ["current_hq", objNull];
missionNamespace setVariable ["current_factory", objNull];

missionNamespace setVariable ["sites", []];
publicVariable "sites";

private _loadSuccessful = [] call vn_mf_fnc_sites_load;

[] call vn_mf_fnc_sites_aa_reveal_targets;
