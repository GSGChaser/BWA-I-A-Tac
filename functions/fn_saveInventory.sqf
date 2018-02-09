/*
Author: Quiksilver
Date modified: 12/10/2014 ArmA 1.30
*/
if (saving_inventory) exitWith {hint "Sichere die Ausrüstung, bitte warten ...";};
saving_inventory = true;
respawnInventory_Saved = true;
hint "Ausrüstung wurde gesichert. Beim nächsten Start wird die aktuelle Ausrüstung bereitgestellt.";
[player,[player,"ClassGear"]] call BIS_fnc_saveInventory;
[] spawn {
	sleep 3;
	saving_inventory = false;
};