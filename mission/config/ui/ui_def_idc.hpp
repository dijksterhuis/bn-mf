//included by "ui_def_base.inc"

//Task Roster:
#define VN_TR_MISS_PRIM 0.75, 0.33, 0.33, 0.8
#define VN_TR_MISS_SECO 0.33, 0.75, 0.33, 0.8
#define VN_TR_MISS_SUPP 0.33, 0.33, 0.75, 0.8
#define COLOR_VN_TR_ZONE1 VN_TR_MISS_PRIM
#define COLOR_VN_TR_ZONE2 VN_TR_MISS_SECO

//TaskRoster - IDD/Display
#define VN_IDD_TR_TASKROSTER				45010
//using getVariable == no "waitUntil{!isNull (findDisplay NUM)}" needed
#define VN_DISP_TR_TASKROSTER				(uinamespace getvariable ["vn_tr_disp_taskRoster_Main", DisplayNull])


#define VN_TR_USERNAME_IDC					412000
#define VN_TR_USERNAME_CTRL					(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_USERNAME_IDC)
#define VN_TR_TEAMNAME_IDC					412001
#define VN_TR_TEAMNAME_CTRL					(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_TEAMNAME_IDC)
#define VN_TR_TEAMLOGO_IDC					412002
#define VN_TR_TEAMLOGO_CTRL					(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_TEAMLOGO_IDC)
#define VN_TR_TEAMLOGO_BTN_IDC				412003
#define VN_TR_TEAMLOGO_BTN_CTRL				(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_TEAMLOGO_BTN_IDC)

//-----------------------------------------------------------------------------
// TASKROSTER: MAIN WELCOME PAGE
//-----------------------------------------------------------------------------
// TODO: some of these IDC/CTRLS can be removed now

#define VN_TR_WELCOMETITLE_IDC				428000
#define VN_TR_WELCOMETITLE_CTRL				(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_WELCOMETITLE_IDC)
#define VN_TR_WELCOMEBLURB_IDC				428001
#define VN_TR_WELCOMEBLURB_CTRL				(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_WELCOMEBLURB_IDC)
#define VN_TR_NEWBIEHELP_BTN_IDC			428002
#define VN_TR_NEWBIEHELP_BTN_CTRL			(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_NEWBIEHELP_BTN_IDC)
#define VN_TR_TEAMTEXT_BTN_IDC				428003
#define VN_TR_TEAMTEXT_BTN_CTRL				(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_TEAMTEXT_BTN_IDC)
#define VN_TR_MEDALSTEXT_BTN_IDC			428004
#define VN_TR_MEDALSTEXT_BTN_CTRL 			(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_MEDALSTEXT_BTN_IDC)
#define VN_TR_CURRTEAMTEXT_BTN_IDC			428005
#define VN_TR_CURRTEAMTEXT_BTN_CTRL 		(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_CURRTEAMTEXT_BTN_IDC)
#define VN_TR_CURRTASKSTEXT_BTN_IDC			428006
#define VN_TR_CURRTASKSTEXT_BTN_CTRL 		(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_CURRTASKSTEXT_BTN_IDC)
#define VN_TR_TASK_REQ_IDC					412004
#define VN_TR_TASK_REQ_CTRL					(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_TASK_REQ_IDC)
#define VN_TR_TASK_REQ_FLAG_IDC				412005
#define VN_TR_TASK_REQ_FLAG_CTRL			(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_TASK_REQ_FLAG_IDC)
#define VN_TR_TASK_ICON_IDC					412006
#define VN_TR_TASK_ICON_CTRL				(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_TASK_ICON_IDC)
#define VN_TR_TASK_ACTIVE_IDC				412007
#define VN_TR_TASK_ACTIVE_CTRL				(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_TASK_ACTIVE_IDC)

#define VN_TR_ZONE_A_IDC					412010
#define VN_TR_ZONE_A_CTRL					(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_ZONE_A_IDC)
#define VN_TR_ZONE_B_IDC					412011
#define VN_TR_ZONE_B_CTRL					(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_ZONE_B_IDC)

