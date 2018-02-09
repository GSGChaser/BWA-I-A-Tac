/*
Author: Quiksilver
Date modified: 12/10/2014 ArmA 1.30
*/

if (!(respawnInventory_Saved)) exitWith {hint "Keine Ausrüstung gespeichert - Schnelles Ausrüsten nicht möglich!";};
if (loading_inventory) exitWith {hint "Ausrüstung wird vorbereitet, bitte warten ...";};
loading_inventory = true;
hint "Ausrüstung wurde bereitgestellt";
[player,[player,"ClassGear"]] call BIS_fnc_loadInventory;
[] spawn {
	sleep 3;
	loading_inventory = false;
};