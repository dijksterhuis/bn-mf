// limits and vanilla/custom trait values

/*

For default Arma 3 traits, see: https://community.bistudio.com/wiki/setUnitTrait
For default SGD Mike Force traits, search their codebase: https://github.com/Savage-Game-Design/Mike-Force/
For BN Mike Force custom traits, read the config description below and reference the associated files.

class Example
{
    name = "Example Name [Type of Unit]";
    icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Unit_Specific_Image.paa";

    // used to lookup in whitelisting DB, among other things
    shortname = "Example Name";

    // default Arma asset to load the player as when joining server for first time
    unit = "vn_b_men_army_01";

    // color of the player on map
    color = "ColorBlue";
    colorRGBA[] = {0, 0, 1, 1};

    // number of players that can take a specific role 
    // a.k.a. 6 menu training selection at duty officer
    // see defaultTraits (below) for more information on each role
    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 10;
        // this should be 0 for all BN servers (see below)
        vn_artillery = 0;
    };

    // default characteristics of players when part of this team
    class defaultTraits
    {
        // default Arma trait
        // how easy/hard it is for AI to see the player.
        camouflageCoef = 0.8;

        // default Arma trait
        // how easy/hard it is for AI to hear the player.
        audibleCoef = 0.6;

        // default Arma trait
        // stamina penalty for the player.
        loadCoef = 1;

        // default Arma trait
        // arma -- can the player repair vehicles.
        // sgd mf -- condition required for player to build structures.
        engineer = false;

        // default Arma trait
        // can the player defuse and mark mines/explosives/traps.
        explosiveSpecialist = false;

        // default Arma trait
        // can the player use Medikits on other players and themselves.
        medic = false;

        // default Arma trait
        // Ability to hack drones
        // not used in Mike Force. should be false for all units.
        UAVHacker = false;

        // SGD MF trait
        // can the player use the RTO air support module
        // should be false for all units on BN servers.
        //
        // mikeforce -- mission/config/artillery.hpp
        vn_artillery = false;

        // SGD MF trait
        // should the player be "harassed" by enemy AI units
        //
        // paradigm -- server/functions/harass/fn_harass_create_squads.sqf
        harassable = true;

        // SGD MF trait
        // can the player use the scout functionality (6 menu)
        scout = true;

        // SGD MF trait
        // are multiple objectives shown when using scout function
        scout_multiple = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};
*/