//-----------------------------------------------------------------------------
// TASKROSTER: ACTIVE TASKS SHEET
//-----------------------------------------------------------------------------
// MAIN INTERFACES
#define VN_IDD_TR_TASKINFO					412989
#define VN_DISP_TR_TASKINFO					(uinamespace getvariable ["vn_tr_disp_showTasksInfo", DisplayNull])

#define VN_TR_TASKINFO_IDC					412990
#define VN_TR_TASKINFO_CTRL					(VN_DISP_TR_TASKINFO displayCtrl VN_TR_TASKINFO_IDC)

// LEFT HAND SIDE -- The List of Parent Tasks
#define VN_TR_MISSIONLIST_IDC				413000
#define VN_TR_MISSIONLIST_CTRL				(VN_DISP_TR_TASKINFO displayCtrl VN_TR_MISSIONLIST_IDC)

// RIGHT HAND SIDE -- The Child tasks for a parent task
#define VN_TR_MISSIONSHEET_IDC				413010
#define VN_TR_MISSIONSHEET_CTRL				(VN_DISP_TR_TASKINFO displayCtrl VN_TR_MISSIONSHEET_IDC)
#define VN_TR_MISSIONSHEET_IMG_IDC			413011
#define VN_TR_MISSIONSHEET_IMG_CTRL			(VN_TR_MISSIONSHEET_CTRL controlsGroupCtrl VN_TR_MISSIONSHEET_IMG_IDC)
#define VN_TR_MISSIONSHEET_NAME_IDC			413012
#define VN_TR_MISSIONSHEET_NAME_CTRL		(VN_TR_MISSIONSHEET_CTRL controlsGroupCtrl VN_TR_MISSIONSHEET_NAME_IDC)
#define VN_TR_MISSIONSHEET_DESC_IDC			413013
#define VN_TR_MISSIONSHEET_DESC_CTRL		(VN_TR_MISSIONSHEET_CTRL controlsGroupCtrl VN_TR_MISSIONSHEET_DESC_IDC)
#define VN_TR_MISSIONSHEET_TASKS_IDC		413014
#define VN_TR_MISSIONSHEET_TASKS_CTRL		(VN_TR_MISSIONSHEET_CTRL controlsGroupCtrl VN_TR_MISSIONSHEET_TASKS_IDC)
#define VN_TR_MISSIONSHEET_COORDS_IDC		413015
#define VN_TR_MISSIONSHEET_COORDS_CTRL		(VN_TR_MISSIONSHEET_CTRL controlsGroupCtrl VN_TR_MISSIONSHEET_COORDS_IDC)
#define VN_TR_MISSION_PIC_IDC				413016
#define VN_TR_MISSION_PIC_CTRL				(VN_TR_MISSIONSHEET_CTRL controlsGroupCtrl VN_TR_MISSION_PIC_IDC)
#define VN_TR_MISSION_MAP_IDC				413017
#define VN_TR_MISSION_MAP_CTRL				(VN_TR_MISSIONSHEET_CTRL controlsGroupCtrl VN_TR_MISSION_MAP_IDC)
#define VN_TR_MISSION_ACTIVATE_IDC			413018
#define VN_TR_MISSION_ACTIVATE_CTRL			(VN_TR_MISSIONSHEET_CTRL controlsGroupCtrl VN_TR_MISSION_ACTIVATE_IDC)
#define VN_TR_MISSIONSHEET_TASKS_LIST_IDC 	413019
#define VN_TR_MISSIONSHEET_TASKS_LIST_CTRL 	(VN_TR_MISSIONSHEET_CTRL controlsGroupCtrl VN_TR_MISSIONSHEET_TASKS_LIST_IDC)

