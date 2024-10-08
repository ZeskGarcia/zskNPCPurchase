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

function OpenMenu()
  if (FName == "standalone") then
    -- add here your function
    return
  end

  if (FName == "ESX") then
    local elements = {}
    if (Shared and Shared.Weapons) then
      for k,v in pairs(Shared.Weapons) do
        if (v.enabled) then
          table.insert(elements, { label = ("%s - %s$"):format(v.name, v.price), value = k, price = v.price })
        end
      end
    end
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), "WeaponPurchaseMenu",
      {
        title = "Compra de Armas",
        align = "bottom-right",
        elements = elements
      }, function(menu, data)
      end, function(menu, data)
        menu.close()
      end)
  end
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
          OpenMenu()
        end
      end
      Wait((_sleep) and 750 or 0)
    end
end)
