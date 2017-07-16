params["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

waitUntil
{
	!isNull player;
};

player setVariable ["ESCZ_isToor", false, true];

null = [player] execVM "escapez\player\initLoadout.sqf";
null = [player] execVM "escapez\player\doublePrimary.sqf";

// first Spawn
if(isNull _oldUnit) then
{
	_pos = ["ESCZ_Editor_spawnArea"] call ESCZ_fn_getRandomPosition;

	player setPosATL _pos;
} else {
	_deathPos = getPos _oldUnit;

	_x = (_deathPos select 0) + random 500;
	_y = (_deathPos select 1) + random 500;

	player setPosATL [_x, _y, 0.2];
};

if(getPlayerUID player in ESCZ_admins) then
{
	player addAction
	[
		"toor Mode", {[player] execVM "escapez\toor\sudo.sqf" }
	];
}
