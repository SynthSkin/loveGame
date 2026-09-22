local InputManager = require("Handlers.Input").new()

function love.keypressed(k)
    InputManager:TriggerInput(k, "start")
end
