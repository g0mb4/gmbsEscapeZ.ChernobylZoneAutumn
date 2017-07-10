#include "config.hpp"

waitUntil
{
	!isNull player;
};
ESCZ_fn_getRandomPosition = compileFinal preprocessFileLineNumbers "escapez\functions\ESCZ_fn_getRandomPositionRectangleMarker.sqf";

player setVariable ["ESCZ_isToor", false, true];

null = [player] execVM "escapez\player\initLoadout.sqf";
null = [player] execVM "escapez\player\doublePrimary.sqf";

_pos = ["ESCZ_Editor_spawnArea"] call ESCZ_fn_getRandomPosition;

player setPosATL _pos;

player addAction
[
	"Suicide", { player setDamage 1}
];

if(getPlayerUID player in ESCZ_admins) then
{
	player addAction
	[
		"toor Mode", {[player] execVM "escapez\toor\sudo.sqf" }
	];
}
