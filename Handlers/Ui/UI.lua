local Manager = {}
Manager.__index = Manager

function Manager.new()
    local self = setmetatable({

    }, Manager)
    return self
end
