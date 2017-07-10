private ["_houseList"];

_mapCenter = getArray(configFile / "CfgWorlds" / worldName / "centerPosition");
_mapSize = getNumber(configFile / "CfgWorlds" / worldName / "mapSize");

// not defined
if(_mapSize == 0) then
{
	_mapSize = 9999999;
};

_houseList = _mapCenter nearObjects ["House", _mapSize];

{
	_house = _x;

	for "_n" from 0 to 50 do {
		_buildingPos = _house buildingpos _n;

		if (str _buildingPos == "[0,0,0]")
			exitwith {};

		if (ESCZ_lootProbability > random 100) then
		{
			[_buildingPos] execVM "escapez\world\makeLoot.sqf";
		};
	};
} foreach _houseList;