//-----------------------------------------------------------------------------
// TASKROSTER: SUPPORT REQUEST
//-----------------------------------------------------------------------------
// ONLY RIGHT HAND SIDE FOR NOW
#define VN_TR_SUPREQ_IDC					414000
#define VN_TR_SUPREQ_CTRL					(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_SUPREQ_IDC)
#define VN_TR_SUPREQ_DESC_TXT_IDC			414001
#define VN_TR_SUPREQ_DESC_TXT_CTRL			(VN_TR_SUPREQ_CTRL controlsGroupCtrl VN_TR_SUPREQ_DESC_TXT_IDC)
#define VN_TR_SUPREQ_TASK_TXT_IDC			414002
#define VN_TR_SUPREQ_TASK_TXT_CTRL			(VN_TR_SUPREQ_CTRL controlsGroupCtrl VN_TR_SUPREQ_TASK_TXT_IDC)
#define VN_TR_SUPREQ_TASK_IDC				414003
#define VN_TR_SUPREQ_TASK_CTRL				(VN_TR_SUPREQ_CTRL controlsGroupCtrl VN_TR_SUPREQ_TASK_IDC)
#define VN_TR_SUPREQ_TEAM_TXT_IDC			414004
#define VN_TR_SUPREQ_TEAM_TXT_CTRL			(VN_TR_SUPREQ_CTRL controlsGroupCtrl VN_TR_SUPREQ_TEAM_TXT_IDC)
#define VN_TR_SUPREQ_TEAM_IDC				414005
#define VN_TR_SUPREQ_TEAM_CTRL				(VN_TR_SUPREQ_CTRL controlsGroupCtrl VN_TR_SUPREQ_TEAM_IDC)
#define VN_TR_SUPREQ_SELPOS_IDC				414006
#define VN_TR_SUPREQ_SELPOS_CTRL			(VN_TR_SUPREQ_CTRL controlsGroupCtrl VN_TR_SUPREQ_SELPOS_IDC)
#define VN_TR_SUPREQ_CTASK_IDC				414007
#define VN_TR_SUPREQ_CTASK_CTRL				(VN_TR_SUPREQ_CTRL controlsGroupCtrl VN_TR_SUPREQ_CTASK_IDC)

// Support Request -- Pop Up Map + Buttons
#define VN_TR_SUPREQ_MAP_IDC				414011
#define VN_TR_SUPREQ_MAP_CTRL				(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_SUPREQ_MAP_IDC)
#define VN_TR_SUPREQ_ACCEPT_IDC				414012
#define VN_TR_SUPREQ_ACCEPT_CTRL			(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_SUPREQ_ACCEPT_IDC)
#define VN_TR_SUPREQ_ABORT_IDC				414013
#define VN_TR_SUPREQ_ABORT_CTRL				(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_SUPREQ_ABORT_IDC)

//-----------------------------------------------------------------------------
// TASKROSTER: CHARACTER/PLAYER INFO
//-----------------------------------------------------------------------------
// RIGHT HAND SIDE ONLY
#define VN_TR_CHARINFO_IDC					414100
#define VN_TR_CHARINFO_CTRL					(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_CHARINFO_IDC)
#define VN_TR_CHARINFO_BTN_A_IDC			414101
#define VN_TR_CHARINFO_BTN_A_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_BTN_A_IDC)
#define VN_TR_CHARINFO_NAME_IDC				414102
#define VN_TR_CHARINFO_NAME_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_NAME_IDC)
#define VN_TR_CHARINFO_SNUM_IDC				414103
#define VN_TR_CHARINFO_SNUM_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_SNUM_IDC)
#define VN_TR_CHARINFO_RANK_IDC				414104
#define VN_TR_CHARINFO_RANK_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RANK_IDC)
#define VN_TR_CHARINFO_TASK_IDC				414105
#define VN_TR_CHARINFO_TASK_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_TASK_IDC)
// no longer in use becuase people can look at the map o_0
#define VN_TR_CHARINFO_WORLD_IDC			414106
#define VN_TR_CHARINFO_WORLD_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_WORLD_IDC)
#define VN_TR_CHARINFO_POINTS_IDC			414107
#define VN_TR_CHARINFO_POINTS_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_POINTS_IDC)
#define VN_TR_CHARINFO_PROGR_IDC			414108
#define VN_TR_CHARINFO_PROGR_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_PROGR_IDC)
// @dijksterhuis custom
#define VN_TR_CHARINFO_TITLE_IDC			414151
#define VN_TR_CHARINFO_TITLE_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_TITLE_IDC)
#define VN_TR_CHARINFO_UID_IDC				414152
#define VN_TR_CHARINFO_UID_CTRL				(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_UID_IDC)
#define VN_TR_CHARINFO_KILLS_IDC			414153
#define VN_TR_CHARINFO_KILLS_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_KILLS_IDC)
#define VN_TR_CHARINFO_DEATHS_IDC			414154
#define VN_TR_CHARINFO_DEATHS_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_DEATHS_IDC)

