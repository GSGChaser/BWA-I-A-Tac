/*
| Author: 
|
|	Quiksilver.
|_____
|
| Description: 
|	
|	Created: 26/11/2013.
|	Last modified:29/10/2014.
|	Coded for I&A and hosted on allfps.com.au servers.
|	You may use and edit the code.
|	You may not remove any entries from Credits without first removing the relevant author's contributions, 
|	or asking permission from the mission authors/contributors.
|	You may not remove the Credits tab, without consent of Ahoy World or allFPS.
| 	Feel free to re-format or make it look better.
|_____
|
| Usage: 
|	
|	Search below for the diary entries you would like to edit. 
|	DiarySubjects appear in descending order when player map is open.
|	DiaryRecords appear in ascending order when selected.
|_____
|
| Credit:
|
|	Invade & Annex 2.00 was developed by Rarek [ahoyworld.co.uk] with hundreds of hours of work 
|	The current version was developed by Quiksilver with hundreds more hours of work.
|	
|	Contributors: Razgriz33 [AW], Jester [AW], Kamaradski [AW], David [AW], chucky [allFPS].
|	
|	Please be respectful and do not remove credit.
|______________________________________________________________*/

if (!hasInterface) exitWith {};

waitUntil {!isNull player};

player createDiarySubject ["regeln", "Regeln"];
player createDiarySubject ["teamspeak", "Teamspeak"];
player createDiarySubject ["faq", "FAQ"];
player createDiarySubject ["changelog", "Change Log"];
player createDiarySubject ["credits", "Credits"];

//-------------------------------------------------- Rules
/*
player createDiaryRecord ["rules",
[
"Enforcement",
"
<br />Sinn dieses Regelwerks ist es, allen Spielern ein immersives und abwechslungsreiches Spielerlebnis zu bieten.
<br />
"
]];
*/
player createDiaryRecord ["rules",
[
"Generell",
"
<br />1. Hacking sowie das Ausnutzen von Bugs wird nicht toleriert.
<br />2. Absichtlicher Eigenbeschuss wird nicht toleriert.
<br />3. Wiederholtes Team-Killing wird mit einem Kick/Ban bestraft.
<br />4. Unnötiges Zerstören von BLUFOR Fahrzeugen wird bestraft.
<br />5. Beschimpfungen jeglicher Art und Weise werden nicht toleriert. 
<br />6. Es ist nicht gestattet in der Basis eine Waffe abzufeuern. Außnahme bildet die Eigenverteidigung. Zuwiderhandlungen werden mit Kick/Ban bestraft.
<br />7. Andere Spieler in Ihrem Spielerlebnis negativ zu beeinflussen wird bestraft.
<br />8. Der Ingamechat darf nur zur Anfrage zur Aufnahme in eine Gruppe verwendet werden.
<br />9. Den Anweisungen von Admins oder Moderatoren ist Folge zu leisten.
<br />
<br />Solltest du einen Spieler bei Missachtung der Regeln beobachten, kontaktiere einen Moderator oder Admin (Teamspeak).
"
]];

//-------------------------------------------------- Teamspeak

player createDiaryRecord ["teamspeak",
[
"TS3",
"
<br /> Teamspeak:<br /><br />
<br /> http://www.teamspeak.com/?page=downloads
"
]];

player createDiaryRecord ["teamspeak",
[
"Bundeswehr Armaclan",
"
<br /> Address: ts.bw-armaclan.de
<br />
<br /> Besucher und Gäste sind Wilkommen!
"
]];

//-------------------------------------------------- FAQ

player createDiaryRecord ["faq",
[
"Gruppen",
"
<br /><font size='16'>F:</font> Wie kann ich in einer anderen Gruppe beitreten?<br />
<br /><font size='16'>A:</font> Bitte folgende Schritte durchführen:
<br /> 1. Drücke 'U'. (Die Taste kann beliebig geändert werden. Steuerung -> Teamwechsel)
<br /> 2. Danach die Gruppe auswählen.
<br /> 3. Als letztes den Button für Beitreten drücken.
<br /> Sollten die Gruppen geschlossen sein, frage über den Side Chat ob dich jemand aufnimmt.
"
]];

player createDiaryRecord ["faq",
[
"FOBs",
"
<br /><font size='16'>F:</font> Darf ich eine FOB erstellen<br />
<br /><font size='16'>A:</font> Ja, es darf nach Bedarf immer eine FOB erstellt werden. Ist eine Operationszentrale (OPZ) aktiv, entscheidet diese über die Notwendigkeit.
<br /> - Weitere Regeln kannst du unserem Regelwerk im Forum entnehmen. (bw-armaclan.de)
"
]];

player createDiaryRecord ["faq",
[
"Mörser",
"
<br /><font size='16'>F:</font> Darf ich Mörser benutzen?
<br /><font size='16'>A:</font> Ja, Mörser dürfen benutzt werden. Es gelten die Regeln für CAS. (Regeln im Forum: bw-armaclan.de)<br />
"
]];

player createDiaryRecord ["faq",
[
"Fahrzeuge",
"
<br /><font size='16'>F:</font> Wie kann ich Fahrzeuge reparieren/betanken/aufmunitionieren?
<br /><font size='16'>A:</font> Fahrzeuge können über die bereitgestellten LKW´s repariert/betankt/aufmunitioniert werden. <br />
"
]];

//-------------------------------------------------- Change Log

player createDiaryRecord ["changelog",
[
"2.0.0",
"
<br />- [CHANGED] Gamemode auf Mods angepasst.
"
]];


//-------------------------------------------------- Credits

player createDiaryRecord ["credits",
[
"I & A",
"
<br />Missions ersteller:<br /><br />

		- <font size='16'>Bundeswehr Armaclan (bw-armaclan.de)</font><br />
		- Quiksilver<br /><br />
		
<br />Mitwirkende:<br /><br />
		- Chaser - Bundeswehr Armaclan (bw-armaclan.de)<br />
		- Lexel  - Bundeswehr Armaclan (bw-armaclan.de)<br />
		- Max 	 - Bundeswehr Armaclan (bw-armaclan.de)<br />
		- Seko	 - Bundeswehr Armaclan (bw-armaclan.de)<br />
		- Sumsl  - Bundeswehr Armaclan (bw-armaclan.de)<br /><br />
		
		
<br />Andere:<br /><br />
		EOS<br />
		- BangaBob<br /><br />
		TAW View Distance<br />
		- Tonic<br /> <br />
		Fast rope<br />
		- Zealot<br /><br />
		Map and GPS Icons (Soldier Tracker)<br />
		- Quiksilver<br /><br />
		Jump<br />
		- ProGamer<br /><br />
		Safe zone<br />
		- Bake<br /><br />
		DAC<br />
		- Silola<br />
"
]];