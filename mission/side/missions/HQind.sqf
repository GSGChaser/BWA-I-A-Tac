/*
Author:

	Quiksilver
	
Last modified:

	24/04/2014
	
Description:

	Secure HQ supplies before destroying it.

____________________________________*/

private ["_flatPos","_accepted","_position","_enemiesArray","_fuzzyPos","_x","_briefing","_unitsArray","_object","_SMveh","_SMaa","_tower1","_tower2","_tower3","_flatPos1","_flatPos2"];

_c4Message = ["Waffenlieferung gesichert. Ladungen sind platziert! 30 Sekunden bis zur Detonation.","Raketenwerfer gesichert. Ladungen sind platziert! 30 Sekunden bis zur Detonation.","Waffen gesichert. Ladungen sind platziert! 30 Sekunden bis zur Detonation."] call BIS_fnc_selectRandom;


//-------------------- FIND POSITION FOR OBJECTIVE

	_flatPos = [0,0,0];
	_accepted = false;
	while {!_accepted} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [10,1,0.2,sizeOf "Land_Cargo_House_V2_F",0,false];

		while {(count _flatPos) < 2} do {
			_position = [] call BIS_fnc_randomPos;
			_flatPos = _position isFlatEmpty [10,1,0.2,sizeOf "Land_Cargo_House_V2_F",0,false];
		};

		if ((_flatPos distance (getMarkerPos "respawn_west")) > 1700 && (_flatPos distance (getMarkerPos currentAO)) > 500) then {
			_accepted = true;
		};
	};
	
	_flatPos1 = [_flatPos, 15, 50] call BIS_fnc_relPos;
	_flatPos2 = [_flatPos, 15, 80] call BIS_fnc_relPos;

//-------------------- SPAWN OBJECTIVE

	_objDir = random 360;

	sideObj = "Land_Cargo_House_V2_F" createVehicle _flatPos;
	waitUntil {alive sideObj};
	sideObj setPos [(getPos sideObj select 0), (getPos sideObj select 1), (getPos sideObj select 2)];
	sideObj setVectorUp [0,0,1];
	sideObj setDir _objDir;
	
	_object = [indCrate1,indCrate2] call BIS_fnc_selectRandom;
	_object setPos [(getPos sideObj select 0), (getPos sideObj select 1), ((getPos sideObj select 2) + 2)];
	
	truck1 = "O_Truck_03_ammo_F" createVehicle _flatPos1;
	truck2 = "I_Truck_02_ammo_F" createVehicle _flatPos2;
	
	{ _x setDir random 360 } forEach [truck1,truck2];
	{ _x lock 3 } forEach [truck1,truck2];

//-------------------- SPAWN FORCE PROTECTION

	_enemiesArray = [sideObj] call QS_fnc_SMenemyIND;

//-------------------- SPAWN BRIEFING

	_fuzzyPos = [((_flatPos select 0) - 300) + (random 600),((_flatPos select 1) - 300) + (random 600),0];
	{ _x setMarkerPos _fuzzyPos; } forEach ["sideMarker", "sideCircle"];
	sideMarkerText = "Sichern Sie die Raketenwerfer"; publicVariable "sideMarkerText";
	"sideMarker" setMarkerText "Neben Mission: Sichern Sie die Raketenwerfer"; publicVariable "sideMarker";
	publicVariable "sideObj";
	_briefing = "<t align='center'><t size='2.2'>Neue Neben Mission</t><br/><t size='1.5' color='#00B2EE'>Sichern Sie die Raketenwerfer</t><br/>____________________<br/>Schurken der AAF versorgen OPFOR mit fortgeschrittenen Waffen und Flugabwehrraketen.<br/><br/>Wir haben den Übergabestandort lokalisiert. Verlegen Sie in das Einsatzgebiet und sichern Sie die Raketenwerfer.</t>";
	GlobalHint = _briefing; hint parseText GlobalHint; publicVariable "GlobalHint";
	showNotification = ["NewSideMission", "Sichern Sie die Raketenwerfer"]; publicVariable "showNotification";
	sideMarkerText = "Sichern Sie die Raketenwerfer"; publicVariable "sideMarkerText";
	
//-------------------- [ CORE LOOPS ] ------------------------ [ CORE LOOPS ]

	sideMissionUp = true; publicVariable "sideMissionUp";
	SM_SUCCESS = false; publicVariable "SM_SUCCESS";

while { sideMissionUp } do {

	//--------------------------------------------- IF PACKAGE DESTROYED [FAIL]

	if (!alive sideObj) exitWith {
		
		//-------------------- DE-BRIEFING
		
		sideMissionUp = false; publicVariable "sideMissionUp";
		hqSideChat = "Objekt Zerstört! Mission FEHLGESCHLAGEN!"; publicVariable "hqSideChat"; [WEST,"HQ"] sideChat hqSideChat;
		[] spawn QS_fnc_SMhintFAIL;
		{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["sideMarker", "sideCircle"]; publicVariable "sideMarker";
		
		//-------------------- DELETE
		
		_object setPos [-10000,-10000,0];
		sleep 120;
		{ deleteVehicle _x } forEach [sideObj,truck1,truck2];
		deleteVehicle nearestObject [getPos sideObj,"Land_Cargo_House_V2_ruins_F"];
		{ [_x] spawn QS_fnc_SMdelete } forEach [_unitsArray,_enemiesArray];
	};
	
	//--------------------------------------------- IF PACKAGE DESTROYED [FAIL]
	
	if (SM_SUCCESS) exitWith {
		
		hqSideChat = _c4Message; publicVariable "hqSideChat"; [WEST,"HQ"] sideChat hqSideChat;
	
		//-------------------- BOOM!
	
		sleep 30;											
		"Bo_Mk82" createVehicle getPos _object; 			
		sleep 0.1;
		_object setPos [-10000,-10000,0];
	
		//-------------------- DE-BRIEFING

		sideMissionUp = false; publicVariable "sideMissionUp";
		[] call QS_fnc_SMhintSUCCESS;
		{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["sideMarker", "sideCircle"]; publicVariable "sideMarker";
	
		//--------------------- DELETE
		
		sleep 120;
		{ deleteVehicle _x } forEach [sideObj,truck1,truck2];
		deleteVehicle nearestObject [getPos sideObj,"Land_Cargo_House_V2_ruins_F"];
		{ [_x] spawn QS_fnc_SMdelete } forEach [_unitsArray,_enemiesArray];
	};
};