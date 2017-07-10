zombieSide = createCenter civilian;
zombieGroup = createGroup civilian;
zombiesEasy = [];
zombiesMedium = [];
zombiesHard = [];

zombiesEasyCtr = 0;
zombiesMediumCtr = 0;
zombiesHardCtr = 0;

if (ESCZ_showZombies) then
{
	null = [] execVM "escapez\zombies\showZombies.sqf";
};

while { true; } do
{
	_justPlayers = allPlayers - entities "HeadlessClient_F";
	_playersInEasy = false;
	_playersInMedium = false;
	_playersInHard = false;

	{
		if( _x inArea "ESCZ_Editor_enemyEasy") then
		{
			_playersInEasy = true;
		};

		if( _x inArea "ESCZ_Editor_enemyMedium") then
		{
			_playersInMedium = true;
		};

		if( _x inArea "ESCZ_Editor_enemyHard") then
		{
			_playersInHard = true;
		};
	} forEach _justPlayers;

	if( count zombiesEasy < ESCZ_ZombiesEasy && zombiesEasyCtr < ESCZ_maxZombiesEasy &&_playersInEasy ) then
	{
		_pos = [ "ESCZ_Editor_enemyEasy" ] call ESCZ_fn_getRandomPosition;
		_type = ESCZ_zombies call BIS_fnc_selectRandom;
		_type createUnit [_pos, zombieGroup, "[this, 'easy'] spawn ESCZ_fn_zombieHandler;"];
	};

	if( count zombiesMedium < ESCZ_ZombiesMedium && zombiesMediumCtr < ESCZ_maxZombiesMedium && _playersInMedium) then
	{
		_pos = [ "ESCZ_Editor_enemyMedium" ] call ESCZ_fn_getRandomPosition;
		_type = ESCZ_zombies call BIS_fnc_selectRandom;
		_type createUnit [_pos, zombieGroup, "[this, 'medium'] spawn ESCZ_fn_zombieHandler;"];
	};

	if( count zombiesHard < ESCZ_ZombiesHard && zombiesHardCtr < ESCZ_maxZombiesHard && _playersInHard ) then
	{
		_pos = [ "ESCZ_Editor_enemyHard" ] call ESCZ_fn_getRandomPosition;
		_type = ESCZ_zombies call BIS_fnc_selectRandom;
		_type createUnit [_pos, zombieGroup, "[this, 'hard'] spawn ESCZ_fn_zombieHandler;"];
	};

	if(!_playersInEasy) then
	{
		{
			deletevehicle _x;
			zombiesEasy = zombiesEasy - [_x];
		} forEach zombiesEasy;
	};

	if(!_playersInMedium) then
	{
		{
			deletevehicle _x;
			zombiesMedium = zombiesMedium - [_x];
		} forEach zombiesMedium;
	};

	if(!_playersInHard) then
	{
		{
			deletevehicle _x;
			zombiesHard = zombiesHard - [_x];
		} forEach zombiesHard;
	};

	sleep 0.1;
};
