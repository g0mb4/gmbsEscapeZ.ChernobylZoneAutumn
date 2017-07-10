private ["_ctr", "_dead", "_alive", "_x", "_cnt", "_gameRunning"];

_gameRunning = true;

while { _gameRunning; } do
{
	_ctr = 0;
	_dead = 0;

	_justPlayers = allPlayers - entities "HeadlessClient_F";
	_cnt = count _justPlayers;

	{
		if (alive _x) then
		{
			_pos = getPosATL _x;

			if (_x inArea "ESCZ_Editor_escape" && (_pos select 2) < 3) then
			{
				_ctr = _ctr + 1;
			};
		} else {
			_ctr = _ctr + 1;
			_dead = _dead + 1;
		};

	} forEach _justPlayers;

	if (_ctr == _cnt && _dead != _cnt) then
	{
		_gameRunning = false;
		"EveryoneWon" call BIS_fnc_endMissionServer;
	};

	if ( _dead == _cnt) then
	{
		_gameRunning = false;
		"EveryoneLost" call BIS_fnc_endMissionServer;
	};

	sleep 1;
};
