_pos = ["ESCZ_Editor_jeepSpawn"] call ESCZ_fn_getRandomPosition;

_veh = "O_G_Offroad_01_F" createVehicle _pos;
_veh setFuel 0.25;
_veh setDamage 0.9;
_veh setHit ["wheel_1_1_steering", 1];

if (ESCZ_showJeep) then
{
	_id = format ["mrk%1", getPos _veh];
	_debug = createMarker [_id, getPos _veh];
	_debug setMarkerShape "ICON";
	_debug setMarkerType "hd_dot";
	_debug setMarkerColor "ColorRed";
	_txt = format ["Jeep-%1", _id];
	_debug setMarkerText _txt;
};
