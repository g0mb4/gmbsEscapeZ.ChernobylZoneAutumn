private ["_pos", "_x"];

while { true; } do
{
	{
		if (alive _x && !(_x getVariable "ESCZ_isToor")) then
		{
			_pos = getPosATL _x;
			_size = (count ESCZ_radZones) - 1;
			for "_i" from 0 to _size do
			{
				_zone = ESCZ_radZones select _i;

				if (_x inArea _zone && (_pos select 2) < 3) then
				{
					    _dmg = getDammage _x;
					    _dmg = _dmg + 0.01;
					    _x setDamage _dmg;
				};

			};
		};
	} forEach allPlayers;

	sleep 0.5;
};
