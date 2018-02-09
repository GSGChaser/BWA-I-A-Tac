/*
Author: 

	Quiksilver

Last modified: 

	2/05/2014

Description:

	North-West Theater
	
Notes:
	
	_targets = ["Pyrsos","Factory","Syrta","Aristi Turbines","Dump","Negades","Abdera","Kore","Oreokastro","Galati Outpost","Fotia Turbines","Agios Konstantinos","Faros","Krya Nera Airfield","Krya Nera Turbines"];
	while {(_x > 0) count _targetsLeft} do {
	
______________________________________________*/

private ["_target1","_target2","_target3","_target4","_target5","_targetArray","_pos","_i","_position","_flatPos","_roughPos","_targetStartText","_targets","_targetsLeft","_dt","_enemiesArray","_unitsArray","_radioTowerDownText","_targetCompleteText","_regionCompleteText","_null","_mines","_chance"];
eastSide = createCenter east;

//---------------------------------------------- AO location marker array

_targets = ["Pyrsos","Factory","Syrta","Aristi Turbines","Dump","Negades","Abdera","Kore","Oreokastro","Galati Outpost","Fotia Turbines","Agios Konstantinos","Faros","Krya Nera Airfield","Krya Nera Turbines"];
//----------------------------------------------- SELECT A FEW RANDOM AOs

_target1 = _targets call BIS_fnc_selectRandom;
_targets = _targets - [_target1];
_target2 = _targets call BIS_fnc_selectRandom;
_targets = _targets - [_target2];
_target3 = _targets call BIS_fnc_selectRandom;
_targets = _targets - [_target3];
_target4 = _targets call BIS_fnc_selectRandom;
_targets = _targets - [_target4];
_target5 = _targets call BIS_fnc_selectRandom;

_targetArray = [_target1,_target2,_target3,_target4,_target5];

//----------------------------------------------- AO MAIN SEQUENCE

