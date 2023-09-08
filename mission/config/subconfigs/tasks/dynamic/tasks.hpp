class raid_cosvn : task
{
	taskcategory = "PRI";
	tasktitle = "COSVN Raid!";
	taskname = "COSVN Raid";
	taskdesc = "Attack and hold the PAVN HQ for South Vietnam.";
	tasktype = "attack";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\p\vn_ui_mf_task_p1.jpg";
	rankpoints = 30;

	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters
	{
		stateMachineCode = "vn_mf_fnc_task_dynamic_raid_cosvn";
		timeout = -1;
	};
	class capture_radar
	{
		taskname = "Capture COSVN Radar";
		taskdesc = "25 percent of players need to be in the marked yellow circle.";
	};
	class capture_compound
	{
		taskname = "Capture COSVN Compound";
		taskdesc = "25 percent of players need to be in the marked red circle.";
	};
	class hold_radar
	{
		taskname = "Hold COSVN Radar";
		taskdesc = "25 percent of players need to stay in the marked red circle for 10 minutes. Prepare to defend yourselves!";
	};
	class hold_compound
	{
		taskname = "Hold COSVN Compound";
		taskdesc = "25 percent of players need to stay in the marked red circle for 10 minutes. Prepare to defend yourselves!";
	};
};