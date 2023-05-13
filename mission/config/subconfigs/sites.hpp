// sites config

/*

Author: @dijksterhuis

!!! IMPORTANT !!!

* Every config entry is REQUIRED. Nothing is optional. *
* Setting maxSites = 0 will disable site generation for that site. *
* The order of config classes determines the order of site generation. *

Here is the reasoning behind the current order:

1. FACTORY first as it has the highest incidence rate of blowing up.
2. HQ next as it is a high priority site has a large radius.
3. RADAR next as the SAMs/Radar assets have a tendancy to blow up, but less critical than HQs/Factories.
4. ART next as mortars can go flying / get destroyed on uneven ground.
5. CAMP as less important if supply crates fall through map
6. AA as it is a single static asset and fairly safe to place.
7. TUNNEL are pretty simple. just not a massive gradient.
8. WATER SUPPLY last -- just dump them in some water nearby.

*/

class factory
{
    maxSites = 1;
    waterMode = 0;
    siteRadius = 55;
    siteMaxGradient = 5;
    generateCode = "_this call vn_mf_fnc_sites_create_factory";
    terrainObjects[] = {
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
    };
};
class hq
{
    maxSites = 1;
    waterMode = 0;
    siteRadius = 55;
    siteMaxGradient = 5;
    generateCode = "_this call vn_mf_fnc_sites_create_hq";
    terrainObjects[] = {
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
    };
};
class radar
{
    maxSites = 2;
    waterMode = 0;
    siteRadius = 65;
    siteMaxGradient = 5;
    generateCode = "_this call vn_mf_fnc_sites_create_radar";
    terrainObjects[] = {
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
    };
};
class artillery
{
    maxSites = 3;
    waterMode = 0;
    siteRadius = 20;
    siteMaxGradient = 10;
    generateCode = "_this call vn_mf_fnc_sites_create_artillery_site";
    terrainObjects[] = {
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
    };
};
class camp
{
    maxSites = 5;
    waterMode = 0;
    siteRadius = 35;
    siteMaxGradient = 8;
    generateCode = "_this call vn_mf_fnc_sites_create_camp_site";
    terrainObjects[] = {
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
    };
};
class aa
{
    maxSites = 10;
    waterMode = 0;
    siteRadius = 20;
    siteMaxGradient = 5;
    generateCode = "_this call vn_mf_fnc_sites_create_aa_site";
    terrainObjects[] = {
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
    };
};
class tunnel
{
    maxSites = 3;
    waterMode = 0;
    siteRadius = 5;
    siteMaxGradient = 20;
    generateCode = "_this call vn_mf_fnc_sites_create_tunnel_site";
    terrainObjects[] = {
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
        "WALL", 
        "ROCK", 
        "ROCKS"
    };
};
class waterSupply
{
    maxSites = 3;
    waterMode = 2;
    siteRadius = 5;
    siteMaxGradient = 20;
    generateCode = "_this call vn_mf_fnc_sites_create_water_supply_site";
    terrainObjects[] = {
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
        "WALL", 
        "ROCK", 
        "ROCKS"
    };
};
