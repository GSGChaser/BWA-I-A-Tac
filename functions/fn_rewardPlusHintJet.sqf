private ["_completeTextJet"];

/*
_completeTextJet = "<t align='center'><t size='2.2'>Prioritätsziel</t><br/><t size='1.5' color='#08b000'>Feindliches Kampflugzeug wurde Neutralisiert</t><br/>____________________<br/>Fantastische Arbeit! Die OPFOR Einheiten auf Altis werden nicht lange durchhalten, wenn Sie so weiter machen!<br/><br/>Konzentrieren Sie sich ersteinmal auf die Hauptziele.</t>";
GlobalHint = _completeTextJet; publicVariable "GlobalHint"; hint parseText _completeTextJet;
*/
showNotification = ["EnemyJetDown","Feindliches Kampflugzeug wurde zerstört. Gute Arbeit!"]; publicVariable "showNotification";