class Box
{
    type = CT_STATIC;
    idc = -1;
    style = ST_CENTER;
    shadow = 2;
    colorBackground[] = { 0.2,0.9,0.5, 0.9};
    colorText[] = {1,1,1,0.9};
    font = "PuristaLight";
    sizeEx = 0.03;
    text = "";
};

class bwa_intro
{
	idd=-1;
	movingenable=false;
	
	class controls 
	{
	////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Chaser, v1.063, #Danara)
////////////////////////////////////////////////////////

class bwa_rscBackround: IGUIBack
{
	idc = 2200;
	x = -29 * GUI_GRID_W + GUI_GRID_X;
	y = -11 * GUI_GRID_H + GUI_GRID_Y;
	w = 99.5 * GUI_GRID_W;
	h = 46.5 * GUI_GRID_H;
	colorBackground[] = {1,1,1,0.9};
};
class bwa_rscSplash: RscPicture
{
	idc = 1200;
	text = "media\images\splash_IA.paa";
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.225 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 0.55 * safezoneH;
	colorActive[] = {-1,-1,-1,1};
};
class bwa_rscHints: RscStructuredText
{
	idc = 1100;
	text = "<t shadow='1' shadowColor='#151619'><t color='#d3d8db'><t align='center'>Hinweise</t><br /><br />1:<br />Unterstützungseinheiten sollten sich bis zum Abruf bereithalten<br /><br />2:<br />Du hast Fragen? Komm auf den TS und frag einen der Moderatoren<br /><br />3:<br />Du hast Probleme, Wünsche oder Anregungen?<br />Schau ins Forum auf http://bw-armaclan.de<br /><br />4:<br />Du hast einen Bug gefunden?<br /> Poste ihn auf http://bw-armaclan.de/community/publicserver</t>"; //--- ToDo: Localize;
	x = 0.00517081 * safezoneW + safezoneX;
	y = 0.114858 * safezoneH + safezoneY;
	w = 0.283496 * safezoneW;
	h = 0.803295 * safezoneH;
	//colorText[] = {21,22,25,1};
	colorBackground[] = {0.1,0.1,0.1,0.8};
	colorActive[] = {-1,-1,-1,1};
	size = 0.039 
};
class bwa_rscRules: RscStructuredText
{
	idc = 1101;
	text = "<t shadow='1' shadowColor='#151619'><t color='#d3d8db'><t align='center'>Regeln</t><br /><br /><t color='#d3d8db'>1:<br />Für alle Spieler herrscht Teamspeakpflicht.<br /><br />2:<br />Hacking sowie das Ausnutzen von Bugs wird nicht toleriert.<br />Absichtlicher Eigenbeschuss wird  nicht toleriert.<br /><br />3:<br />Wiederholtes Team-Killing wird mit einem Kick/Ban bestraft.<br /><br />4:<br />Unnötiges Zerstören von BLUFOR Fahrzeugen wird bestraft.<br /><br />5:<br />Beschimpfungen jeglicher Art und Weise werden nicht toleriert.<br /><br />6:<br />Es ist nicht gestattet in der Basis eine Waffe abzufeuern.<br />Außnahme bildet die Eigenverteidigung.<br />Zuwiderhandlungen werden mit Kick/Ban bestraft.<br /><br />7:<br />Andere Spieler in Ihrem Spielerlebnis negativ zu beeinflussen wird bestraft.<br /><br />8:<br />Der Ingamechat darf nur zur Anfrage zur Aufnahme in eine Gruppe verwendet werden.<br /><br />9:<br />Den Anweisungen von Admins oder Moderatoren ist Folge zu leisten.<br /><br />10:<br />Weitere Regeln findest du im Forum: www.bw-armaclan.de</t>"; //--- ToDo: Localize;
	x = 0.711333 * safezoneW + safezoneX;
	y = 0.125862 * safezoneH + safezoneY;
	w = 0.283496 * safezoneW;
	h = 0.792291 * safezoneH;
	//colorText[] = {1,1,1,1};
	colorBackground[] = {0.1,0.1,0.1,0.8};
	colorActive[] = {0,0,255,1};
	size = 0.039 
};
class bwa_rscButton: RscButton
{
	idc = 1600;
	text = "Ich akzeptiere diese Regeln"; //--- ToDo: Localize;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.863 * safezoneH + safezoneY;
	w = 0.195937 * safezoneW;
	h = 0.055 * safezoneH;
	colorText[] = {21,22,25,1};
	colorBackground[] = {0.1,0.1,0.1,0.5};
	
	action = "closedialog 0";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


		
	};
};

