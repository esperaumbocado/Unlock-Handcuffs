----------------------------------------------------------------
--              Desbloquear Algemas com um item               --
----------------------------------------------------------------



-----------Desbloquear algemas com um item (cortador de algemas)
-----------Através desse script você poderá desbloquear as algemas
-----------Este item só será distribuido entre facções oficiais para evitar ANT-RP
-----------Desenvolvido baseado no esx_handcuffandrope-master
-----------Desenvolvido para uso no servidor "Infinite Roleplay"
-----------Desenvolvido por Rui Borges.
-----------Protegido por uma licença de direitos autorais


----- ESX -------

ESX               = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)



---- Locals ------

local cuffed = false
local dict = "mp_arresting"
local anim = "idle"
local flags = 49
local ped = PlayerPedId()
local changed = false
local prevMaleVariation = 0
local prevFemaleVariation = 0
local femaleHash = GetHashKey("mp_f_freemode_01")
local maleHash = GetHashKey("mp_m_freemode_01")
local IsLockpicking    = false




---- Script ------

RegisterNetEvent('esx_handcuffs:unlockingcuffs')
AddEventHandler('esx_handcuffs:unlockingcuffs', function()
  local player, distance = ESX.Game.GetClosestPlayer()
	local ped = GetPlayerPed(-1)

	if IsLockpicking == false then
		ESX.UI.Menu.CloseAll()
		FreezeEntityPosition(player,  true)
		FreezeEntityPosition(ped,  true)

		TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WELDING", 0, true)

		IsLockpicking = true

		Wait(30000)

		IsLockpicking = false

		FreezeEntityPosition(player,  false)
		FreezeEntityPosition(ped,  false)

		ClearPedTasksImmediately(ped)

		TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(player))
		ESX.ShowNotification('Algemas Quebradas')
	else
		ESX.ShowNotification('Você já está desbloqueando umas algemas')
	end
end)

