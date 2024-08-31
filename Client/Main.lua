Framework, FName = nil, nil
if (GetResourceState("es_extended") == "started") then
  local rESX, rObj = pcall(function()
    Framework = exports['es_extended']:getSharedObject()
  end)

  if (rESX) then
    FName = "ESX"
  end
else
  FName = "standalone"
end

CreateThread(function()
    local _sleep = true
    
    while (true) do
      local _ped = PlayerPedId()
      local x,y,z = table.unpack(GetEntityCoords(_ped))
      local _dist = #(vector3(x,y,z) - Shared.Coords)
      _sleep = not (_dist < 7.5)
      if (not _sleep) then
        if (IsControlJustPressed(0, 38)) then
          
        end
      end
      Wait((_sleep) and 750 or 0)
    end
end)
