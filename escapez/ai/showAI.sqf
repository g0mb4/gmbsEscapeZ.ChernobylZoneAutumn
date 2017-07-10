private ["_mapCenter", "_mapSize", "_i"];

_mapCenter = getArray(configFile / "CfgWorlds" / worldName / "centerPosition");
_mapSize = getNumber(configFile / "CfgWorlds" / worldName / "mapSize");

// not defined
if(_mapSize == 0) then
{
	_mapSize = 9999999;
};


while { true } do
{
	_aiList = _mapCenter nearEntities ["Man", _mapSize];

	_i = 0;
	{
		if((side _x) == EAST && alive _x) then {
			_id = format ["mrkAI%1", _i];
			_m = createMarker [_id, getPos _x];
			_m setMarkerShape "ICON";
			_m setMarkerType "mil_dot";
			_m setMarkerColor "ColorRed";

			_i = _i + 1;
		};
	} forEach _aiList;

	sleep 0.5;

	_i = 0;
	{
		if((side _x) == EAST && alive _x) then {
			_id = format ["mrkAI%1", _i];
			deleteMarker _id;
			_i = _i + 1;
		};
	} forEach _aiList;

	sleep 0.5;
};
