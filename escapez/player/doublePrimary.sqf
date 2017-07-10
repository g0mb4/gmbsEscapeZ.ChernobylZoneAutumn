params["_player"];

weaponHolder = "Weapon_Empty" createVehicle getPosATL _player;
weaponHolder attachTo [_player, [-0.1, -0.18, 0.12], "pelvis"];
weaponHolder enableSimulation false;

_player addAction 
[
	"Put weapon on back",
	{
		_arguments = _this select 3;

		_player = _arguments select 0;

		_player action ["PutWeapon", weaponHolder, primaryWeapon _player];

		waitUntil 
		{ 
			(count (magazinesAmmoCargo weaponHolder) != 0) 
		};
	}, [_player] , 1, false, false, "", 
	'(count (weaponCargo weaponHolder) == 0) && primaryWeapon _target != ""'
];

_player addAction 
[
	"Switch weapon",
	{
		_arguments = _this select 3;
		
		_player = _arguments select 0;

		_prim = ((weaponCargo weaponHolder) select 0);
		_player action ["TakeWeapon", weaponHolder, _prim];

		waitUntil 
		{
			(count (magazinesAmmoCargo weaponHolder) != 0)
		};

		{
			_player addMagazine [_x select 0, _x select 1];
		} forEach (magazinesAmmoCargo weaponHolder);

		_player selectWeapon _prim;

		clearMagazineCargoGlobal weaponHolder;
		clearItemCargoGlobal weaponHolder;
		clearBackpackCargoGlobal weaponHolder;

	}, [_player], 1, false, false, "", 
	'(count (weaponCargo weaponHolder) == 1)'
];

["9999", "onEachFrame", 
{
	weaponHolder setVectorDirAndUp [(_this selectionPosition "spine3") vectorFromTo (_this selectionPosition "rfemur"), [-0.1, -0.5, 1]];
}, _player] call BIS_fnc_addStackedEventHandler;
