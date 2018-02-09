if (playerSide == west) then {
	sleep 1;
	_handle=createdialog "bwa_intro";
};

if (playerSide == west) then {
	sleep 1800;
	_Ts_Hint = "<t align='center'><t size='2'><t color='#00B2EE'>Besuch uns auf dem Teamspeak. Für alle Spieler herrscht Teamspeak-Pflicht.</t><br/><br/>_____________<br/><br/><t size='1.5'><t color='#ff0000'>ts.bw-armaclan.de<br/></t>";
	TsHint = _Ts_Hint; publicVariable "TsHint"; hint parseText TsHint;
	TsHintLoop = false; publicVariable "TsHintLoop";
	sleep 1800;
	_Ts_Hint = "<t align='center'><t size='1.5'><t color='#00ffff'>Sidechat darf nur für Gruppenanfragen genutzt werden.</t>";
	TsHintLoop = _Ts_Hint; publicVariable "TsHintLoop"; hint parseText TsHintLoop;
	sleep 1800;
	_Ts_Hint = "<t align='center'><t size='2'><t color='#00B2EE'>Besuch uns auf dem Teamspeak. Für alle Spieler herrscht Teamspeak-Pflicht.</t><br/><br/>_____________<br/><br/><t size='1.5'><t color='#ff0000'>ts.bw-armaclan.de<br/></t>";
	TsHint = _Ts_Hint; publicVariable "TsHint"; hint parseText TsHint;
	TsHintLoop = false; publicVariable "TsHintLoop";
	sleep 1800;
	_Ts_Hint = "<t align='center'><t size='1.5'><t color='#00ffff'>Sidechat darf nur für Gruppenanfragen genutzt werden.</t>";
	TsHintLoop = _Ts_Hint; publicVariable "TsHintLoop"; hint parseText TsHintLoop;
};