while { count _targetArray > 0 } do {
	
	sleep 1;

	//------------------------------------------- Set new current AO

	currentAO = _targetArray call BIS_fnc_selectRandom;

	//------------------------------------------ Edit and place markers for new target
	
	{_x setMarkerPos (getMarkerPos currentAO);} forEach ["aoCircle","aoMarker"];
	"aoMarker" setMarkerText format["Nehmen Sie %1",currentAO];
	sleep 1;

	//------------------------------------------ Create AO detection trigger
	
	_dt = createTrigger ["EmptyDetector", getMarkerPos currentAO];
	_dt setTriggerArea [PARAMS_AOSize, PARAMS_AOSize, 0, false];
	_dt setTriggerActivation ["EAST", "PRESENT", false];
	_dt setTriggerStatements ["this","",""];

	//------------------------------------------ Spawn enemies
	
	_aoPos = getMarkerpos currentAO;
	sleep 5;
	waituntil{DAC_NewZone == 0};
	_DACvalues = ["Main_AO",[2,0,0],[15,4,50,5],[7,2,30,5],[4,1,20,5],[1,2,50,1,0,0],[0,0,0,0]];
	[_aoPos,PARAMS_AOSize,PARAMS_AOSize,0,0,_DACvalues] call DAC_fNewZone;
	waituntil{DAC_NewZone == 0};
	_enemiesArray = [currentAO] call QS_fnc_AOenemy;

	//------------------------------------------ Spawn radiotower
	
	_position = [[[getMarkerPos currentAO, PARAMS_AOSize],_dt],["water","out"]] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty[3, 1, 0.3, 30, 0, false];
	
	while {(count _flatPos) < 1} do {
		_position = [[[getMarkerPos currentAO, PARAMS_AOSize],_dt],["water","out"]] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty[3, 1, 0.3, 30, 0, false];
	};
	
	_roughPos = 
	[
		((_flatPos select 0) - 200) + (random 400),
		((_flatPos select 1) - 200) + (random 400),
		0
	];

	radioTower = "Land_TTowerBig_2_F" createVehicle _flatPos;
	waitUntil { sleep 0.5; alive radioTower };
	radioTower setVectorUp [0,0,1];
	radioTowerAlive = true; publicVariable "radioTowerAlive";
	{ _x setMarkerPos _roughPos; } forEach ["radioMarker", "radioCircle"];

	//-----------------------------------------------Spawn minefield
	
	_chance = random 10;
	if (_chance < PARAMS_RadioTowerMineFieldChance) then {
	
		_unitsArray = [_flatPos] call QS_fnc_AOminefield;
	
		"radioMarker" setMarkerText "Funkturm (Minenfeld)";
	} else {
		"radioMarker" setMarkerText "Minenfeld";
	};
	publicVariable "radioTower";

	{
		_x addCuratorEditableObjects [[radioTower], false];
	} foreach allCurators;

	//------------------------------------------- Set target start text
	
	_targetStartText = format
	[
		"<t align='center' size='2.2'>Neues Ziel</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/>Das war sehr gute Arbeit im letzten Zielgebiet. Machen Sie weiter so! Begeben Sie sich nach %1 und erledigen Sie Ihren Job!<br/><br/>Zerstören Sie den Funkturm um die feindliche Kommunikation zu unterbrechen.",
		currentAO
	];

	//-------------------------------------------- Show global target start hint
	
	GlobalHint = _targetStartText; publicVariable "GlobalHint"; hint parseText GlobalHint;
	showNotification = ["NewMain", currentAO]; publicVariable "showNotification";
	showNotification = ["NewSub", "Zerstöre Sie den feindlichen Funkturm."]; publicVariable "showNotification";			
	
	//-------------------------------------------- CORE LOOP
	
	currentAOUp = true; publicVariable "currentAOUp";
	
	if (PARAMS_AOReinforcementJet == 1) then {
		[] spawn {
			sleep (30 + (random 180));
			if (alive radioTower) then {
				while {(alive radioTower)} do {
					[] call QS_fnc_enemyCAS;
					sleep (480 + (random 480));
				};
			};
		};
	};
	
	waitUntil {sleep 3; !alive radioTower};
	
	//--------------------------------------------- RADIO TOWER DESTROYED
	
	radioTowerAlive = false; publicVariable "radioTowerAlive";
	{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["radioMarker","radioCircle"];
	_radioTowerDownText = "<t align='center' size='2.2'>Funkturm</t><br/><t size='1.5' color='#08b000' align='center'>ZERSTÖRT</t><br/>____________________<br/>Der feindliche Funkturm wurde zerstört, Fantastische Arbeit, Männer!<br/><br/><t size='1.2' color='#08b000' align='center'> Der Feind kann keine kommunikation mehr aufbauen!</t><br/>";
	GlobalHint = _radioTowerDownText; hint parseText GlobalHint; publicVariable "GlobalHint";
	showNotification = ["CompletedSub", "Feindlicher Funkturm wurde zerstört."]; publicVariable "showNotification";
	
	//---------------------------------------------- WHEN ENEMIES KILLED

	waitUntil {sleep 5; count list _dt < PARAMS_EnemyLeftThreshhold};
	
	currentAOUp = false; publicVariable "currentAOUp";
	
	_targetArray = _targetArray - [currentAO];

	//---------------------------------------------- DE-BRIEF 1
	
	sleep 3;
	_targetCompleteText = format ["<t align='center' size='2.2'>Das Ziel wurde eingenommen!</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/><t align='left'>Fantastische Arbeit in %1! Es wird ein moment dauern und wir haben ein neues Ziel für Sie gefunden.</t>",currentAO];
	{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["aoCircle","aoMarker","radioCircle"];
	GlobalHint = _targetCompleteText; hint parseText GlobalHint; publicVariable "GlobalHint";
	showNotification = ["CompletedMain", currentAO]; publicVariable "showNotification";

	//------------------------------------------------- DELETE
	
	deleteVehicle _dt;
	[_enemiesArray] spawn QS_fnc_AOdelete;
	["Main_AO"] call DAC_fDeleteZone;
	if (_chance < PARAMS_RadioTowerMineFieldChance) then {[_unitsArray] spawn QS_fnc_AOdelete;};

	//------------------------------------------------- DEFEND AO
	
	if (PARAMS_DefendAO == 1) then {
		_aoUnderAttack = [] execVM "mission\main\AOdefend.sqf";
		waitUntil {scriptDone _aoUnderAttack};
	};
	{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["aoCircle_2","aoMarker_2"];

	//----------------------------------------------------- DE-BRIEF
	
	_targetCompleteText = format ["<t align='center' size='2.2'>AO Abgeschlossen</t><br/><t size='1.5' align='center' color='#00FF80'>%1</t><br/>____________________<br/><t align='left'>Fantastische Arbeit in %1! Es wird ein moment dauern und wir haben ein neues Ziel für Sie gefunden.</t>",currentAO];
	GlobalHint = _targetCompleteText; publicVariable "GlobalHint"; hint parseText GlobalHint;
	
	if ((random 1) > 0.25) then {
		if (PARAMS_CasFixedWingSupport != 0) then {
			[] call QS_fnc_casRespawn;
		};
	};
	
	//----------------------------------------------------- MAINTENANCE
	
	_aoClean = [] execVM "scripts\misc\clearItemsAO.sqf";
	waitUntil {
		scriptDone _aoClean
	};
	sleep 20;
};