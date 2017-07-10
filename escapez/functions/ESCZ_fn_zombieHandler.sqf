_zombie = _this select 0;
_difficulty = _this select 1;

_zombie disableAI "FSM";
_zombie disableAI "AUTOTARGET";
_zombie disableAI "TARGET";
_zombie setBehaviour "CARELESS";
_zombie disableConversation true;
_zombie addRating -5000;	// for the scoring
_zombie setVariable ["ESCZ_difficulty", _difficulty];

// for controlling the total amount of zombies
_zombie addEventHandler ["killed", {
	params["_unit", "_killer"];

	_difficulty = _unit getVariable ["ESCZ_difficulty", "easy"];

	if(isPlayer _killer) then
	{
		if (_difficulty isEqualTo "easy") then
		{
			zombiesEasyCtr = zombiesEasyCtr + 1;
		};

		if (_difficulty isEqualTo "medium") then
		{
			zombiesMediumCtr = zombiesMediumCtr + 1;
		};

		if (_difficulty isEqualTo "hard") then
		{
			zombiesHardCtr = zombiesHardCtr + 1;
		};
	};
}];

_rnd = floor random 10;

// injured
if( _rnd < 5) then
{
	_zombie setDammage 0.5;
};

if (_difficulty isEqualTo "easy") then
{
	zombiesEasy = zombiesEasy + [_zombie];
};

if (_difficulty isEqualTo "medium") then
{
	zombiesMedium = zombiesMedium + [_zombie];
};

if (_difficulty isEqualTo "hard") then
{
	zombiesHard = zombiesHard + [_zombie];
};

while { alive _zombie; } do
{
	_unitsAround = allPlayers - entities "HeadlessClient_F";

	_targets = [];

	{
		if (alive _x && isPlayer _x && _zombie distance _x < 160) then
		{
			_targets = _targets + [_x];
		};
	} foreach _unitsAround;

	if (count _targets > 0) then
	{
		_target = [_zombie, _targets] call ESCZ_fn_getNearest;

		if (_zombie distance _target < 160) then
		{
			_zombie doMove getPosATL _target;
		};

		if (_zombie distance _target < 1.5) then
		{
			_zombie switchMove "AwopPercMstpSgthWnonDnon_end";
			_target setDamage (damage _target + (ESCZ_zombieDamage / 100));
			sleep 1.5;
		};
	} else {
		_zombie setDammage 1;
		sleep 5;
	};

	sleep 0.5;
};

if (_difficulty isEqualTo "easy") then
{
	zombiesEasy = zombiesEasy - [_zombie];
};

if (_difficulty isEqualTo "medium") then
{
	zombiesMedium = zombiesMedium - [_zombie];
};

if (_difficulty isEqualTo "hard") then
{
	zombiesHard = zombiesHard - [_zombie];
};

deletevehicle _zombie;
