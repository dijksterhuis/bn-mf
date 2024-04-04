/*
	File: fn_dac_cong_ctf_init.sqf
	Author: 'DJ' Dijksterhuis
	Public: Yes

	Description:
		Initialise the 'Capture the Flag' system for Dac Cong.
		Basically just init an empty array as a publicVariable.

	Parameter(s): none

	Returns: nothing

	Example(s):
		[] call vn_mf_fnc_dac_cong_ctf_init
*/

vn_mf_bn_dc_ctf_flags = [];
publicVariable "vn_mf_bn_dc_ctf_flags";

["bn_dc_ctf_flag_updater", vn_mf_fnc_dac_cong_ctf_flag_update_job, [], 187] call para_g_fnc_scheduler_add_job;
