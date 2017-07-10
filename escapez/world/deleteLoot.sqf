_mapCenter = getArray(configFile / "CfgWorlds" / worldName / "centerPosition");
_mapSize = getNumber(configFile / "CfgWorlds" / worldName / "mapSize");

// not defined
if(_mapSize == 0) then
{
	_mapSize = 9999999;
};

_lootList = _mapCenter nearObjects ["weaponholder", _mapSize];
{
	_loot = _x;
	deleteVehicle (_loot);

	if(ESC_showLoot) then {
		_id = format ["mrk%1", getPos _loot];
		deleteMarker _id;
	};
} foreach _lootList;
