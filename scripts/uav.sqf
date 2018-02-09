[] spawn
{
	while {true} do
	{
		player disableUAVConnectability [aa_1,true];
		player disableUAVConnectability [aa_2,true];
		player disableUAVConnectability [aa_3,true];
		player disableUAVConnectability [aa_4,true];
		player disableUAVConnectability [aa_5,true];
		player disableUAVConnectability [aa_6,true];
		player disableUAVConnectability [aa_7,true];
		player disableUAVConnectability [aa_8,true];
		player disableUAVConnectability [aa_9,true];
		player disableUAVConnectability [aa_10,true];

		
		_uavcontrolers = ["B_soldier_UAV_F","B_recon_JTAC_F","B_Protagonist_VR_F"];
		_uavsops = ["B_soldier_UAV_F"];
		_jtac = ["B_recon_JTAC_F"];
		_uav = getConnectedUAV player;
		_AAuavs = ["B_AAA_System_01_F","B_SAM_System_01_F","B_SAM_System_02_F"];
		_avaiableuavs = ["B_T_UAV_03_dynamicLoadout_F","B_UAV_02_CAS_F","B_UAV_02_dynamicLoadout_F","B_UGV_01_rcws_F","B_UGV01_F","B_UAV_05_F"];
		_designator = ["B_Static_Designator_01_F"];
		if (typeOf _uav in _AAuavs) then {[] execVM "scripts\uav.sqf"; player connectTerminalToUAV objNull;  hint (localize "UAV verweigert");};
		if (typeOf player in _uavsops) then 
		{
			if (typeOf _uav in _designator) then {[] execVM "scripts\uav.sqf"; player connectTerminalToUAV objNull;  hint (localize "UAV verweigert");};
		};
		if (typeOf player in _jtac) then 
		{
			if (typeOf _uav in _avaiableuavs) then {[] execVM "scripts\uav.sqf"; player connectTerminalToUAV objNull;  hint (localize "UAV verweigert");};
		};
		sleep 1;
	};
};