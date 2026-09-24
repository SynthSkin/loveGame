local InputManager = require("Handlers.Input").new()

function love.keypressed(k)
    InputManager:TriggerInput(k, "start")
end

function love.keyreleased(k)
	InputManager:TriggerInput(k, "end")
end

local StartListener = InputManager:CreateListener("q", "start")
StartListener.Signal:Connect(function ()
	print("input began")
end)

local EndListener = InputManager:CreateListener("q", "end")
EndListener.Signal:Connect(function ()
	print("input ended")
end)
