for "_i" from 1 to ESCZ_aiGroupsMedium do
{
	_sizeRnd = (ESCZ_aiInGroupMediumMax - ESCZ_aiInGroupMediumMin) + 1;
	_size = (random _sizeRnd);
	_size = _size + ESCZ_aiInGroupMediumMin;

	_pos = [ "ESCZ_Editor_enemyMedium" ] call ESCZ_fn_getRandomPosition;

	_group = [_pos, EAST, _size] call BIS_fnc_spawnGroup;
	{
		null = [_x, _pos] execVM "escapez\ai\setupAI.sqf";
	} foreach units _group;

	[_group, _pos, 500] call BIS_fnc_taskPatrol;
};

for "_i" from 1 to ESCZ_aiGroupsHard do
{
	_sizeRnd = (ESCZ_aiInGroupHardMax - ESCZ_aiInGroupHardMin) + 1;
	_size = (random _sizeRnd);
	_size = _size + ESCZ_aiInGroupHardMin;

	_pos = [ "ESCZ_Editor_enemyHard" ] call ESCZ_fn_getRandomPosition;

	_group = [_pos, EAST, _size] call BIS_fnc_spawnGroup;
	{
		null = [_x, _pos] execVM "escapez\ai\setupAI.sqf";
	} foreach units _group;

	[_group, _pos, 500] call BIS_fnc_taskPatrol;
};

if (ESCZ_showAI) then
{
	null = [] execVM "escapez\ai\showAI.sqf";
};
