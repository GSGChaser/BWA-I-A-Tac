/*
@filename: init.sqf
Author:
	
	Quiksilver

Last modified:

	12/05/2014
	
Description:

	Things that may run on both server and client.
	Deprecated initialization file, still using until the below is correctly partitioned between server and client.
______________________________________________________*/



DAC_Basic_Value = 0;execVM "DAC\DAC_Config_Creator.sqf";

// Disable saving to save time
enableSaving [false, false];

//TaruPodScript
call compileFinal preprocessFileLineNumbers "Script_XENO_Taru_Pod\XENO_Taru_Pod_Mod.sqf";

//Wetter
//execVM "scripts\misc\randomWeather2.sqf";






//-------------------------------------------------- Headless Client


// ich bin eine änderung in der debveloper branch