#define VN_TR_CHARINFO_REWARD_TEXT_IDC		414109
#define VN_TR_CHARINFO_REWARD_TEXT_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_REWARD_TEXT_IDC)

#define VN_TR_CHARINFO_MEDAL_1_IDC			414110
#define VN_TR_CHARINFO_MEDAL_1_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_MEDAL_1_IDC)
#define VN_TR_CHARINFO_MEDAL_2_IDC			414111
#define VN_TR_CHARINFO_MEDAL_2_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_MEDAL_2_IDC)
#define VN_TR_CHARINFO_MEDAL_3_IDC			414112
#define VN_TR_CHARINFO_MEDAL_3_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_MEDAL_3_IDC)
#define VN_TR_CHARINFO_MEDAL_4_IDC			414113
#define VN_TR_CHARINFO_MEDAL_4_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_MEDAL_4_IDC)
#define VN_TR_CHARINFO_MEDAL_5_IDC			414114
#define VN_TR_CHARINFO_MEDAL_5_CTRL			(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_MEDAL_5_IDC)

#define VN_TR_CHARINFO_RIBBON_1_IDC			414115
#define VN_TR_CHARINFO_RIBBON_1_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_1_IDC)
#define VN_TR_CHARINFO_RIBBON_2_IDC			414116
#define VN_TR_CHARINFO_RIBBON_2_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_2_IDC)
#define VN_TR_CHARINFO_RIBBON_3_IDC			414117
#define VN_TR_CHARINFO_RIBBON_3_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_3_IDC)
#define VN_TR_CHARINFO_RIBBON_4_IDC			414118
#define VN_TR_CHARINFO_RIBBON_4_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_4_IDC)
#define VN_TR_CHARINFO_RIBBON_5_IDC			414119
#define VN_TR_CHARINFO_RIBBON_5_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_5_IDC)
#define VN_TR_CHARINFO_RIBBON_6_IDC			414120
#define VN_TR_CHARINFO_RIBBON_6_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_6_IDC)
#define VN_TR_CHARINFO_RIBBON_7_IDC			414121
#define VN_TR_CHARINFO_RIBBON_7_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_7_IDC)
#define VN_TR_CHARINFO_RIBBON_8_IDC			414122
#define VN_TR_CHARINFO_RIBBON_8_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_8_IDC)
#define VN_TR_CHARINFO_RIBBON_9_IDC			414123
#define VN_TR_CHARINFO_RIBBON_9_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_9_IDC)
#define VN_TR_CHARINFO_RIBBON_10_IDC		414124
#define VN_TR_CHARINFO_RIBBON_10_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_10_IDC)
#define VN_TR_CHARINFO_RIBBON_11_IDC		414125
#define VN_TR_CHARINFO_RIBBON_11_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_11_IDC)
#define VN_TR_CHARINFO_RIBBON_12_IDC		414126
#define VN_TR_CHARINFO_RIBBON_12_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_12_IDC)
#define VN_TR_CHARINFO_RIBBON_13_IDC		414127
#define VN_TR_CHARINFO_RIBBON_13_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_13_IDC)
#define VN_TR_CHARINFO_RIBBON_14_IDC		414128
#define VN_TR_CHARINFO_RIBBON_14_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_14_IDC)
#define VN_TR_CHARINFO_RIBBON_15_IDC		414129
#define VN_TR_CHARINFO_RIBBON_15_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_15_IDC)
#define VN_TR_CHARINFO_RIBBON_16_IDC		414130
#define VN_TR_CHARINFO_RIBBON_16_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_16_IDC)
#define VN_TR_CHARINFO_RIBBON_17_IDC		414131
#define VN_TR_CHARINFO_RIBBON_17_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_17_IDC)
#define VN_TR_CHARINFO_RIBBON_18_IDC		414132
#define VN_TR_CHARINFO_RIBBON_18_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_18_IDC)
#define VN_TR_CHARINFO_RIBBON_19_IDC		414133
#define VN_TR_CHARINFO_RIBBON_19_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_19_IDC)
#define VN_TR_CHARINFO_RIBBON_20_IDC		414134
#define VN_TR_CHARINFO_RIBBON_20_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_20_IDC)

