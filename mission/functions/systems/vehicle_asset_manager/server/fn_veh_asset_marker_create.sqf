/*
	File: fn_veh_asset_marker_create.sqf
	Author: Savage Game Design
	Public: No

	Description:
		Creates a marker of the specific type for every player, localized. Replaces any previous markers.

	Parameter(s):
		_spawnPoint - Spawn point to create the marker for [HashMap]
		_type - Type of marker [String]

	Returns: nothing

	Example(s): none
*/


params ["_spawnPoint", "_type"];

private _vehicle = _spawnPoint getOrDefault ["currentVehicle", objNull];

private _textGenerator = [
	[_type, _vehicle],
	{
		params ["_type", "_vehicle"];
		private _markerPrefix = "";
		if (_type == "WRECK") then {
			_markerPrefix = localize "STR_vn_mf_wreck";
		};

		if (_type == "IDLE") then {
			_markerPrefix = localize "STR_vn_mf_idle";
		};

		if (_type == "DISABLED") then {
			_markerPrefix = localize "STR_vn_mf_disabled";
		};

		private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
		if(_vehicleName == "MH-9 Hummingbird" || _vehicleName == "AH-9 Pawnee") then 
		{
			_vehicleName = "YOH-6A";

			switch(vehicleVarName _vehicle) do
			{
				case "cmd1" : {_vehicleName = "CMD-1"; };
				case "mp1"  : {_vehicleName = "MP-1"; };
			};
		};

		format [
			"%1: %2",
			_markerPrefix,
			_vehicleName
		]
	}
];

private _markerName = format ["marker_%1", _spawnPoint get "id"];
[_markerName, getPos _vehicle, _textGenerator] call para_g_fnc_create_localized_marker;

_markerName setMarkerType "mil_marker";

if (_type in ["WRECK", "DISABLED"]) then {
	_markerName setMarkerColor "ColorRed";
} else {
	_markerName setMarkerColor "ColorBlue";
};

_spawnPoint set ["marker", _markerName];