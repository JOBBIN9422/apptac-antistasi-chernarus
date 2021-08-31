/**
	Adds content from 'AppTac Uniforms' modpack to the arsenal.

	Params:
		None

	Returns:
		None
**/

//extract gear classnames from AppTac Uniforms pack
private _apptacGear = "getNumber (_x >> 'scope') >= 2 && getText ( _x >> 'author' ) == 'JOBBIN'" configClasses (configFile >> "CfgWeapons") apply {configName _x}; 

//unlock each classname in the arsenal
{_x call A3A_fnc_unlockEquipment;} foreach _apptacGear;