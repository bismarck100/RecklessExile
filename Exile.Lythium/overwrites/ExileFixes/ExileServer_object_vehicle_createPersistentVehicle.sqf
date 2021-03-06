/**
 * ExileServer_object_vehicle_createPersistentVehicle
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * modified by Heavy
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_className","_position","_direction","_usePositionATL","_pinCode","_vehicleObject"];
_className = _this select 0;
_position = _this select 1;
_direction = _this select 2;
_usePositionATL = _this select 3;
_pinCode = _this select 4;
_vehicleObject = [_className, _position, _direction, _usePositionATL] call ExileServer_object_vehicle_carefulCreateVehicle;
_vehicleObject setVariable ["ExileIsPersistent", true];
_vehicleObject setVariable ["ExileAccessCode", _pinCode];
_vehicleObject addEventHandler ["GetOut", {_this call ExileServer_object_vehicle_event_onGetOut}];
_vehicleObject addEventHandler ["GetIn", {_this call ExileServer_object_vehicle_event_onGetIn}];
_vehicleObject addMPEventHandler ["MPKilled", { if !(isServer) exitWith {}; _this call ExileServer_object_vehicle_event_onMPKilled;}];
_vehicleObject disableTIEquipment true;


if(_className == "I_Heli_light_03_F") then  //Hellcat
{
	_vehicleObject removeWeaponTurret  	   ["missiles_DAR",[-1]];		
	_vehicleObject removeMagazinesTurret   ["24Rnd_missiles",[-1]];
	_vehicleObject addWeaponTurret         ["M134_minigun",[0]];
	_vehicleObject addWeaponTurret         ["M134_minigun",[0]];
	_vehicleObject addWeaponTurret         ["M134_minigun",[-1]];
	_vehicleObject addWeaponTurret         ["M134_minigun",[-1]];
	_vehicleObject addMagazineTurret   	   ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[0]];
	_vehicleObject addMagazineTurret   	   ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addMagazineTurret   	   ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addMagazineTurret   	   ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addMagazineTurret   	   ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addMagazineTurret       ["2000Rnd_762x51_Belt",[-1]];
	_vehicleObject addWeaponTurret         ["CMFlareLauncher",[0]];
	_vehicleObject addWeaponTurret         ["CMFlareLauncher",[-1]];
	_vehicleObject addMagazineTurret       ["60Rnd_CMFlare_Chaff_Magazine",[0]];
	_vehicleObject addMagazineTurret   	   ["60Rnd_CMFlare_Chaff_Magazine",[-1]];

};

/*
if(_className == "O_Heli_Light_02_F") then  //Orca (camo)
{
	_vehicleObject removeWeaponTurret  	   ["missiles_DAR",[-1]];		
	_vehicleObject removeMagazinesTurret   ["24Rnd_missiles",[-1]];
};

if(_className == "O_Heli_Light_02_v2_F") then  //Orca (black)
{
	_vehicleObject removeWeaponTurret  	   ["missiles_DAR",[-1]];		
	_vehicleObject removeMagazinesTurret   ["24Rnd_missiles",[-1]];
};
*/

_vehicleObject call ExileServer_system_simulationMonitor_addVehicle;
_vehicleObject