#define VN_TR_CHARINFO_RIBBON_21_IDC		414135
#define VN_TR_CHARINFO_RIBBON_21_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_21_IDC)
#define VN_TR_CHARINFO_RIBBON_22_IDC		414136
#define VN_TR_CHARINFO_RIBBON_22_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_22_IDC)
#define VN_TR_CHARINFO_RIBBON_23_IDC		414137
#define VN_TR_CHARINFO_RIBBON_23_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_23_IDC)
#define VN_TR_CHARINFO_RIBBON_24_IDC		414138
#define VN_TR_CHARINFO_RIBBON_24_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_24_IDC)
#define VN_TR_CHARINFO_RIBBON_25_IDC		414139
#define VN_TR_CHARINFO_RIBBON_25_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_25_IDC)
#define VN_TR_CHARINFO_RIBBON_26_IDC		414140
#define VN_TR_CHARINFO_RIBBON_26_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_26_IDC)
#define VN_TR_CHARINFO_RIBBON_27_IDC		414141
#define VN_TR_CHARINFO_RIBBON_27_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_27_IDC)
#define VN_TR_CHARINFO_RIBBON_28_IDC		414142
#define VN_TR_CHARINFO_RIBBON_28_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_28_IDC)
#define VN_TR_CHARINFO_RIBBON_29_IDC		414143
#define VN_TR_CHARINFO_RIBBON_29_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_29_IDC)
#define VN_TR_CHARINFO_RIBBON_30_IDC		414144
#define VN_TR_CHARINFO_RIBBON_30_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_30_IDC)
#define VN_TR_CHARINFO_RIBBON_31_IDC		414145
#define VN_TR_CHARINFO_RIBBON_31_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_31_IDC)
#define VN_TR_CHARINFO_RIBBON_32_IDC		414146
#define VN_TR_CHARINFO_RIBBON_32_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_32_IDC)
#define VN_TR_CHARINFO_RIBBON_33_IDC		414147
#define VN_TR_CHARINFO_RIBBON_33_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_33_IDC)
#define VN_TR_CHARINFO_RIBBON_34_IDC		414148
#define VN_TR_CHARINFO_RIBBON_34_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_34_IDC)
#define VN_TR_CHARINFO_RIBBON_35_IDC		414149
#define VN_TR_CHARINFO_RIBBON_35_CTRL		(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_RIBBON_35_IDC)

#define VN_TR_CHARINFO_MEDAL_RIBBON_IDC		414150
#define VN_TR_CHARINFO_MEDAL_RIBBON_CTRL	(VN_TR_CHARINFO_CTRL controlsGroupCtrl VN_TR_CHARINFO_MEDAL_RIBBON_IDC)

//-----------------------------------------------------------------------------
// TASKROSTER: BLANK SHEET
//-----------------------------------------------------------------------------
// For clearing the right sheet
#define VN_TR_BLANKSHEET_RHS_IDC			414188
#define VN_TR_BLANKSHEET_RHS_CTRL			(VN_DISP_TR_TASKROSTER displayCtrl VN_TR_BLANKSHEET_RHS_IDC)

//-----------------------------------------------------------------------------
// TASKROSTER: PLAYER TEAM INFO AND ROLES
//-----------------------------------------------------------------------------
// Previously called MAIN INFO SHEET
// main IDCs/CTRLS
#define VN_IDD_TR_SHOWTEAMINFO				414199
#define VN_DISP_TR_SHOWTEAMINFO				(uinamespace getvariable ["vn_tr_disp_showTeamInfo", DisplayNull])

