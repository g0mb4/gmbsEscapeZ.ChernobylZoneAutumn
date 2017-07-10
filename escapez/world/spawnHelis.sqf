private ["_posXY", "_sizeWH", "_pos"];

for [{_i=0}, {_i<3}, {_i=_i+1}] do
{
	_pos = [ "ESCZ_Editor_heliSpawn" ] call ESCZ_fn_getRandomPosition;

	_heli = ESCZ_Helis call BIS_fnc_selectRandom;

 	_veh = _heli createVehicle _pos;
	_veh setFuel 0.5;
	_veh setDamage 0.5;
	_veh setHitPointDamage ["HitHRotor", 1];

	_id = format ["mrk%1", getPos _veh];
	_debug = createMarker [_id, getPos _veh];
	_debug setMarkerShape "ICON";
	_debug setMarkerType "hd_dot";
	_debug setMarkerColor "ColorRed";
	_txt = format ["Heli-%1", _id];
	_debug setMarkerText _txt;
};
