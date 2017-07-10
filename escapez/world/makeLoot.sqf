params["_pos"];

_pos0 =	(_pos select 0);
_pos1 =	(_pos select 1);
_pos2 =	(_pos select 2);

// spawn barrel to avoid mid-air loot
_barrel = createVehicle ["Land_BarrelEmpty_F",[_pos0, _pos1, _pos2 + 0.4], [], 0, "can_Collide"];
sleep 0.8;
_holder = createVehicle ["groundweaponholder",[_pos0, _pos1, (getposATL _barrel select 2)], [], 0, "can_Collide"];
deletevehicle _barrel;

_type = floor (random 7);

if (ESCZ_showLoot) then
{
	_id = format ["mrk%1", getPos _holder];
	_debug = createMarker [_id, getPos _holder];
	_debug setMarkerShape "ICON";
	_debug setMarkerType "hd_dot";
	_debug setMarkerColor "ColorBlue";
	_txt = format ["%1", _type];
	_debug setMarkerText _txt;
};

if(_type == 0) then
{
	_weapon = ESCZ_lootWeapons call BIS_fnc_selectRandom;

	_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
	_magazineClass = _magazines call BIS_fnc_selectRandom;

	_holder addWeaponCargoGlobal [_weapon, 1];
	_holder addMagazineCargoGlobal [_magazineClass, 3];
};

if(_type == 1) then
{
	_item = ESCZ_lootItems call BIS_fnc_selectRandom;
	_holder addItemCargoGlobal [_item, 1];
};

if(_type == 2) then
{
	_uniform = ESCZ_lootUniforms call BIS_fnc_selectRandom;
	_holder addItemCargoGlobal [_uniform, 1];
};

if(_type == 3) then
{
	_vest = ESCZ_lootVests call BIS_fnc_selectRandom;
	_holder addItemCargoGlobal [_vest, 1];
};

if(_type == 4) then
{
	_backpack = ESCZ_lootBackpacks call BIS_fnc_selectRandom;
	_holder addBackpackCargoGlobal [_backpack, 1];
};

if(_type == 5) then
{
	_head = ESCZ_lootHeadgears call BIS_fnc_selectRandom;
	_holder addItemCargoGlobal [_head, 1];
};

if(_type == 6) then
{
	_holder addItemCargoGlobal ["ToolKit", 1];
}
