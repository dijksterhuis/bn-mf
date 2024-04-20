/*
    File: fn_ctf_set_flag_height_on_server_join.sqf
    Author: "DJ" Dijksterhuis
    Public: No

    Description:
        When clients join the flag height will default to 1.

        But if the game is in progress, the flag may have a different height server side.

        So change the height.

        WARNING: This is executed server side.

    Parameter(s):
        - _target -- flag we'll be raising
        - _maxProgress -- maximum number of steps to lower the flag height with

    Returns: nothing

    Example(s):
	[_target, 4] call vn_mf_fnc_ctf_opfor_lower_flag;
*/

params ["_target", "_player"];

private _serverHeight = flagAnimationPhase _target;
[_target, _serverHeight] remoteExec ["setFlagAnimationPhase", _player];
