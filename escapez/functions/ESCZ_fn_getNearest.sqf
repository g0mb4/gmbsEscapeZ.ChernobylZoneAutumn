params["_unit", "_units"];
private["_nearest", "_nearestDist"];

_nearest = objNull;
_nearestDist = 10000;

{
	_dist = _unit distance _x;
	if (_dist < _nearestDist) then
	{
		_nearest = _x;
		_nearestDist = _dist;
	};
} forEach _units;

_nearest;