// RIGHT HAND SIDE MAIN DISPLAY GROUP
#define VN_TR_MAININFO_IDC					414200
#define VN_TR_MAININFO_CTRL					(VN_DISP_TR_SHOWTEAMINFO displayCtrl VN_TR_MAININFO_IDC)

// RIGHT HAND SIDE ELEMENTS
#define VN_TR_MAININFO_IMG_IDC				414201
#define VN_TR_MAININFO_IMG_CTRL				(VN_TR_MAININFO_CTRL controlsGroupCtrl VN_TR_MAININFO_IMG_IDC)
#define VN_TR_MAININFO_TXT_TOP_IDC			414202
#define VN_TR_MAININFO_TXT_TOP_CTRL			(VN_TR_MAININFO_CTRL controlsGroupCtrl VN_TR_MAININFO_TXT_TOP_IDC)
#define VN_TR_MAININFO_TXT_MID_IDC			414203
#define VN_TR_MAININFO_TXT_MID_CTRL			(VN_TR_MAININFO_CTRL controlsGroupCtrl VN_TR_MAININFO_TXT_MID_IDC)
#define VN_TR_MAININFO_CHANGETEAM_BTN_IDC	414204
#define VN_TR_MAININFO_CHANGETEAM_BTN_CTRL	(VN_TR_MAININFO_CTRL controlsGroupCtrl VN_TR_MAININFO_CHANGETEAM_BTN_IDC)
#define VN_TR_MAININFO_GRP_ROLESHEADER_IDC 	414205
#define VN_TR_MAININFO_GRP_ROLESHEADER_CTRL (VN_TR_MAININFO_CTRL controlsGroupCtrl VN_TR_MAININFO_GRP_ROLESHEADER_IDC)
#define VN_TR_MAININFO_GRP_ROLES_IDC 		414206
#define VN_TR_MAININFO_GRP_ROLES_CTRL 		(VN_TR_MAININFO_CTRL controlsGroupCtrl VN_TR_MAININFO_GRP_ROLES_IDC)
// @dijksterhuis custom
#define VN_TR_MAININFO_GRP_TITLE_IDC	 	414209
#define VN_TR_MAININFO_TITLE_CTRL		 	(VN_TR_MAININFO_CTRL controlsGroupCtrl VN_TR_MAININFO_GRP_TITLE_IDC)

// LEFT HAND SIDE ELEMENTS
#define VN_TR_SHOWTEAM_LHS_LOGO_IDC				414210
#define VN_TR_SHOWTEAM_LHS_LOGO_CTRL			(VN_DISP_TR_SHOWTEAMINFO displayCtrl VN_TR_SHOWTEAM_LHS_LOGO_IDC)
// note: title might not be needed as an IDC/ctrl pair as it's static
#define VN_TR_SHOWTEAM_LHS_TITLE_IDC			414211
#define VN_TR_SHOWTEAM_LHS_TITLE_CTRL			(VN_DISP_TR_SHOWTEAMINFO displayCtrl VN_TR_SHOWTEAM_LHS_TITLE_IDC)
#define VN_TR_SHOWTEAM_LHS_TEAMNAME_IDC			414212
#define VN_TR_SHOWTEAM_LHS_TEAMNAME_CTRL		(VN_DISP_TR_SHOWTEAMINFO displayCtrl VN_TR_SHOWTEAM_LHS_TEAMNAME_IDC)
#define VN_TR_SHOWTEAM_LHS_DESC_IDC				414213
#define VN_TR_SHOWTEAM_LHS_DESC_CTRL			(VN_DISP_TR_SHOWTEAMINFO displayCtrl VN_TR_SHOWTEAM_LHS_DESC_IDC)
#define VN_TR_MAININFO_LHS_ROLELIMITSHEADER_IDC	414214
#define VN_TR_MAININFO_LHS_ROLELIMITSHEADER_CTRL (VN_DISP_TR_SHOWTEAMINFO displayCtrl VN_TR_MAININFO_LHS_ROLELIMITSHEADER_IDC)
#define VN_TR_MAININFO_LHS_ROLELIMITS_IDC		414215
#define VN_TR_MAININFO_LHS_ROLELIMITS_CTRL		(VN_DISP_TR_SHOWTEAMINFO displayCtrl VN_TR_MAININFO_LHS_ROLELIMITS_IDC)
#define VN_TR_MAININFO_GRP_PLAYERSHEADER_IDC 	414216
#define VN_TR_MAININFO_GRP_PLAYERSHEADER_CTRL	(VN_DISP_TR_SHOWTEAMINFO displayCtrl VN_TR_MAININFO_GRP_PLAYERSHEADER_IDC)
#define VN_TR_MAININFO_GRP_PLAYERS_IDC 			414217
#define VN_TR_MAININFO_GRP_PLAYERS_CTRL 		(VN_DISP_TR_SHOWTEAMINFO displayCtrl VN_TR_MAININFO_GRP_PLAYERS_IDC)

