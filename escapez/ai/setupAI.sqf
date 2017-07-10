params ["_unit", "_pos"];

removeAllItems _unit;
removeHeadgear _unit;
removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeAllContainers _unit;

_uniform = ESCZ_lootUniforms call BIS_fnc_selectRandom;
_unit forceAddUniform _uniform;

_vest = ESCZ_lootVests call BIS_fnc_selectRandom;
_unit addVest _vest;

_backpack = ESCZ_lootBackpacks call BIS_fnc_selectRandom;
_unit addBackpack _backpack;

_head = ESCZ_lootHeadgears call BIS_fnc_selectRandom;
_unit addHeadgear _head;

_weapon = ESCZ_lootWeapons call BIS_fnc_selectRandom;
_unit addWeapon _weapon;

_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
_magazineClass = _magazines call BIS_fnc_selectRandom;
_unit addMagazines [_magazineClass, 2];

if (_pos inArea "ESCZ_Editor_enemyMedium") then
{
	_unit setSkill ["aimingspeed", 0.15];
	_unit setSkill ["aimingaccuracy", 0.1];
	_unit setSkill ["aimingshake", 0.1];
	_unit setSkill ["spottime", 0.3];
	_unit setSkill ["spotdistance", 0.5];
	_unit setSkill ["commanding", 0.5];
	_unit setSkill ["general", 0.6];
};

if (_pos inArea "ESCZ_Editor_enemyHard") then
{
	_unit setSkill ["aimingspeed", 0.2];
	_unit setSkill ["aimingaccuracy", 0.2];
	_unit setSkill ["aimingshake", 0.2];
	_unit setSkill ["spottime", 0.4];
	_unit setSkill ["spotdistance", 0.6];
	_unit setSkill ["commanding", 0.6];
	_unit setSkill ["general", 0.7];
};
