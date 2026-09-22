local InputManager = require("Handlers.Input").new()

local Listener = InputManager:CreateListener("k", "start", nil)

Listener.Signal:Connect(function ()
	print("k input recieved")
end)

function love.keypressed(k)
    InputManager:TriggerInput(k, "start")
end
