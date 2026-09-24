local Signal = require("Libraries.Signal")
local betterTable = require("Libraries.Table")

local Listener = {}
Listener.__index = Listener

function Listener.new(Key, PressType, Contexts)
    local self = setmetatable({
        _K = Key,
        _Contexts = Contexts or false,
        _PressType = PressType,
        Signal = Signal.new(),
    }, Listener)
    return self
end

local Handler = {}
Handler.__index = Handler

function Handler.new()
    local self = setmetatable({
        _Listeners = {},
        _ActiveContexts = {},
    }, Handler)
    return self
end

function Handler:CreateListener(Key, PressType, Contexts) --Key:String, PressType:String ("Start", "End"), Contexts?:Table -> Listener
    local NewListener = Listener.new(Key, PressType, Contexts)
    table.insert(self._Listeners, NewListener)
    return NewListener
end

function Handler:RemoveListener(listener)
    local Index = betterTable.find(self._Listeners, listener)
    if Index then
        table.remove(self._Listeners, Index)
    end
end

function Handler:EnableContexts(Contexts)
    for i, Context in ipairs(Contexts) do
        table.insert(self._ActiveContexts, Context)
    end
end

function Handler:DisableContexts(Contexts)
    for i, Context in ipairs(Contexts) do
        local foundIndex = betterTable.find(self._ActiveContexts, Context)
        if foundIndex then
            table.remove(self._ActiveContexts, foundIndex)
        end
    end
end

function Handler:TriggerInput(k, pressType)
    for i, listener in pairs(self._Listeners) do
        if k == listener._K and pressType == listener._PressType then
            if listener._Contexts and betterTable.doContentsExistIn(listener._Contexts, self._ActiveContexts) then
                Listener.Signal:Fire()
            elseif not listener._Contexts then
                listener.Signal:Fire()
            end
        end
    end
end

return Handler
