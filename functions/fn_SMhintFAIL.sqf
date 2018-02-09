private ["_failedText"];

_failedText = "<t align='center'><t size='2.2'>Neben Mission</t><br/><t size='1.5' color='#b60000'>FEHLGESCHLAGEN</t><br/>____________________<br/>
	Ihre Bemühungen waren leider vergebens!<br/><br/><br/>Konzentrieren Sie sich weiter auf das Hauptziel. Das Operationszentrum wurde über Ihren Fehlschlag informiert, mit etwas Glück haben Wir bald ein neues Ziel. 
	Sie erhalten in 15 - 30 Minuten Nachricht über mögliche Angriffskoordinaten.</t>";

GlobalHint = _failedText; publicVariable "GlobalHint"; hint parseText _failedText;