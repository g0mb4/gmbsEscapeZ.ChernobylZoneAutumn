params["_player"];

removeAllItems _player;
removeHeadgear _player;
removeAllWeapons _player;
removeAllAssignedItems _player;
removeAllContainers _player;

if(ESCZ_loadoutUniform != "") then
{
	_player forceAddUniform ESCZ_loadoutUniform;
};

if(ESCZ_loadoutBackpack != "") then
{
	_player addBackpack ESCZ_loadoutBackpack;
};

if(ESCZ_loadoutVest != "") then
{
	_player addVest ESCZ_loadoutVest;
};

if(ESCZ_loadoutHeadgear != "") then
{
	_player addHeadgear ESCZ_loadoutHeadgear;
};

if(ESCZ_loadoutPrimaryWeapon != "") then
{
	_player addWeapon ESCZ_loadoutPrimaryWeapon;

	if(ESCZ_loadoutPrimaryMagazinesCount > 0) then
	{
		_magazines = getArray (configFile / "CfgWeapons" / ESCZ_loadoutPrimaryWeapon / "magazines");
		_magazineClass = _magazines call bis_fnc_selectRandom;

		_player addMagazines [_magazineClass, ESCZ_loadoutPrimaryMagazinesCount];
	};
};

if(ESCZ_loadoutSecondaryWeapon != "") then
{
	_player addWeapon ESCZ_loadoutSecondaryWeapon;

	if(ESCZ_loadoutSecondaryMagazinesCount > 0) then
	{
		_magazines = getArray (configFile / "CfgWeapons" / ESCZ_loadoutSecondaryWeapon / "magazines");
		_magazineClass = _magazines call bis_fnc_selectRandom;

		_player addMagazines [_magazineClass, ESCZ_loadoutSecondaryMagazinesCount];
	};
};

{
 	_player addWeapon _x;
} forEach ESCZ_loadoutTools;

{
 	_player addItem _x;
} forEach ESCZ_loadoutItems;
