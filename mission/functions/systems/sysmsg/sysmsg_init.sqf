/*
    File: sysmsg_init.sqf
    Author: dijksterhuis
    Public: No
    
    Description:
        Create the scheduler jobs for printing random messages to system chat.
    
    Parameter(s):
        None
    
    Returns:
        None
    
    Example(s):
        [] call vn_mf_fnc_sysmsg_init;
*/

// init-ing individual message scripts gets the message arrays from the script

// server rules, restart information etc.
private _admin = [] call vn_mf_sysmsg_admin_init;

// advertising units or things on discord etc.
private _adverts = [] call vn_mf_sysmsg_adverts_init;

// gameplay tutorials and/or hints
private _hints = [] call vn_mf_sysmsg_hints_init;

// BN specific information like traning and what a WLU is
private _bn = [] call vn_mf_sysmsg_bn_init;

// random easter egg messages
private _misc = [] call vn_mf_sysmsg_misc_init

private _fnc_print_random_message = {
    params ["_msgs"];
    systemChat (selectRandom _msgs);
};

// run 'admin' messages at a faster schedule to 'generic' messages
// messages should ideally not overlap, hence the weird time values

[
    "sysmsgs_admin",
    _fnc_print_random_message,
    [_admin],
    29 * 60
] call para_g_fnc_scheduler_add_job;

[
    "sysmsgs_generic",
    _fnc_print_random_message,
    [_adverts + _hints + _misc + _bn],
    47 * 60
] call para_g_fnc_scheduler_add_job;
