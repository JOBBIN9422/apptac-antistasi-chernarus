/*
    Author: [Håkon]
    [Description]
        adds logistics load action to objects

    Arguments:
    0. <Object> Cargo that you want to be able to load in a vehicle
    1. <String> "load" or "unload" action (optional - should not really be used)

    Return Value:
    <Nil>

    Scope: Any
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: [_object] call A3A_fnc_logistics_addLoadAction;
*/
params ["_object", ["_action", "load"]];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
if (isNil "A3A_logistics_vehicleHardpoints") exitWith {
    Error("Logistics nodes not initialized");
    nil
};

private _nonSupportedStatic = false;
if (_object isKindOf "StaticWeapon") then {
    private _model = getText (configFile >> "CfgVehicles" >> typeOf _object >> "model");
    if (A3A_logistics_weapons findIf {(_x#0) isEqualTo _model} isEqualTo -1) then {_nonSupportedStatic = true};
};
if (_nonSupportedStatic) exitWith {nil};

[_object , _action] remoteExec ["A3A_fnc_logistics_addAction", 0, _object];
nil
