func = require('modules.func')
vox = require('modules.vox') 
input = require('modules.input')
graph = love.graphics
printl = love.graphics.print    
printf = love.graphics.printf
State = nil
function ChangeState(s)
    State = s
    State.load()
end
--
function love.load()
    --package.path
    print(package.path)
    love.window.setMode(500,500)
    love.graphics.setFont(love.graphics.newFont("UbuntuMono-R.ttf",20))
    vox.load()
    love.keyboard.setKeyRepeat(true)
end
--
function love.update(dt)
    vox.update(dt)
end
--
function love.draw()
    printf(input.get(),0,20,love.graphics.getWidth())
    vox.draw()
end
--
function love.textinput(t)
    input.add(t)
end
--
function love.keypressed(key)
    if key == "backspace" then input.remove() end
    if key == "return" then vox.say(input.get()) end
    if key == "delete" then input.clear() end
    print(key)
    if key ~= nil then 
        if string.find(key, "kp") then vox.play(key) end
    end
    --if key == "return" then input.clear() end
end