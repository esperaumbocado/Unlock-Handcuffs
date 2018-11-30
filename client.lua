ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

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

ESX.RegisterUsableItem('Wire Cutter', function(source)

	TriggerClientEvent('esx_handcuffs:unlockingcuffs', source)
end)

RegisterServerEvent('esx_handcuffs:unlocking')
AddEventHandler('esx_handcuffs:unlocking', function(source)
  TriggerClientEvent('esx_handcuffs:unlockingcuffs', source)
end)