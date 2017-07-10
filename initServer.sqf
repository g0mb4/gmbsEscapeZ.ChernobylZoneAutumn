#include "config.hpp"
#include "lootTables.hpp"
#include "ryanClasses.hpp"

ESCZ_fn_getRandomPosition = compileFinal preprocessFileLineNumbers "escapez\functions\ESCZ_fn_getRandomPositionRectangleMarker.sqf";
ESCZ_fn_zombieHandler = compileFinal preprocessFileLineNumbers "escapez\functions\ESCZ_fn_zombieHandler.sqf";
ESCZ_fn_getNearest = compileFinal preprocessFileLineNumbers "escapez\functions\ESCZ_fn_getNearest.sqf";

null = [] execVM "escapez\world\spawnLoot.sqf";
systemChat "Loot spawned.";

null = [] execVM "escapez\world\spawnHelis.sqf";
systemChat "Helis spawned.";

null = [] execVM "escapez\world\spawnJeep.sqf";
systemChat "Jeep spawned.";

null = [] execVM "escapez\world\radiation.sqf";
systemChat "Radiation started.";

if (ESCZ_enableAI) then
{
	null = [] execVM "escapez\ai\spawnAI.sqf";
	systemChat "Enemy spawned.";
};

if (ESCZ_enableZombies) then
{
	null = [] execVM "escapez\zombies\spawnZombies.sqf";
	systemChat "Zombies spawned.";
};

null = [] execVM "escapez\world\escaped.sqf";
