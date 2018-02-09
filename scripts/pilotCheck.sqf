// Original pilotcheck by Kamaradski [AW]. 
// Since then been tweaked by many hands!
// Notable contributors: chucky [allFPS], Quiksilver.

_pilots = ["BWA3_Helipilot","rhsusf_airforce_jetpilot"];
//_aircraft_nocopilot = [I_Heli_Transport_02_F", "O_Heli_Light_02_F", "O_Heli_Light_02_unarmed_F", "I_Heli_light_03_dynamicLoadout_F"];

waitUntil {player == player};

_iampilot = ({typeOf player == _x} count _pilots) > 0;

/* Remove comments and insert UIDs into the whitelist to exempt individuals from this script
_uid = getPlayerUID player;
_whitelist = [];//["76561198142842785"];

if (_uid in _whitelist) exitWith {};
*/

while { true } do {
	_oldvehicle = vehicle player;
	waitUntil {vehicle player != _oldvehicle};

	if(vehicle player != player) then {
		_veh = vehicle player;

		//------------------------------ pilot can be pilot seat only
		
		if((_veh isKindOf "Helicopter" || _veh isKindOf "Plane") && !(_veh isKindOf "ParachuteBase")) then {
			if(!_iampilot) then {
				_forbidden = [driver _veh, gunner _veh];
				if (player in _forbidden) then {
					systemChat (localize "STR_PILOTCHECK_MUST_BE_PILOT");
					player action ["getOut", _veh];
				};
			};
		};
	};
};