//-----------------------------------------------------------------------------
// TASKROSTER: TEAM SELECTION
//-----------------------------------------------------------------------------
#define VN_IDD_TR_SELECTTEAM						45001
#define VN_DISP_TR_SELECTTEAM						(uinamespace getvariable ["vn_tr_disp_selectTeam", DisplayNull])

// LEFT HAND SIDE ELEMENTS
#define VN_TR_SELECTTEAM_TEAM_LOGO_IDC				45010
#define VN_TR_SELECTTEAM_TEAM_LOGO_CTRL				(VN_DISP_TR_SELECTTEAM displayCtrl VN_TR_SELECTTEAM_TEAM_LOGO_IDC)
#define VN_TR_SELECTTEAM_TEAM_DESC_IDC				45011
#define VN_TR_SELECTTEAM_TEAM_DESC_CTRL				(VN_DISP_TR_SELECTTEAM displayCtrl VN_TR_SELECTTEAM_TEAM_DESC_IDC)
#define VN_TR_SELECTTEAM_TEAM_TEXT_IDC				45012
#define VN_TR_SELECTTEAM_TEAM_TEXT_CTRL				(VN_DISP_TR_SELECTTEAM displayCtrl VN_TR_SELECTTEAM_TEAM_TEXT_IDC)

// RIGHT HAND SIDE DISPLAY GROUP
#define VN_TR_SELECTTEAM_TEAM_SELECTION_IDC			45020
#define VN_TR_SELECTTEAM_TEAM_SELECTION_CTRL		(VN_DISP_TR_SELECTTEAM displayCtrl VN_TR_SELECTTEAM_TEAM_SELECTION_IDC)

// RIGHT HAND SIDE ELEMENTS
#define VN_TR_SELECTTEAM_TEAM_NAME_IDC				45021
#define VN_TR_SELECTTEAM_TEAM_NAME_CTRL				(VN_TR_SELECTTEAM_TEAM_SELECTION_CTRL controlsGroupCtrl VN_TR_SELECTTEAM_TEAM_NAME_IDC)
#define VN_TR_SELECTTEAM_TEAM_TEXT_BOTTOM_IDC		45022
#define VN_TR_SELECTTEAM_TEAM_TEXT_BOTTOM_CTRL		(VN_TR_SELECTTEAM_TEAM_SELECTION_CTRL controlsGroupCtrl VN_TR_SELECTTEAM_TEAM_TEXT_BOTTOM_IDC)
#define VN_TR_SELECTTEAM_TEAM_LOGO_TL_IDC			45023
#define VN_TR_SELECTTEAM_TEAM_LOGO_TL_CTRL			(VN_TR_SELECTTEAM_TEAM_SELECTION_CTRL controlsGroupCtrl VN_TR_SELECTTEAM_TEAM_LOGO_TL_IDC)
#define VN_TR_SELECTTEAM_TEAM_LOGO_TR_IDC			45024
#define VN_TR_SELECTTEAM_TEAM_LOGO_TR_CTRL			(VN_TR_SELECTTEAM_TEAM_SELECTION_CTRL controlsGroupCtrl VN_TR_SELECTTEAM_TEAM_LOGO_TR_IDC)
#define VN_TR_SELECTTEAM_TEAM_LOGO_BL_IDC			45025
#define VN_TR_SELECTTEAM_TEAM_LOGO_BL_CTRL			(VN_TR_SELECTTEAM_TEAM_SELECTION_CTRL controlsGroupCtrl VN_TR_SELECTTEAM_TEAM_LOGO_BL_IDC)
#define VN_TR_SELECTTEAM_TEAM_LOGO_BR_IDC			45026
#define VN_TR_SELECTTEAM_TEAM_LOGO_BR_CTRL			(VN_TR_SELECTTEAM_TEAM_SELECTION_CTRL controlsGroupCtrl VN_TR_SELECTTEAM_TEAM_LOGO_BR_IDC)
#define VN_TR_SELECTTEAM_TEAM_PLAYERCOUNT_IDC		45027
#define VN_TR_SELECTTEAM_TEAM_PLAYERCOUNT_CTRL		(VN_TR_SELECTTEAM_TEAM_SELECTION_CTRL controlsGroupCtrl VN_TR_SELECTTEAM_TEAM_PLAYERCOUNT_IDC)

