waitUntil { sleep 0.1; (speed player > 0.001) };

_vehicleLoop = false;
_playerLoop = false;

while { true } do
{
	_playerCheck = vehicle player != player;
	switch (_playerCheck) do
	{
		case true:
		{
			// Player is in vehicle
			if (not _vehicleLoop) then
			{
				vehicle player addEventHandler ["Fired", "if (isPlayer cursorTarget) then { deleteVehicle (_this select 6) }"];
				_vehicleLoop = true;
			};
		};
		case false:
		{
			// Player NOT in vehicle
			if (not _playerLoop) then
			{
				player addEventHandler ["Fired", "if (isPlayer cursorTarget) then { deleteVehicle (_this select 6) }"];
				_playerLoop = true;
			};
		};
		default { };
	};
	sleep 0.1;
};