class MikeForce
{
    name = "Mike Force [Infantry]";
    icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Logo_MikeForce_HL.paa";
    shortname = "Mike Force";
    unit = "vn_b_men_army_01";
    color = "ColorBlue";
    colorRGBA[] = {0, 0, 1, 1};

    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 10;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class SpikeTeam
{
    name = "Spike Team [Special Forces]";
    icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Logo_SpikeTeam_HL.paa";
    shortname = "Spike Team";
    unit = "vn_b_men_army_01";
    color = "ColorUNKNOWN";
    colorRGBA[] = {0.7,0.6,0,1};

    class rolelimits 
    {
        medic = 40;
        engineer = 0;
        explosiveSpecialist = 20;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0.3;
        loadCoef = 0.5;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = true;
        scout_multiple = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class ACAV
{
    name = "Armored Cavalry [Ground Support]";
    icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Logo_ACAV_HL.paa";
    shortname = "ACAV";
    unit = "vn_b_men_army_01";
    color = "ColorOrange";
    colorRGBA[] = {0.85, 0.4, 0, 1};

    class rolelimits 
    {
        medic = 20;
        engineer = 40;
        explosiveSpecialist = 10;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class GreenHornets
{
    name = "Green Hornets [Air Support]";
    icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Logo_Hornets_HL.paa";
    shortname = "Green Hornets";
    unit = "vn_b_men_army_01";
    color = "ColorIndependent";
    colorRGBA[] = {0, 1, 0, 1};
    
    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 0;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class 1stMEU
{
    name = "1st Marines [1st MEU]";
    icon = "custom\taskroster\1stmeu_HL.paa";
    shortname = "3rd Marines";
    unit = "vn_b_men_army_01";
    color = "ColorBlue";
    colorRGBA[] = {0, 0.3, 0.6, 1};

    class rolelimits 
    {
        medic = 10;
        engineer = 40;
        explosiveSpecialist = 10;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class MilitaryPolice
{
    name = "Military Police [716th MP]";
    icon = "custom\taskroster\militarypolice_HL.paa";
    shortname = "Military Police";
    unit = "vn_b_men_army_01";
    color = "ColorBlue";
    colorRGBA[] = {0, 0, 1, 1};

    class rolelimits 
    {
        medic = 40;
        engineer = 20;
        explosiveSpecialist = 20;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = true;
        UAVHacker = false;
        vn_artillery = true;
        harassable = true;
        scout = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class QuarterHorse
{
    name = "Quarter Horse [1st Squadron, 4th Cav]";
    icon = "custom\taskroster\quarterhorse_HL.paa";
    shortname = "Quarter Horse";
    unit = "vn_b_men_army_01";
    color = "ColorOrange";
    colorRGBA[] = {0.85, 0.4, 0, 1};

    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class Frogmen
{
    name = "Frogmen [UDT]";
    icon = "custom\taskroster\frogmen_HL.paa";
    shortname = "Frogmen";
    unit = "vn_b_men_army_01";
    color = "ColorOrange";
    colorRGBA[] = {0.85, 0.4, 0, 1};

    class rolelimits 
    {
        medic = 20;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = true;
        scout_multiple = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class Muskets
{
    name = "Muskets [176th Gunships]";
    icon = "custom\taskroster\muskets_HL.paa";
    shortname = "Muskets";
    unit = "vn_b_men_army_01";
    color = "ColorIndependent";
    colorRGBA[] = {0, 1, 0, 1};
    
    class rolelimits 
    {
        medic = 20;
        engineer = 20;
        explosiveSpecialist = 0;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class SatansAngels
{
    name = "Satans Angels [433rd TFS]";
    icon = "custom\taskroster\satansangels_HL.paa";
    shortname = "Satans Angels";
    unit = "vn_b_men_army_01";
    color = "ColorIndependent";
    colorRGBA[] = {0, 1, 0, 1};
    
    class rolelimits 
    {
        medic = 20;
        engineer = 20;
        explosiveSpecialist = 20;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class 633rdCSG
{
    name = "Crossbow [633rd CSG]";
    icon = "custom\taskroster\633rdcombatsupportgroup_HL.paa";
    shortname = "Crossbow";
    unit = "vn_b_men_army_01";
    color = "ColorBlue";
    colorRGBA[] = {0, 1, 0, 1};
    
    class rolelimits 
    {
        medic = 30;
        engineer = 60;
        explosiveSpecialist = 30;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class 7thCAV
{
    name = "Garryowen [7th CAV]";
    icon = "custom\taskroster\7thcav_HL.paa";
    shortname = "Garryowen";
    unit = "vn_b_men_army_01";
    color = "ColorOrange";
    colorRGBA[] = {0.85, 0.4, 0, 1};
    
    class rolelimits 
    {
        medic = 30;
        engineer = 60;
        explosiveSpecialist = 30;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class TigerForce
{
    name = "Tiger Force [Recon]";
    icon = "custom\taskroster\tigerforce_HL.paa";
    shortname = "Tiger Force";
    unit = "vn_b_men_army_01";
    color = "ColorUNKNOWN";
    colorRGBA[] = {0.7,0.6,0,1};
    
    class rolelimits 
    {
        medic = 15;
        engineer = 20;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = true;
        medic = true;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = true;
        scout_multiple = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class Montagnard
{
    name = "Montagnard [5th SFG]";
    icon = "custom\taskroster\montagnard_HL.paa";
    shortname = "Montagnard";
    unit = "vn_b_men_army_01";
    color = "ColorUNKNOWN";
    colorRGBA[] = {0.7,0.6,0,1};
    
    class rolelimits 
    {
        medic = 20;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = true;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = true;
        scout_multiple = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class SASR
{
    name = "SASR";
    icon = "custom\taskroster\nzsas_HL.paa";
    shortname = "SASR";
    unit = "vn_b_men_army_01";
    color = "ColorUNKNOWN";
    colorRGBA[] = {0.7,0.6,0,1};
    
    class rolelimits 
    {
        medic = 20;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = true;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = true;
        scout_multiple = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class ARVN
{
    name = "Army of the Repulic of Vietnam";
    icon = "custom\taskroster\ARVN_HL.paa";
    shortname = "ARVNR";
    unit = "vn_b_men_army_01";
    color = "ColorUNKNOWN";
    colorRGBA[] = {0.7,0.6,0,1};

    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };

    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = true;
        scout_multiple = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class MACV
{
    name = "MACV [Command]";
    icon = "custom\taskroster\macv_HL.paa";
    shortname = "MACV";
    unit = "vn_b_men_army_01";
    color = "ColorYellow";
    colorRGBA[] = {0.85, 0.85, 0, 1};
    
    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = true;
        UAVHacker = true;
        vn_artillery = false;
        harassable = false;
        scout = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class DacCong
{
    name = "Dac Cong [Commandos]";
    icon = "custom\taskroster\daccong_team.paa";
    shortname = "Dac Cong";
    unit = "vn_b_men_army_01";
    color = "ColorOPFOR";
    colorRGBA[] = {1, 0, 0, 1};
    
    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = true;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class PressCorp
{
    name = "Press Corp [DASPO]";
    icon = "custom\taskroster\presscorp_HL.paa";
    shortname = "Press Corp";
    unit = "C_journalist_F";
    color = "ColorCIV";
    colorRGBA[] = {0.4, 0, 0.5, 1};
    
    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};