#define VN_TR_SELECTTEAM_ACCEPT_IDC					45028
#define VN_TR_SELECTTEAM_ACCEPT_CTRL				(VN_DISP_TR_SELECTTEAM displayCtrl VN_TR_SELECTTEAM_ACCEPT_IDC)

//-----------------------------------------------------------------------------
// NON TASK ROSTER
//-----------------------------------------------------------------------------

//Infopanel
#define VN_IDD_MF_INFOPANEL								47000
#define VN_DISP_MF_INFOPANEL							(uiNamespace getVariable ["para_infopanel",DisplayNull])


#define VN_MF_INFOPANEL_MAIN_IDC						5000
#define VN_MF_INFOPANEL_MAIN_CTRL						(VN_DISP_MF_INFOPANEL displayCtrl VN_MF_INFOPANEL_MAIN_IDC)

#define VN_MF_INFOPANEL_MAIN_TXT_IDC					2000
#define VN_MF_INFOPANEL_MAIN_TXT_CTRL					(VN_MF_INFOPANEL_MAIN_CTRL controlsGroupCtrl VN_MF_INFOPANEL_MAIN_TXT_IDC)
#define VN_MF_INFOPANEL_MAIN_IMG_IDC					2001
#define VN_MF_INFOPANEL_MAIN_IMG_CTRL					(VN_MF_INFOPANEL_MAIN_CTRL controlsGroupCtrl VN_MF_INFOPANEL_MAIN_IMG_IDC)

// #define VN_MF_INFOPANEL_QUICK_MAIN_IDC					2100
#define VN_MF_INFOPANEL_QUICK_CTRL(QUICK_TEMP_IDC)		(VN_DISP_MF_INFOPANEL displayCtrl QUICK_TEMP_IDC)

#define VN_MF_INFOPANEL_QUICK_TXT_IDC					2101
#define VN_MF_INFOPANEL_QUICK_TXT_CTRL(QUICK_TEMP_IDC)	(VN_MF_INFOPANEL_QUICK_CTRL(QUICK_TEMP_IDC) controlsGroupCtrl VN_MF_INFOPANEL_QUICK_TXT_IDC)

// Example display
#define VN_MF_IDD_RSCDISPLAYEXAMPLE 48000
#define VN_MF_RSCDISPLAYEXAMPLE_LT_IDC 100
#define VN_MF_RSCDISPLAYEXAMPLE_CT_IDC 101
#define VN_MF_RSCDISPLAYEXAMPLE_RT_IDC 102
#define VN_MF_RSCDISPLAYEXAMPLE_LM_IDC 103
#define VN_MF_RSCDISPLAYEXAMPLE_CM_IDC 104
#define VN_MF_RSCDISPLAYEXAMPLE_RM_IDC 105
#define VN_MF_RSCDISPLAYEXAMPLE_LB_IDC 106
#define VN_MF_RSCDISPLAYEXAMPLE_CB_IDC 107
#define VN_MF_RSCDISPLAYEXAMPLE_RB_IDC 108
